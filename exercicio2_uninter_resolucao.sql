/* Criando o banco de dados 'Aula' */
create database aula;

use aula;

/* Criando a tabela Usuario */
create table usuario(
	codigo int not null primary key,
    login int not null,
    senha int not null
);

/* Criando a tabela Cidade */
create table cidade(
	codigo int not null auto_increment primary key,
    nome varchar(40) not null
);

/* Criando um usuário chamado gerencia, com a senha 123 */
create user 'gerencia'@'localhost' identified by '123';

/* Atribuindo o direito de visualizar os dados da tabela cidade para o usuário Gerencia */
grant select on aula.cidade to 'gerencia'@'localhost';

/* Atribuindo todos os direitos ao usuário Gerencia */
grant all privileges on aula.cidade to 'gerencia'@'localhost';

/* Inserindo um registro dentro da tabela cidade */
insert into cidade(nome) values('Irati');

/* Criando um INDEX na tabela cidade e usuario, ambas na coluna codigo */
create index c on cidade(codigo);
create index u on usuario(codigo);

/* Criando a tabela Resumo Cadastro, e adicionando já um INDEX na coluna ID */
create table resumo_cadastro(
	id int not null auto_increment primary key,
    nome varchar(40) not null,
    sexo varchar(1) not null,
    index cadastro(id)
);

/* Removendo todos os direitos do User Gerencia */
revoke all privileges on aula.cidade from 'gerencia'@'localhost';

/* Deletando o User Gerencia */
drop user 'gerencia';

/* Verificando todos os Users criados, e existentes, dentro do banco de dados */
select user from mysql.user;