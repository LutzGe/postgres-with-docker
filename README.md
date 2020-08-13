# Simples container rodando PostgreSQL + PgAdmin
### Projeto criado para facilitar a instalação do postgres.

## Dependências:
 - Docker
 - docker-compose
---
## Comandos:

**Ativando o container:**

Dentro da pasta src/:

`$ sudo docker-compose up -d`

**Acessando o PostgreSQL pelo terminal:**

`$ sudo docker exec -it postgres_docker psql`

---
#### Acessando PgAdmin:
*Esses valores podem ser alterados dentro do arquivo docker-compose*

[localhost:16543](https://localhost:16543)

user: email@gmail.com

password: postgres

## Créditos:
[@JpAudibert](https://github.com/JpAudibert)

[@LutzGe](https://github.com/LutzGe)
