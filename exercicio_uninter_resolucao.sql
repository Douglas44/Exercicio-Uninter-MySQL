/* Criando o Banco de Dados */
create database sistema;

/* Utilizando o Banco de Dados para realizar o DDL */
use sistema; 

/* Criação da Tabela */
create table cad_cidade (
	codigo int(2) not null auto_increment,
    nome varchar(30) not null,
    uf varchar(2) not null,
    primary key(codigo)
);

/* Inserindo os Dados na Tabela */
insert into cad_cidade(nome, uf) values('Curitiba', 'PR');
insert into cad_cidade(nome, uf) values('Rio de Janeiro', 'RJ');
insert into cad_cidade(nome, uf) values('Ponta Grossa', 'PR');
insert into cad_cidade(nome, uf) values('Sao Paulo', 'SP');
insert into cad_cidade(nome, uf) values('Ribeirão', 'SP');

/* Selecionando e mostrando todos os registros da tabela */
select * from cad_cidade;

/* Descrevendo o tipo das colunas da tabela */
describe cad_cidade;

alter table cad_cidade rename cidade; /* Renomeando a tabela */

/* Mostrando somente os registros das cidades do estado de SP (Condicional) */
select * from cidade where uf = 'SP';

/* Criação de uma nova tabela */
create table funcionario (
	codigo int(3) not null auto_increment,
    nome varchar(30) not null,
    endereco varchar(30) not null,
    numero int(6) not null,
    salario decimal(6,2) not null,
    codigo_cidade int(2) not null,
    primary key(codigo)
);

/* Adicionando uma nova coluna na tabela funcionario */
alter table funcionario add sexo char(1);

/* Inserindo dados a tabela Funcionario */
insert into funcionario(nome, endereco, numero, salario, codigo_cidade, sexo)
	values('Pedro', 'Rua Flores', 30, 1500.00, 2, 'M'),
		  ('Maria', 'Av Brasil', 400, 1960.70, 1, 'F'),
          ('Jose', 'Rua do João', 759, 3800.00, 4, 'F'),
          ('Marco', 'Av Santa Rita', 2, 3450.50, 2, 'M');

/* Mostrando somente a coluna nome e sexo da tabela funcionario */
select nome, sexo from funcionario;

/* Mostrando somente os funcionarios que tem salario maior que 2000 */
select nome from funcionario where salario > 2000;

/* Mostrando somente os funcionarios que tem salario menor que 1500 e do sexo masculino */
select nome from funcionario where salario < 1500 and sexo = 'M';

/* Funcionarios ordenados pelo salário(Do menor para o maior salario) */
select nome, salario from funcionario order by(salario) ASC;

/* Mostrando todos os funcionarios que tem o salario entre 2000 e 3000*/
select nome from funcionario where salario between 2000.00 and 3000.00;

/* Mostrando todos os funcionarios em que o nome começa com a letra M */
select nome from funcionario where nome like "M%";

/* Mostrando todos os funcionarios que tem a letra A no nome */
select nome from funcionario where nome like "%A%";

/* Mostrando todos os funcionarios que não começam com a letra M */
select nome from funcionario where nome not like "M%";

/* Adicionando uma nova coluna a tabela funcionario */
alter table funcionario add setor varchar(10); 

/* Listando o nome dos funcionarios ao lado do nome da cidade */
select nome, endereco from funcionario group by(nome);

/* Mostrando a media dos salarios */
select avg(salario) from funcionario;

/* Mostrando a media dos salarios agrupadas por sexo */ 
select avg(salario), sexo from funcionario group by(sexo);

/* Mostrando a soma dos salarios */
select sum(salario) from funcionario;

/* Mostrando a quantidade de registros na tabela endereço */
select count(endereco) from funcionario;

/* Espero que tenham gostado e compreendido. Mostrando algumas funcionalidades
	dos comandos DDL E DML. Onde criamos o banco de dados e também manipulamos as tabelas e registros :)
 */