all: DADOS_ABERTOS_CNPJ.01.zip DADOS_ABERTOS_CNPJ.02.zip DADOS_ABERTOS_CNPJ.03.zip DADOS_ABERTOS_CNPJ.04.zip DADOS_ABERTOS_CNPJ.05.zip \
	DADOS_ABERTOS_CNPJ.06.zip DADOS_ABERTOS_CNPJ.07.zip DADOS_ABERTOS_CNPJ.08.zip DADOS_ABERTOS_CNPJ.09.zip DADOS_ABERTOS_CNPJ.10.zip \
	DADOS_ABERTOS_CNPJ.11.zip DADOS_ABERTOS_CNPJ.12.zip DADOS_ABERTOS_CNPJ.13.zip DADOS_ABERTOS_CNPJ.14.zip DADOS_ABERTOS_CNPJ.15.zip \
	DADOS_ABERTOS_CNPJ.16.zip DADOS_ABERTOS_CNPJ.17.zip DADOS_ABERTOS_CNPJ.18.zip DADOS_ABERTOS_CNPJ.19.zip DADOS_ABERTOS_CNPJ.20.zip \
	det.csv soc.csv cnae.csv

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
	unzip -p -o $< >out.$(TMP)
	python3 extraicnpj.py out.$(TMP) 
	rm out.$(TMP) 
endef

det.01.csv soc.01.csv cnae.01.csv: DADOS_ABERTOS_CNPJ.01.zip
	$(eval TMP := 01)
	$(ziptocsv)

det.02.csv soc.02.csv cnae.02.csv: DADOS_ABERTOS_CNPJ.02.zip
	$(eval TMP := 02)
	$(ziptocsv)

det.03.csv soc.03.csv cnae.03.csv: DADOS_ABERTOS_CNPJ.03.zip
	$(eval TMP := 03)
	$(ziptocsv)

det.04.csv soc.04.csv cnae.04.csv: DADOS_ABERTOS_CNPJ.04.zip
	$(eval TMP := 04)
	$(ziptocsv)

det.05.csv soc.05.csv cnae.05.csv: DADOS_ABERTOS_CNPJ.05.zip
	$(eval TMP := 05)
	$(ziptocsv)

det.06.csv soc.06.csv cnae.06.csv: DADOS_ABERTOS_CNPJ.06.zip
	$(eval TMP := 06)
	$(ziptocsv)

det.07.csv soc.07.csv cnae.07.csv: DADOS_ABERTOS_CNPJ.07.zip
	$(eval TMP := 07)
	$(ziptocsv)

det.08.csv soc.08.csv cnae.08.csv: DADOS_ABERTOS_CNPJ.08.zip
	$(eval TMP := 08)
	$(ziptocsv)

det.09.csv soc.09.csv cnae.09.csv: DADOS_ABERTOS_CNPJ.09.zip
	$(eval TMP := 09)
	$(ziptocsv)

det.10.csv soc.10.csv cnae.10.csv: DADOS_ABERTOS_CNPJ.10.zip
	$(eval TMP := 10)
	$(ziptocsv)

det.11.csv soc.11.csv cnae.11.csv: DADOS_ABERTOS_CNPJ.11.zip
	$(eval TMP := 11)
	$(ziptocsv)

det.12.csv soc.12.csv cnae.12.csv: DADOS_ABERTOS_CNPJ.12.zip
	$(eval TMP := 12)
	$(ziptocsv)

det.13.csv soc.13.csv cnae.13.csv: DADOS_ABERTOS_CNPJ.13.zip
	$(eval TMP := 13)
	$(ziptocsv)

det.14.csv soc.14.csv cnae.14.csv: DADOS_ABERTOS_CNPJ.14.zip
	$(eval TMP := 14)
	$(ziptocsv)

det.15.csv soc.15.csv cnae.15.csv: DADOS_ABERTOS_CNPJ.15.zip
	$(eval TMP := 15)
	$(ziptocsv)

det.16.csv soc.16.csv cnae.16.csv: DADOS_ABERTOS_CNPJ.16.zip
	$(eval TMP := 16)
	$(ziptocsv)

det.17.csv soc.17.csv cnae.17.csv: DADOS_ABERTOS_CNPJ.17.zip
	$(eval TMP := 17)
	$(ziptocsv)

det.18.csv soc.18.csv cnae.18.csv: DADOS_ABERTOS_CNPJ.18.zip
	$(eval TMP := 18)
	$(ziptocsv)

det.19.csv soc.19.csv cnae.19.csv: DADOS_ABERTOS_CNPJ.19.zip
	$(eval TMP := 19)
	$(ziptocsv)

det.20.csv soc.20.csv cnae.20.csv: DADOS_ABERTOS_CNPJ.20.zip
	$(eval TMP := 20)
	$(ziptocsv)

det.csv: det.01.csv det.02.csv det.03.csv det.04.csv det.05.csv \
	det.06.csv det.07.csv det.08.csv det.09.csv det.10.csv \
	det.11.csv det.12.csv det.13.csv det.14.csv det.15.csv \
	det.16.csv det.17.csv det.18.csv det.19.csv det.20.csv 
	tail -n +2 det.02.csv >detb.csv
	tail -n +2 det.03.csv >>detb.csv
	tail -n +2 det.04.csv >>detb.csv
	tail -n +2 det.05.csv >>detb.csv
	tail -n +2 det.06.csv >detc.csv
	tail -n +2 det.07.csv >>detc.csv
	tail -n +2 det.08.csv >>detc.csv
	tail -n +2 det.09.csv >>detc.csv
	tail -n +2 det.10.csv >>detc.csv
	tail -n +2 det.11.csv >detd.csv
	tail -n +2 det.12.csv >>detd.csv
	tail -n +2 det.13.csv >>detd.csv
	tail -n +2 det.14.csv >>detd.csv
	tail -n +2 det.15.csv >>detd.csv
	tail -n +2 det.16.csv >dete.csv
	tail -n +2 det.17.csv >>dete.csv
	tail -n +2 det.18.csv >>dete.csv
	tail -n +2 det.20.csv >>dete.csv
	tail -n +2 det.19.csv >>dete.csv
	cp det.01.csv det.csv
	cat detb.csv >>det.csv
	cat detc.csv >>det.csv
	cat detd.csv >>det.csv
	cat dete.csv >>det.csv
#	rm detb.csv
#	rm detc.csv
#	rm detd.csv
#	rm dete.csv

soc.csv: soc.01.csv soc.02.csv soc.03.csv soc.04.csv soc.05.csv \
	soc.06.csv soc.07.csv soc.08.csv soc.09.csv soc.10.csv \
	soc.11.csv soc.12.csv soc.13.csv soc.14.csv soc.15.csv \
	soc.16.csv soc.17.csv soc.18.csv soc.19.csv soc.20.csv 
	cat soc.02.csv soc.03.csv soc.04.csv soc.05.csv \
	soc.06.csv soc.07.csv soc.08.csv soc.09.csv soc.10.csv \
	soc.11.csv soc.12.csv soc.13.csv soc.14.csv soc.15.csv \
	soc.16.csv soc.17.csv soc.18.csv soc.19.csv soc.20.csv |grep -v percentual >socb.csv
	cat soc.01.csv socb.csv >soc.csv
	rm socb.csv

cnae.csv: cnae.01.csv cnae.02.csv cnae.03.csv cnae.04.csv cnae.05.csv \
	cnae.06.csv cnae.07.csv cnae.08.csv cnae.09.csv cnae.10.csv \
	cnae.11.csv cnae.12.csv cnae.13.csv cnae.14.csv cnae.15.csv \
	cnae.16.csv cnae.17.csv cnae.18.csv cnae.19.csv cnae.20.csv 
	cat cnae.02.csv cnae.03.csv cnae.04.csv cnae.05.csv \
	cnae.06.csv cnae.07.csv cnae.08.csv cnae.09.csv cnae.10.csv \
	cnae.11.csv cnae.12.csv cnae.13.csv cnae.14.csv cnae.15.csv \
	cnae.16.csv cnae.17.csv cnae.18.csv cnae.19.csv cnae.20.csv |grep -v cnae >cnaeb.csv
	cat cnae.01.csv cnaeb.csv >cnae.csv
	rm cnaeb.csv
