alter table cnaes add constraint pkcnaes primary key (cnpj,cnae);

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

alter table socios add data_entrada date;
update socios set data_entrada = to_date(entrada,'YYYYMMDD');
alter table socios drop column entrada;
alter table socios alter column data_entrada date not null;

alter table socios add constraint pksocios primary key (cnpj,socio,cpfsocio,cpflegal,data_entrada,qualif);

create index i1socios on socios (socio,cnpj,cpfsocio,cpflegal,data_entrada,qualif);

