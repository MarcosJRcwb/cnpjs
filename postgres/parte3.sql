alter table cnaes add constraint pkcnaes primary key (cnpj,cnae);
create index i1cnaes on cnaes (cnae,cnpj);

alter table detalhe add constraint pkdetalhe primary key (cnpj);
create index i1detalhe on detalhe(razao_social,cnpj);
create index i2detalhe on detalhe(nome_fantasia,cnpj);
create index i3detalhe on detalhe(situacao,cnpj);
create index i4detalhe on detalhe(cnae,cnpj);

alter table socios add constraint pksocios primary key (cnpj,socio,cpfsocio,cpflegal,data_entrada,qualificacao);

create index i1socios on socios (socio,cnpj,cpfsocio,cpflegal,data_entrada,qualificacao);
create index i2socios on socios (qualificacao,cnpj,socio,cpfsocio,cpflegal,data_entrada);

alter table detalhe add constraint detalhe_cnaeibge foreign key (cnae) references cnaeibge (cnae);
alter table cnaes add constraint cnaes_cnaeibge foreign key (cnae) references cnaeibge (cnae);
alter table detalhe add constraint detalhe_situacao foreign key (situacao) references situacao (codigo);
alter table detalhe add constraint detalhe_motivosituacao foreign key (motivo) references motivosituacao (codigo);
alter table socios add constraint socios_qualificacao foreign key (qualificacao) references qualificacao (codigo);

alter table socios add constraint socios_detalhe foreign key (cnpj) references detalhe (cnpj);
alter table cnaes add constraint cnaes_detalhe foreign key (cnpj) references detalhe (cnpj);

