create database exercicioInnerJoin;

use exercicioInnerJoin;

create table Cliente(
cpf int not null primary key,
nome varchar(60) not null,
dtNasc date not null);

create table Modelo(
codMod int not null primary key,
Desc_2 varchar(40) not null);

create table Veiculo(
placa varchar(8) not null primary key,
codMod int not null,
cpf int not null,
cor varchar(20) not null,
foreign key(codMod) references Modelo(codMod),
foreign key(cpf) references Cliente(cpf));

create table Patio(
num int not null primary key,
ender varchar(40) not null,
capacidade int not null);

create table Estaciona(
cod int not null primary key,
num int not null,
placa varchar(8) not null,
dtEntrada varchar(10) not null,
dtSaida varchar(10) not null,
hsEntrada varchar(10) not null,
hsSaida varchar(10) not null,
foreign key(num) references Patio(num),
foreign key(placa) references Veiculo(placa));

/*Exercício 3*/
select v.placa, c.nome from veiculo v inner join cliente c
on v.cpf = c.cpf;

/*Exercício 4*/
select c.cpf, c.nome, v.placa from cliente c inner join veiculo v
on c.cpf = v.cpf
WHERE v.placa = 'JJJ-2020';

/*Exercício 5*/
select v.placa, v.cor, e.cod from veiculo v inner join estaciona e
on v.placa = e.placa
WHERE e.cod = '1';

/*Exercício 6*/
select v.placa, v.cor, e.cod from veiculo v inner join estaciona e
on v.placa = e.placa
WHERE e.cod = '1';

/*Exercício 6*/
select p.ender, e.dtEntrada, e.dtSaida from patio p inner join estaciona e
on p.num = e.num
WHERE e.placa = 'JEG-1010';

/*Exercício 7*/
select count(distinct e.placa) from estaciona e, veiculo v  where
e.placa= v.placa and
v.cor = 'Verde';

/*Exercício 8*/	
select v.cpf, c.nome from veiculo v inner join cliente c
on v.cpf = c.cpf
WHERE v.codMod = '1';

/*Exercício 9*/	
select v.placa, e.hsEntrada, e.hsSaida from veiculo v inner join estaciona e
on v.placa = e.placa
WHERE v.codMod = '1';

/*Exercício 10*/
select p.num from patio p inner join estaciona e
on p.num = e.num
WHERE e.placa = 'JJJ-2020';	

/*Exercício 11*/
select c.nome  
from cliente c, veiculo v, estaciona e where
c.cpf = v.cpf and
v.placa = e.placa and
e.num = '2';

/*Exercício 12*/
select c.cpf  
from cliente c, veiculo v, estaciona e where
c.cpf = v.cpf and
v.placa = e.placa and
e.num = '3';

/*Exercício 13*/
select m.Desc_2  
from modelo m, veiculo v, estaciona e where
m.codMod = v.codMod and
v.placa = e.placa and
e.num = '2';

/*Exercício 14*/
select v.placa, c.nome, m.Desc_2
from modelo m, veiculo v, cliente c where
v.cpf = c.cpf and
v.codMod = m.codMod;
