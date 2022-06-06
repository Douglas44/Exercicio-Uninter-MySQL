/* Criando o banco de dados funcionarios */
create database funcionarios;

/* Acessando o banco de dados */
use funcionarios;

/* Criando a tabela */
create table infs(
	id int auto_increment not null primary key,
    nome varchar(40) not null,
    salario int not null,
    sexo varchar(1) not null
);

/* Inserindo os registros dentro da tabela */
insert into infs(nome, salario, sexo)
	values('Valdir', 1500, 'M'),
		  ('Fernanda', 3100, 'F'),
          ('Valdemiro', 3215, 'M'),
          ('Raquel', 900, 'F'),
          ('Bernando', 5500, 'M'),
          ('Amanda', 2500, 'F');

/* Criando uma procedure que me retorna o número de funcionários com salário menor que o informado */
create procedure func_minimo(in valor int)
	select concat('O número de funcionários que ganham menos que ', ' ', valor, ' é de: ', count(salario)) 
    as RESULTADO
    from infs where salario < valor;

/* Chamando a procedure e passando o parâmetro */
call func_minimo(5000);

/* Criando uma procedure que retorna o salário de um funcionário em específico */
create procedure func_salario(in codigo int)
	select concat('O salário do funcionário(a) ', ' ', nome, ' ', ' é de: R$', salario)
    as RESULTADO
    from infs where codigo = id;

/* Chamando a procedure e passando o parâmetro */
call func_salario(5);

/* Criando uma procedure que retorna o salário de um funcionário + 10% de aumento */
create procedure aumento(in codigo int)
	update infs set salario = salario+(salario*(10/100))
    where codigo = id;  
 
 /* Chamando a procedure e passando o parâmetro */ 
call aumento(6);

/* Apagando a procedure func_salario */
drop procedure func_salario;

/* Criando uma função que retorna a soma de dois valores */
create function soma(valor1 int, valor2 int)
	returns int deterministic
    return valor1+valor2;
    
/* Chamando a função e passando os parâmetros */
select soma(5, 6);

/* Criando uma função que retorna o salário de um funcionário em específico */
DELIMITER $$
create function salario(codigo_valor int)
	returns int deterministic
    return (select salario from infs where codigo_valor = id);
$$

/* Chamando a função e passando o parâmetro */
select salario(3);

/* Criando uma função que retorna o número de registros de acordo com o sexo especificado */
DELIMITER $$
create function func_sexo(codigo varchar(1))
	returns int deterministic
    return (select count(sexo) from infs where codigo = sexo);
$$

/* Chamando a função e passando o parâmetro */
select func_sexo('M');

/* Apagando a função soma */
drop function soma;

/* Criando uma tabela para guardar registros deletados */
create table guardar(
	codigo int auto_increment not null primary key,
    nome varchar(30) not null,
    salario decimal(6,2) not null
);

/* Criando uma TRIGGER que insere os registros deletados dentro da tabela GUARDAR */
DELIMITER $$
create trigger faz_backup before delete on infs
for each row
begin
insert into guardar(nome, salario) values(old.nome, old.salario);
end
$$

/* A TRIGGER não tem chamada. É tudo executado dentro do próprio sistema */

/* Criando uma procedure onde retorno o número de registros do sexo especificado.
	OBS: Dessa vez utilizando as estruturas condicionais
 */
DELIMITER $$
create procedure num_sexo(in codigo_sexo varchar(1))
	if (codigo_sexo = 'F') then
		select count(sexo) from infs where codigo_sexo = sexo;
	else if (codigo_sexo = 'M') then
		select count(sexo) from infs where codigo_sexo = sexo;
	end if;
	end if;
$$

/* Chamando a procedure e passando o parâmetro */
call num_sexo('F');

/* Criando uma procedure onde informo os funcionários que tem o sexo especificado */
DELIMITER $$
create procedure infs_sexo(in sexo_func varchar(1))
	if (sexo_func = 'F') then
		select nome from infs where sexo_func = sexo;
    else if (sexo_func = 'M') then
		select nome from infs where sexo_func = sexo;
    end if;
    end if;
$$

/* Chamando a procedure e passando o parâmetro */
call infs_sexo('M');

/* Apagando a TRIGGER faz_backup */
drop trigger faz_backup;
