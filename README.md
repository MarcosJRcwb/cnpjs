# cnpjs
Cadastro Nacional de Pessoas Jurídicas - conversor para formato consultável usando um banco de dados PostgreSQL local, Pgadmin para consultas e python para execução de scripts.

## Requisitos:

* docker
* docker-compose
* Linux Debian - infelizmente o docker no Windows não é compatível com os comandos bash nem os volumes criados via docker-compose. Sinta-se à vontade para criar uma adaptação.
* Um usuário com o nome postgres criado na máquina hospedeira. Para cri-alo digite

`$ sudo useradd postgres`

Depois siga as instruções. Use qualquer senha, de preferência uma senha muito segura.


## Execução:

`$ sudo make docker`

`$ sudo docker-compose up`

Depois que as máquinas docker estiverem iniciadas, continue em outra janela com

`$ sudo make`
 
 A primeira execução vai demorar bastante para baixar e criar as imagens docker. Execuções posteriores serão BEM mais rápidas.
