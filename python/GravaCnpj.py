import psycopg2
from FilaDeLinhas import FilaDeLinhas

def GravacaoPgCopy(origem : FilaDeLinhas, tabela : str):
  cond = psycopg2.connect(host='postgres-compose', dbname="postgres", user="postgres", password="postgres")
  curd = cond.cursor()
  curd.copy_from(origem,tabela,sep=';',null='')
  cond.commit()
