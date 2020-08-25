1)	create database exerc_fixacao;

create table Departamentos(
-> codigo_Depto int not null primary key,
-> nome varchar(30) not null,
-> localizacao varchar(30) not null;

create table Funcionarios(
-> codigo_Func int not null primary key,
-> codigo_Depto int not null foreing key,
-> primeiro_Nome varchar(20) not null,
-> segundo_Nome varchar(20) not null,
-> ultimo_Nome varchar(20) not null,
-> data_Nasc date not null,
-> cpf varchar(14) not null unique,
-> rg varchar(13) not null,
-> endereco varchar(60) not null,
-> cep varchar(10) not null,
-> cidade varchar(30) not null default “Itapira”,
-> fone_Res varchar(14) not null,
-> fone_Cel varchar(15) not null,
-> funcao varchar(30) not null,
-> salario dec(8,2) not null;

2)	select primeiro_Nome ultimo_Nome from Funcionarios ORDER BY ultimo_Nome;
3)	select * from Funcionarios ORDER BY cidade;
4)	select * from Funcionarios where salario>1000 ORDER BY primeiro_Nome segundo_Nome ultimo_Nome;
5)	select data_Nasc primeiro_Nome from Funcionarios ORDER BY data_Nasc DESC primeiro_Nome;
6)	select primeiro_Nome segundo_Nome ultimo_Nome fone_Res endereço cidade from Funcionarios ORDER BY ultimo_Nome primeiro_Nome  segundo_Nome;
7)	select SUM(salario) as Folha_Pag from Funcionarios;
8)	select COUNT(*) As Total_Func from Funcionarios;
9)	select AVG(salario) as Sal_Medio from Funcionarios;
10)	select primeiro_Nome segundo_Nome ultimo_Nome from Funcionarios where cidade = “Itapira” and função = “Recepcionista”;
