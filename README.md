# cnpjs
Cadastro Nacional de Pessoas Jurídicas - conversor para formato consultável usando um banco de dados PostgreSQL local, Pgadmin para consultas e python para execução de scripts.

## Requisitos:

* docker
* docker-compose
* Linux Debian - infelizmente o docker no Windows não é compatível com os comandos bash nem os volumes criados via docker-compose. Sinta-se à vontade para criar uma adaptação.


## Montagem das imagens Docker:

`$ sudo make docker`

 A primeira execução vai demorar bastante para baixar e criar as imagens docker. Execuções posteriores serão BEM mais rápidas.

## Levantando o ambiente

`$ mkdir pgdata`

`$ sudo docker-compose up`

## Montagem da base

Depois que as máquinas docker estiverem iniciadas, continue em outra janela com

`$ sudo make`

## Processamento realizado

Todas as tabelas dependentes foram completadas e os dados foram limpos para ter integridade referencial entre todos os campos relacionados.
Nem todos os dados foram considerados relevantes para importação. Recomendo que pense bem se vale a pena buscar os dados faltantes desta base ou se é melhor consultar a informação atualizada no próprio site da receita.

## Uso

O banco de dados pode ser acessado localmente pelo PgAdmin em http:localhost.
Logins e senhas podem ser configurados no docker-compose.yml (login "a@b" senha "a").
O nome padrão do servidor (acessível localmente pelo pgadmin) é postgres-compose, login postgres, senha postgres.

Agradeço sugestões e informações sobre eventuais usos deste código.
