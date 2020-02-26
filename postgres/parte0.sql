create extension if not exists fuzzystrmatch;

create table cnaeibge (
	cnae varchar(7) null,
	divisao varchar(2) null,
	grupo varchar(4) null,
	classe varchar(7) null, 
	subclasse varchar(9) null,
	descricao varchar(250) not null,
	dummy varchar(1000) null);


create table motivosituacao (
	codigo char(02) not null,
	descricao varchar(150) not null );

create table situacao (
	codigo char(02) not null,
	descricao varchar(10) not null );

create table qualificacao (
	codigo char(02) not null,
	descricao varchar(150) not null );

COPY motivosituacao (codigo,descricao) 
FROM '/scripts/MotivoSituaoCadastral.csv' DELIMITER ';' CSV HEADER;

COPY qualificacao (codigo,descricao) 
FROM '/scripts/QualificaoResponsavel.csv' DELIMITER ';' CSV HEADER;

