insert into situacao (codigo,descricao) values ('01','NULA');
insert into situacao (codigo,descricao) values ('02','ATIVA');
insert into situacao (codigo,descricao) values ('03','SUSPENSA');
insert into situacao (codigo,descricao) values ('04','INAPTA');
insert into situacao (codigo,descricao) values ('08','BAIXADA');

insert into motivosituacao (codigo,descricao) values ('00','NENHUM');

update motivosituacao set codigo='0' || codigo where cast(codigo as int)<10;

alter table qualificacao add constraint pkqualificacao primary key (codigo);
alter table motivosituacao add constraint pkmotivosituacao primary key (codigo);
alter table situacao add constraint pksituacao primary key (codigo);

COPY cnaeibge (cnae,divisao,grupo,classe,subclasse,descricao,dummy ) 
FROM '/scripts/cnae.csv' DELIMITER ',' csv quote '"';

alter table cnaeibge drop column dummy;
delete from cnaeibge where cnae is not null or divisao is not null or grupo is not null;

update cnaeibge set subclasse=substring(classe,1,2) || substring(classe,4,4) || '/00' 
where subclasse is null and not exists(select 1 from cnaeibge c2 where c2.subclasse=substring(cnaeibge.classe,1,2) || substring(cnaeibge.classe,4,4) || '/00');

delete from cnaeibge where subclasse is null;

alter table cnaeibge drop column divisao;
alter table cnaeibge drop column grupo;
alter table cnaeibge drop column classe;
update cnaeibge set cnae=substring(subclasse,1,4) || substring(subclasse,6,1) || substring(subclasse,8,2);
alter table cnaeibge drop column subclasse;
alter table cnaeibge alter column cnae set not null;

insert into cnaeibge (cnae,descricao) values ('4713001','LOJAS DE DEPARTAMENTOS OU MAGAZINES');
insert into cnaeibge (cnae,descricao) values ('4713003','LOJAS DUTY FREE DE AEROPORTOS INTERNACIONAIS');
insert into cnaeibge (cnae,descricao) values ('1610201','SERRARIAS COM DESDOBRAMENTO DE MADEIRA');
insert into cnaeibge (cnae,descricao) values ('1610202','SERRARIAS SEM DESDOBRAMENTO DE MADEIRA');

insert into cnaeibge (cnae,descricao) values ('8888888','ATIVIDADE NÃO INFORMADA');
insert into cnaeibge (cnae,descricao) values ('4721101','Padaria e confeitaria com predominância de produção própria');
insert into cnaeibge (cnae,descricao) values ('7410201','DESIGN');
insert into cnaeibge (cnae,descricao) values ('9609201','Clínicas de estética e similares') ON CONFLICT DO NOTHING;
insert into cnaeibge (cnae,descricao) values ('9609203','Alojamento, higiene e embelezamento de animais');
insert into cnaeibge (cnae,descricao) values ('3250708', 'Fabricação de artefatos de tecido não tecido para uso odonto-médico-hospitalar');
insert into cnaeibge (cnae,descricao) values ('4541205','Comércio a varejo de peças e acessórios para motocicletas e motonetas');
insert into cnaeibge (cnae,descricao) values ('5611202','Bares e outros estabelecimentos especializados em servir bebidas.');

insert into qualificacao (codigo,descricao) values ('00','Qualificação não cadastrada');
update qualificacao set codigo='05' where codigo='5';
insert into qualificacao (codigo,descricao) values ('08','Conselheiro de administração');
insert into qualificacao (codigo,descricao) values ('09','Curador');
insert into qualificacao (codigo,descricao) values ('14','Mãe');
insert into qualificacao (codigo,descricao) values ('15','Pai');
insert into qualificacao (codigo,descricao) values ('20','Sociedade consorciada');
insert into qualificacao (codigo,descricao) values ('21','Sociedade filiada');
insert into qualificacao (codigo,descricao) values ('22','Sócio');
insert into qualificacao (codigo,descricao) values ('25','Sócio comanditário');
insert into qualificacao (codigo,descricao) values ('26','Sócio de indústria');
insert into qualificacao (codigo,descricao) values ('28','Sócio-gerente');
insert into qualificacao (codigo,descricao) values ('29','Sócio ou acionista incapaz ou relativamente incapaz (exceto menor)');
insert into qualificacao (codigo,descricao) values ('30','Sócio acionista menor');
insert into qualificacao (codigo,descricao) values ('37','Sócio pessoa jurídica domiciliado no exterior');
insert into qualificacao (codigo,descricao) values ('38','Sócio pessoa física domiciliado no exterior');
insert into qualificacao (codigo,descricao) values ('47','Sócio Pessoa Física residente no Brasil');
insert into qualificacao (codigo,descricao) values ('52','Sócio-administrador');
insert into qualificacao (codigo,descricao) values ('53','Sócio com capital');
insert into qualificacao (codigo,descricao) values ('57','Sócio Comanditário Pessoa Jurídica Domiciliado no Exterior');
insert into qualificacao (codigo,descricao) values ('63','Cotas em tesouraria');
insert into qualificacao (codigo,descricao) values ('66','Titular Pessoa Física Residente ou Domiciliado no Exterior');
insert into qualificacao (codigo,descricao) values ('67','Titular Pessoa Física Incapaz ou Relativamente Incapaz');
insert into qualificacao (codigo,descricao) values ('68','Titular Pessoa Física Menor');
insert into qualificacao (codigo,descricao) values ('69','Beneficiário Final');

insert into qualificacao (codigo,descricao) values ('70','Administrador Residente ou Domiciliado no Exterior');
insert into qualificacao (codigo,descricao) values ('71','Conselheiro de Administração Residente ou Domiciliado no Exterior');

insert into qualificacao (codigo,descricao) values ('72','Diretor Residente ou Domiciliado no Exterior'); 
insert into qualificacao (codigo,descricao) values ('73','Presidente Residente ou Domiciliado no Exterior');

insert into qualificacao (codigo,descricao) values ('74','Sócio-Administrador Residente ou Domiciliado no Exterior'); 
insert into qualificacao (codigo,descricao) values ('75','Fundador Residente ou Domiciliado no Exterior');

insert into qualificacao (codigo,descricao) values ('78','Titutal pessoa jurídica domiciliada no Brasil');
insert into qualificacao (codigo,descricao) values ('79','Titular pessoa jurídica domiciliada no exterior');

alter table cnaeibge add constraint pkcnaeibge primary key (cnae);

