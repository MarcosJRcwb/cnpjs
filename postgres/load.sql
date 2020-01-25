create table cnaes (cnpj varchar(14) not null,cnae varchar(10) not null)

COPY cnaes (cnpj,cnae) 
FROM '/externo/cnae.csv' DELIMITER ';' CSV HEADER;

alter table cnaes add constraint pkcnaes primary key (cnpj,cnae);


create table detalhe (cnpj varchar(14) not null,
  matriz char(1) not null,
  razao_social varchar(150),
  nome_fantasia varchar(60) ,
  situacao char(2) not null,
  dt_situacao varchar(10) not null,
  inicio varchar(10) not null,
  cnae varchar (10),
  tipologr varchar (25),
  logradouro varchar(60),
  numero varchar(8),
  complemento varchar(160),
  bairro varchar(50),
  uf char(2) not null,
  municipio varchar(50),
  email varchar(115),
  capital varchar(20),
  porte char(2),
  simples char(2),
  mei char(2) );

COPY detalhe (cnpj,matriz,razao_social,nome_fantasia,situacao,data_situacao,inicio,cnae,tipologr,logradouro,numero,complemento,bairro,uf,municipio,email,capital,porte,simples,mei) 
FROM '/externo/det.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

alter table detalhe add data_inicio date;
update detalhe set data_inicio = to_date(inicio,'YYYYMMDD');
alter table detalhe drop column inicio;
alter table detalhe alter column data_inicio set not null;

alter table detalhe add data_situacao date;
update detalhe set data_situacao = to_date(dt_situacao,'YYYYMMDD');
alter table detalhe drop column dt_situacao;
alter table detalhe alter column data_situacao set not null;

alter table detalhe add constraint pkdetalhe primary key (cnpj);
create index i1detalhe on detalhe(cnpj,razao_social);
create index i2detalhe on detalhe(cnpj,nome_fantasia);

create table socios (
	cnpj varchar(14) not null,
	socio varchar(150) not null,
	cpfsocio varchar(14),
	qualif char(2),
	percentual varchar(8),
	entrada varchar(10),
	cpflegal varchar(14) );

COPY socios (cnpj,socio,cpfsocio,qualif,percentual,entrada,cpflegal) 
FROM '/externo/soc.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

alter table socios add data_entrada date;
update socios set data_entrada = to_date(entrada,'YYYYMMDD');
alter table socios drop column entrada;
alter table socios alter column data_entrada date not null;

alter table socios add constraint pksocios primary key (cnpj,socio,cpfsocio,cpflegal,data_entrada,qualif);

create index i1socios on socios (socio,cnpj,cpfsocio,cpflegal,data_entrada,qualif);

