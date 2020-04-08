docker: pgadmin/ok.txt postgres/ok.txt python/ok.txt

all:    pgadmin/ok.txt \
        postgres/ok.txt \
        python/ok.txt \
	ok.dk \
        DADOS_ABERTOS_CNPJ.01.zip DADOS_ABERTOS_CNPJ.02.zip DADOS_ABERTOS_CNPJ.03.zip DADOS_ABERTOS_CNPJ.04.zip DADOS_ABERTOS_CNPJ.05.zip \
	DADOS_ABERTOS_CNPJ.06.zip DADOS_ABERTOS_CNPJ.07.zip DADOS_ABERTOS_CNPJ.08.zip DADOS_ABERTOS_CNPJ.09.zip DADOS_ABERTOS_CNPJ.10.zip \
	DADOS_ABERTOS_CNPJ.11.zip DADOS_ABERTOS_CNPJ.12.zip DADOS_ABERTOS_CNPJ.13.zip DADOS_ABERTOS_CNPJ.14.zip DADOS_ABERTOS_CNPJ.15.zip \
	DADOS_ABERTOS_CNPJ.16.zip DADOS_ABERTOS_CNPJ.17.zip DADOS_ABERTOS_CNPJ.18.zip DADOS_ABERTOS_CNPJ.19.zip DADOS_ABERTOS_CNPJ.20.zip \
	ok.fk ok.00

pgadmin/ok.txt: pgadmin/config_local.py pgadmin/Dockerfile pgadmin/entrypoint.sh
	cd pgadmin && sudo docker build . --tag pgadmin-mh:1.0
	sudo docker inspect --type=image pgadmin-mh:1.0
	touch pgadmin/ok.txt

postgres/ok.txt: postgres/Dockerfile
	cd postgres && sudo docker build . --tag postgres-mh:1.0
	sudo docker inspect --type=image postgres-mh:1.0
	touch postgres/ok.txt

python/ok.txt: python/Dockerfile
	cd python && sudo docker build . --tag python-mh:1.0
	sudo docker inspect --type=image python-mh:1.0
	touch python/ok.txt

DADOS_ABERTOS_CNPJ.01.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_01.zip --output DADOS_ABERTOS_CNPJ.01.zip
DADOS_ABERTOS_CNPJ.02.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_02.zip --output DADOS_ABERTOS_CNPJ.02.zip
DADOS_ABERTOS_CNPJ.03.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_03.zip --output DADOS_ABERTOS_CNPJ.03.zip
DADOS_ABERTOS_CNPJ.04.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_04.zip --output DADOS_ABERTOS_CNPJ.04.zip
DADOS_ABERTOS_CNPJ.05.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_05.zip --output DADOS_ABERTOS_CNPJ.05.zip
DADOS_ABERTOS_CNPJ.06.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_06.zip --output DADOS_ABERTOS_CNPJ.06.zip
DADOS_ABERTOS_CNPJ.07.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_07.zip --output DADOS_ABERTOS_CNPJ.07.zip
DADOS_ABERTOS_CNPJ.08.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_08.zip --output DADOS_ABERTOS_CNPJ.08.zip
DADOS_ABERTOS_CNPJ.09.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_09.zip --output DADOS_ABERTOS_CNPJ.09.zip
DADOS_ABERTOS_CNPJ.10.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_10.zip --output DADOS_ABERTOS_CNPJ.10.zip
DADOS_ABERTOS_CNPJ.11.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_11.zip --output DADOS_ABERTOS_CNPJ.11.zip
DADOS_ABERTOS_CNPJ.12.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_12.zip --output DADOS_ABERTOS_CNPJ.12.zip
DADOS_ABERTOS_CNPJ.13.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_13.zip --output DADOS_ABERTOS_CNPJ.13.zip
DADOS_ABERTOS_CNPJ.14.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_14.zip --output DADOS_ABERTOS_CNPJ.14.zip
DADOS_ABERTOS_CNPJ.15.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_15.zip --output DADOS_ABERTOS_CNPJ.15.zip
DADOS_ABERTOS_CNPJ.16.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_16.zip --output DADOS_ABERTOS_CNPJ.16.zip
DADOS_ABERTOS_CNPJ.17.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_17.zip --output DADOS_ABERTOS_CNPJ.17.zip
DADOS_ABERTOS_CNPJ.18.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_18.zip --output DADOS_ABERTOS_CNPJ.18.zip
DADOS_ABERTOS_CNPJ.19.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_19.zip --output DADOS_ABERTOS_CNPJ.19.zip
DADOS_ABERTOS_CNPJ.20.zip:
	curl http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_20.zip --output DADOS_ABERTOS_CNPJ.20.zip
MotivoSituaoCadastral.csv:
	curl http://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/DominiosMotivoSituaoCadastral.csv --output MotivoSituaoCadastral.csv
QualificaoResponsavel.csv:
	curl http://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/DominiosQualificaodoresponsvel.csv --output QualificaoResponsavel.csv
cnae.xlsx:
	curl https://concla.ibge.gov.br/images/concla/documentacao/CNAE_Subclasses_2_3_Estrutura_Detalhada.xlsx --output cnae.xlsx

define ziptocsv =
	echo `sudo docker ps -aqf "name=cnpjs_python-compose"` >ok.$(TMP)
	unzip -p -o $< | sudo docker exec -i `cat ok.$(TMP)` /bin/bash -c "cd externo && python3 extraicnpj.py"
endef

ok.00: MotivoSituaoCadastral.csv QualificaoResponsavel.csv ok.dk
	iconv -f WINDOWS-1252 -t UTF-8 MotivoSituaoCadastral.csv >1.csv
	iconv -f WINDOWS-1252 -t UTF-8 QualificaoResponsavel.csv >2.csv
	mv 1.csv postgres/MotivoSituaoCadastral.csv
	mv 2.csv postgres/QualificaoResponsavel.csv
	echo `sudo docker ps -aqf "name=cnpjs_postgres-compose"` >ok.00
	cat postgres/parte0.sql | sudo docker exec  --user postgres -i `cat ok.00` /bin/bash -c "cd /scripts && psql"
	rm postgres/MotivoSituaoCadastral.csv
	rm postgres/QualificaoResponsavel.csv

ok.0a: ok.00
	echo `sudo docker ps -aqf "name=cnpjs_postgres-compose"` >ok.00
	cat postgres/parte1.sql | sudo docker exec  --user postgres -i `cat ok.00` /bin/bash -c "cd /scripts && psql"
	touch ok.0a

ok.01: DADOS_ABERTOS_CNPJ.01.zip ok.0a
	$(eval TMP := 01)
	$(ziptocsv)

ok.02: DADOS_ABERTOS_CNPJ.02.zip ok.0a
	$(eval TMP := 02)
	$(ziptocsv)

ok.03: DADOS_ABERTOS_CNPJ.03.zip ok.0a
	$(eval TMP := 03)
	$(ziptocsv)

ok.04: DADOS_ABERTOS_CNPJ.04.zip ok.0a
	$(eval TMP := 04)
	$(ziptocsv)

ok.05: DADOS_ABERTOS_CNPJ.05.zip ok.0a
	$(eval TMP := 05)
	$(ziptocsv)

ok.06: DADOS_ABERTOS_CNPJ.06.zip ok.0a
	$(eval TMP := 06)
	$(ziptocsv)

ok.07: DADOS_ABERTOS_CNPJ.07.zip ok.0a
	$(eval TMP := 07)
	$(ziptocsv)

ok.08: DADOS_ABERTOS_CNPJ.08.zip ok.0a
	$(eval TMP := 08)
	$(ziptocsv)

ok.09: DADOS_ABERTOS_CNPJ.09.zip ok.0a
	$(eval TMP := 09)
	$(ziptocsv)

ok.10: DADOS_ABERTOS_CNPJ.10.zip ok.0a
	$(eval TMP := 10)
	$(ziptocsv)

ok.11: DADOS_ABERTOS_CNPJ.11.zip ok.0a
	$(eval TMP := 11)
	$(ziptocsv)

ok.12: DADOS_ABERTOS_CNPJ.12.zip ok.0a
	$(eval TMP := 12)
	$(ziptocsv)

ok.13: DADOS_ABERTOS_CNPJ.13.zip ok.0a
	$(eval TMP := 13)
	$(ziptocsv)

ok.14: DADOS_ABERTOS_CNPJ.14.zip ok.0a
	$(eval TMP := 14)
	$(ziptocsv)

ok.15: DADOS_ABERTOS_CNPJ.15.zip ok.0a
	$(eval TMP := 15)
	$(ziptocsv)

ok.16: DADOS_ABERTOS_CNPJ.16.zip ok.0a
	$(eval TMP := 16)
	$(ziptocsv)

ok.17: DADOS_ABERTOS_CNPJ.17.zip ok.0a
	$(eval TMP := 17)
	$(ziptocsv)

ok.18: DADOS_ABERTOS_CNPJ.18.zip ok.0a
	$(eval TMP := 18)
	$(ziptocsv)

ok.19: DADOS_ABERTOS_CNPJ.19.zip ok.0a
	$(eval TMP := 19)
	$(ziptocsv)

ok.20: DADOS_ABERTOS_CNPJ.20.zip ok.0a
	$(eval TMP := 20)
	$(ziptocsv)

cnae.csv: cnae.xlsx ok.00
	echo `sudo docker ps -aqf "name=cnpjs_postgres-compose"` >ok.00
	echo `sudo docker ps -aqf "name=cnpjs_python-compose"` >ok.20
	cp cnae.xlsx python
	sudo docker exec -i `cat ok.20` /bin/bash -c "cd externo && xlsx2csv -c utf-8 cnae.xlsx cnae.csv"
	tail -n +6 python/cnae.csv >postgres/cnae.csv
	rm python/cnae.xlsx
	touch cnae.csv

ok.csv: ok.00 cnae.csv
	cat postgres/parte2.sql | sudo docker exec  --user postgres -i `cat ok.00` /bin/bash -c "cd /scripts && psql"
	rm python/cnae.csv
	touch ok.csv

ok.fk: ok.01 ok.02 ok.03 ok.04 ok.05 ok.06 ok.07 ok.08 ok.09 ok.10 \
       ok.11 ok.12 ok.13 ok.14 ok.15 ok.16 ok.17 ok.18 ok.19 ok.20 \
       ok.00 ok.csv ok.0a
	cat postgres/parte3.sql | sudo docker exec  --user postgres -i `cat ok.00` /bin/bash -c "cd /scripts && psql"
	rm python/cnae.csv
	touch ok.fk

reload:
	if ls *.zip 1> /dev/null 2>&1; \
	then \
	  rm *.zip ; \
	fi;
	if ls ok.* 1> /dev/null 2>&1; \
	then \
	  rm ok.* ; \
	fi;
	touch ok.00
	touch cnae.csv
	touch ok.csv

clean:
	if ls pgadmin/ok.* 1> /dev/null 2>&1; \
	then \
	  rm pgadmin/ok.* ; \
	fi;
	if ls python/ok.* 1> /dev/null 2>&1; \
	then \
	  rm python/ok.* ; \
	fi;
	if ls postgres/ok.* 1> /dev/null 2>&1; \
	then \
	  rm postgres/ok.* ; \
	fi;
	if ls ok.* 1> /dev/null 2>&1; \
	then \
	  rm ok.* ; \
	fi;
	if ls *.zip 1> /dev/null 2>&1; \
	then \
	  rm *.zip ; \
	fi;
	if ls *.csv 1> /dev/null 2>&1; \
	then \
	  rm *.csv ; \
	fi;
	if ls *.xlsx 1> /dev/null 2>&1; \
	then \
	  rm *.xlsx ; \
	fi;
