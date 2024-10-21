

# PostgreSQL com NodeJS

Este é um pequeno projeto que implementa um banco de dados PostgreSQL com NodeJS através de uma API web criada com ExpressJS.

## Instalação

> **Nota:** Método para distribuições Linux.

### Pacotes necessários

- `apt install nodejs`  
- `apt install npm`  
- `apt install postgresql`

### Clonando o repositório

- `git clone https://github.com/vnscss/postgresql-in-nodejs`

### Instalando dependências

- `cd ./postgresql-in-nodejs`
- `npm install`

### Configurando o banco de dados

- `chmod +x ./scripts/configure.sh`
- `chmod +x ./scripts/dev-server.sh`
- `sudo su postgres`
- `./scripts/configure.sh`

## Inicializando o servidor web

> **Nota:** Método para distribuições Linux.

- `./scripts/dev-server.sh`

> O servidor estará rodando em: `localhost:1337`

## Modo de uso

Realize consultas ou inserções SQL pelo input, ou utilize as sugestões de consultas de usuários ou equipamentos.

Também é possível consultar o diagrama de Entidade-Relacionamento.
