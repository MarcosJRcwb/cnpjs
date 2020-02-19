# -*- coding: utf-8 -*-

import sys
import io
from FilaDeLinhas import FilaDeLinhas
import threading
from GravaCnpj import GravacaoPgCopy

def trata(texto):
  ok = texto
  ok = ok.replace(';',' ')
  ok = ok.replace('"',' ')
  ok = ok.replace('\0','')
  ok = ok.replace('\\','/')
  ok = ok.strip()
  while '  ' in ok:
    ok = ok.replace('  ',' ')
  return ok

def data(ymd : str) -> str:
  if ymd == '00000000':
    x = ''
  else:
    x = ymd[:4] + '-' + ymd[4:6] + '-' + ymd[6:8]
  return x

def processatipo1(regsd : FilaDeLinhas,line):
  cnpj = line[3:17]
  matriz = line[17]
  razsoc = trata(line[18:168])
  fantasia = trata(line[168:223])
  situac = line[223:225]
  dt_situac = line[225:233]
  dt_ini = line[367:375]
  cnae = line[375:382]
  tipolog = line[382:402]
  lograd = trata(line[402:462])
  numend = trata(line[462:468])
  comple = trata(line[468:624])
  bairro = trata(line[624:674])
  uf = line[682:684]
  munic = trata(line[688:738])
  email = trata(line[774:889])
  capit = line[891:905]
  capit = capit.strip()
  capit = capit[:-2]+'.'+capit[-2:]
  porte = line[905:907]
  simples = line[907:909]
  mei = line[924]
  linha = cnpj+';'+matriz+';'+razsoc.strip()+';'+fantasia.strip()+';'+situac+';'+data(dt_situac)+';'+data(dt_ini)+';'+cnae+';'+tipolog.strip()+';'+lograd.strip()+';'+numend.strip()+';'+comple.strip()+';'+bairro.strip()+';'+uf+';'+munic.strip()+';'+email.strip()+';'+capit+';'+porte+';'+simples+';'+mei+'\n'
  linha = linha.encode('UTF-8','ignore').decode('UTF-8')
  regsd.AdicionaLinha(linha)
  return
  
def processatipo2(regss : FilaDeLinhas,line,ultlinha2):
  cnpj = line[3:17]
  socio = trata(line[18:168])
  cpfsoc = line[168:182]
  qualif = line[182:184]
  dt_ent = line[189:197]
  cpfleg = line[270:281]
  linhasoc = cnpj+';'+socio.strip()+';'+cpfsoc+';'+qualif+';'+data(dt_ent)+';'+cpfleg+'\n'
  if linhasoc in ultlinha2:
    return ultlinha2
  ultlinha2 = ultlinha2 + ' ' + linhasoc
  linhasoc = linhasoc.encode('UTF-8','ignore').decode('UTF-8')
  regss.AdicionaLinha(linhasoc)
  return ultlinha2

def processatipo6(regsc : FilaDeLinhas,line):
  cnpj = line[3:17]
  cnae = line[17:710]
  cnae = cnae.strip()
  ult=''
  while len(cnae) > 0:
    cnaex = cnae[:7]
    cnae = cnae[7:]
    if cnaex in ult:
      continue;
    ult = ult + ' ' + cnaex
    if cnaex == '0000000' or cnaex == '9999999':
      break
    regsc.AdicionaLinha(cnpj+';'+cnaex+'\n')
  return

def tratar(origd,origs,origc,line,ultlinha2):
  if line[0] == '0':
    # registro header, nenhuma informação útil
    return ultlinha2

  if line[0] == '1':
    # detalhes
    processatipo1(origd,line)
    ultlinha2=''
    return ultlinha2

  if line[0] == '2':
    # sócios
    ultlinha2=processatipo2(origs,line,ultlinha2)
    return ultlinha2

  if line[0] == '6':
    processatipo6(origc,line)
    # CNAEs secundárias
    return ultlinha2

  if line[0] == '9':
    # registro trailler, nenhuma informação útil
    return ultlinha2

  return ultlinha2

def processark3200():
  fprinc=sys.stdin.buffer

  origd = FilaDeLinhas()
  origs = FilaDeLinhas()
  origc = FilaDeLinhas()

  outd = threading.Thread(name='detalhe',target=GravacaoPgCopy, args=(origd,'detalhe'))
  outs = threading.Thread(name='socios',target=GravacaoPgCopy, args=(origs,'socios'))
  outc = threading.Thread(name='cnaes',target=GravacaoPgCopy, args=(origc,'cnaes'))

  outd.start()
  outs.start()
  outc.start()

  ultlinha2 = ''
  linha = 1
  lineb = fprinc.readline()
  while lineb:
    line = lineb.decode('ISO-8859-15','ignore')
    ultlinha2=tratar(origd,origs,origc,line,ultlinha2)
    lineb = fprinc.readline()
    linha=linha+1

  origd.Acabou = True
  origs.Acabou = True
  origc.Acabou = True
  
processark3200()
