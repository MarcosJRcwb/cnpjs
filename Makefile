all: DADOS_ABERTOS_CNPJ.01.zip DADOS_ABERTOS_CNPJ.02.zip DADOS_ABERTOS_CNPJ.03.zip DADOS_ABERTOS_CNPJ.04.zip DADOS_ABERTOS_CNPJ.05.zip \
	DADOS_ABERTOS_CNPJ.06.zip DADOS_ABERTOS_CNPJ.07.zip DADOS_ABERTOS_CNPJ.08.zip DADOS_ABERTOS_CNPJ.09.zip DADOS_ABERTOS_CNPJ.10.zip \
	DADOS_ABERTOS_CNPJ.11.zip DADOS_ABERTOS_CNPJ.12.zip DADOS_ABERTOS_CNPJ.13.zip DADOS_ABERTOS_CNPJ.14.zip DADOS_ABERTOS_CNPJ.15.zip \
	DADOS_ABERTOS_CNPJ.16.zip DADOS_ABERTOS_CNPJ.17.zip DADOS_ABERTOS_CNPJ.18.zip DADOS_ABERTOS_CNPJ.19.zip DADOS_ABERTOS_CNPJ.20.zip \
	ok.01 ok.02 ok.03 ok.04 ok.05 ok.06 ok.07 ok.08 ok.09 ok.10 \
	ok.11 ok.12 ok.13 ok.14 ok.15 ok.16 ok.17 ok.18 ok.19 ok.20

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

define ziptocsv =
	echo `sudo docker ps -aqf "name=cnpjs_python-compose"` >ok.$(TMP)
	unzip -p -o $< | sudo docker exec -i `cat ok.$(TMP)` /bin/bash -c "cd externo && python3 extraicnpj.py"
endef

ok.01: DADOS_ABERTOS_CNPJ.01.zip
	$(eval TMP := 01)
	$(ziptocsv)

ok.02: DADOS_ABERTOS_CNPJ.02.zip
	$(eval TMP := 02)
	$(ziptocsv)

ok.03: DADOS_ABERTOS_CNPJ.03.zip
	$(eval TMP := 03)
	$(ziptocsv)

ok.04: DADOS_ABERTOS_CNPJ.04.zip
	$(eval TMP := 04)
	$(ziptocsv)

ok.05: DADOS_ABERTOS_CNPJ.05.zip
	$(eval TMP := 05)
	$(ziptocsv)

ok.06: DADOS_ABERTOS_CNPJ.06.zip
	$(eval TMP := 06)
	$(ziptocsv)

ok.07: DADOS_ABERTOS_CNPJ.07.zip
	$(eval TMP := 07)
	$(ziptocsv)

ok.08: DADOS_ABERTOS_CNPJ.08.zip
	$(eval TMP := 08)
	$(ziptocsv)

ok.09: DADOS_ABERTOS_CNPJ.09.zip
	$(eval TMP := 09)
	$(ziptocsv)

ok.10: DADOS_ABERTOS_CNPJ.10.zip
	$(eval TMP := 10)
	$(ziptocsv)

ok.11: DADOS_ABERTOS_CNPJ.11.zip
	$(eval TMP := 11)
	$(ziptocsv)

ok.12: DADOS_ABERTOS_CNPJ.12.zip
	$(eval TMP := 12)
	$(ziptocsv)

ok.13: DADOS_ABERTOS_CNPJ.13.zip
	$(eval TMP := 13)
	$(ziptocsv)

ok.14: DADOS_ABERTOS_CNPJ.14.zip
	$(eval TMP := 14)
	$(ziptocsv)

ok.15: DADOS_ABERTOS_CNPJ.15.zip
	$(eval TMP := 15)
	$(ziptocsv)

ok.16: DADOS_ABERTOS_CNPJ.16.zip
	$(eval TMP := 16)
	$(ziptocsv)

ok.17: DADOS_ABERTOS_CNPJ.17.zip
	$(eval TMP := 17)
	$(ziptocsv)

ok.18: DADOS_ABERTOS_CNPJ.18.zip
	$(eval TMP := 18)
	$(ziptocsv)

ok.19: DADOS_ABERTOS_CNPJ.19.zip
	$(eval TMP := 19)
	$(ziptocsv)

ok.20: DADOS_ABERTOS_CNPJ.20.zip
	$(eval TMP := 20)
	$(ziptocsv)
