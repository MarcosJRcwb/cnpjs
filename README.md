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
 
