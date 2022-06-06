# Desafio Backend Mobile2You

Criar uma API de serviço do catálogo de filmes. Para isso será necessário criar dois endpoints, um que faça a leitura de um arquivo CSV e crie os registros no banco de dados. E um segundo que liste todos os filmes cadastrados em formato JSON.

## Requisitos:

- [x] O desafio deve ser desenvolvido utilizando Ruby e tendo o Rails como framework.
- [x] Poderá optar pelos bancos de dados SQLite, Postgresql ou MongoDB.
- [x] Seguir o padrão API RESTful.
- [x] Ordenar pelo ano de lançamento.
- [x] Filtrar os registros por ano de lançamento, gênero, país, etc.
- [x] Garantir que não haja duplicidade de registros.
- [x] O projeto deve ser disponibilizado em um repositório aberto no GitHub.
- [x] A response do endpoint de listagem deve obedecer estritamente o padrão abaixo:

## Setup

#### pré-requisitos:

- ruby 3.1.2p20
- Rails 7.0.3
- Postgresql

Criar o arquivo `.env` de configuração do banco de dados.

```text
# Database

# Development
DATABASE_DEVELOPMENT_NAME="Movies_development"
DATABASE_DEVELOPMENT_URL="postgres://postgres:password@localhost:5432/Movies_development"

# Test
DATABASE_TEST_NAME="Movies_test"
DATABASE_TEST_URL="postgres://postgres:password@localhost:5432/Movies_test"

# Production
DATABASE_PRODUCTION_NAME="Movies_production"
DATABASE_PRODUCTION_URL="postgres://postgres:password@localhost:5432/Movies_production"
```

Como instalar?

```bash
$ bundle install

$ rails db:create
$ rails db:migrate

$ rails server
```

## Referência API

#### Obtenha todos os filmes.

```bash
$ curl http://localhost:3000/api/v1/catalogs
[
  {
    "id": "267a29a7-bd59-4a10-9a4c-6a878b1d7fce",
    "title": "Mr. Robot",
    "genre": "Movie",
    "country": "United States",
    "year": "2019",
    "published_at": "2019-06-24",
    "description": "Elliot, a cyber-security engineer suffering from anxiety, works for a corporation and hacks felons by night"
  },
]

# Filtrar os registros por ano de lançamento, gênero e país.
$ curl http://localhost:3000/api/v1/catalogs?year=2019

$ curl http://localhost:3000/api/v1/catalogs?year=2019
$ curl http://localhost:3000/api/v1/catalogs?published_at=2019-06-24
$ curl http://localhost:3000/api/v1/catalogs?genre=Movie
$ curl http://localhost:3000/api/v1/catalogs?country=United%20States
```

#### Obter um filme pelo UUID.

Informar o `UUID` do filme

```
$ curl http://localhost:3000/api/v1/catalogs/uuid
```

### Criar um novo filme

`published_at` é opicional

```
$ curl -d "movie[title]=Simpsons&movie[genre]=Movie&movie[country]=United States&movie[year]=2019&movie[description]=Homer accidentally pollutes a lake of Springfield" -X POST http://localhost:3000/api/v1/catalogs

```

### Atualizar um filme

Informar o `UUID` do filme para atualizar

```bash
$ curl -d "movie[title]=Simpsons&movie[genre]=TV show&movie[country]=United States&movie[year]=2019&movie[description=Homer accidentally pollutes a lake of Springfield&movie[published_at]=27-01-2007" -X PATCH http://localhost:3000/api/v1/catalogs/uuid
```

### Deletar um filme

Informar o `UUID` do filme para deletar

```bash
$ curl -X DELETE http://localhost:3000/api/v1/catalogs/267a29a7-bd59-4a10-9a4c-6a878b1d7fce
```

### Importar o arquivo para a API

```bash
$ curl -X POST -H "Content-Type: multipart/form-data" -F csv_file=@test/fixtures/movies.csv http://localhost:3000/api/v1/uploads
{"message":"File imported successfully"}
```
