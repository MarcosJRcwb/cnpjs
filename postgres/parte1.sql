create  table cnaes (cnpj varchar(14) not null,cnae varchar(10) not null);

create  table detalhe (cnpj varchar(14) not null,
  matriz char(1) not null,
  razao_social varchar(150),
  nome_fantasia varchar(60) ,
  situacao char(2) not null,
  data_situacao date null,
  motivo char(2) not null,
  data_inicio date not null,
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

create  table socios (
	cnpj varchar(14) not null,
	socio varchar(150) not null,
	cpfsocio varchar(14),
	qualificacao char(2),
	data_entrada date,
	cpflegal varchar(14) );

