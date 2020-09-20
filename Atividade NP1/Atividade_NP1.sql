-- Utilize a modelagem (Figura 1) e crie as estruturas SQL para as questões:

-- a) Mostre a média de salários da folha de pagamento.
      SELECT avg(salario) As MediadSalarios FROM funcionarios;

-- b) Mostre os nomes, a função dos funcionários e o departamento que ele trabalha. Agrupando pelo nome do departamento.
      SELECT f.primeiro_Nome, f.segundo_Nome, f.ultimo_Nome, f.funcao, d.nome FROM funcionarios f INNER JOIN departamentos d ON
      f.codigo_Depto = d.codigo_Depto
      GROUP BY(nome);

-- c) Mostre os nomes, o endereço, RG e CPF dos funcionários que trabalham no departamento de TI.
      SELECT f.primeiro_Nome, f.segundo_Nome, f.ultimo_Nome, f.endereco, f.rg, f.cpf, d.nome FROM funcionarios f INNER JOIN departamentos d ON
      f.codigo_Depto = d.codigo_Depto
     WHERE nome = 'TI';     

-- d) Mostre o nome e os salários dos funcionários que nasceram entre 01/01/1980 a 31/12/1990.
      SELECT primeiro_Nome, segundo_Nome, ultimo_Nome, salario FROM funcionarios 
      WHERE data_Nasc > '19800101' and data_Nasc < '19901231';

-- Utilize a modelagem (Figura 2) e crie as estruturas SQL para as questões:

-- a) Mostre os nomes dos países e seus continentes.
      SELECT name, Continent FROM country; 

-- b) Mostre os nomes dos países, região e a população dos países do continente ‘Europe’.
      SELECT Name, Region, Population FROM country
      WHERE Continent = 'Europe';       

-- c) Mostre a expectativa de vida das pessoas do continente ‘Asia'.
      SELECT LifeExpectancy FROM country
      WHERE Continent = 'Asia';       

-- d) Crie uma view que mostre os nomes dos países, seu presidente (HeadOfState), tipos de governo (GovernmentForm) 
--    e a população dos países do continente ‘South America’ e com população maior que 2000000.
      create view vw_PaisesSouthAm as
      select Name, HeadOfState, GovernmentForm, Population from country 
      where Continent = 'South America' 
      and Population > '2000000';

-- e) Crie uma view que mostre os nomes dos países, tamanho da sua área (surfaceArea) e seu idioma. 
--    Exibir somente os países com idioma ‘English’ como oficial. Ordenar pelo tamanho da área (da menor para maior). Mostre também como usar a View.
      create view vw_PaisesEnglish as
      SELECT c.Name, c.SurfaceArea, cl.Language FROM country c INNER JOIN countrylanguage cl ON 
      c.Code = cl.CountryCode
	  WHERE Language = 'English'
      AND   IsOfficial = 'T'
      ORDER BY SurfaceArea;

     -- Explicação de como utilizar a View
     -- Quando criamos uma view, criamos uma "tabela virtual" onde podemos exibir todos ou parte dos registros da tabela(s) original(ais).
     -- Neste caso especificamente, a solicitação foi para a criação de uma view para exibir parte dos dados de duas tabelas.
     -- Para listar o nome dos países, sua respectiva área e tendo ‘English’ como idioma oficial, consultar a view world.vw_paisesenglish
     -- da seguinte maneira:
     -- Selecionar o database 'world' como 'schema' padrão e digitar o comando abaixo;
     -- SELECT * FROM world.vw_paisesenglish;
     -- Não sendo necessário, a criação de comandos ou de joins pois com a criação da view, esta etapa já foi realizada. 

-- f) Altere a view do exercício anterior para incluir a porcentagem de pessoas que falam o idioma ‘English’ como oficial. Mostre também como usar a View.
      alter view vw_PaisesEnglish as
      SELECT c.Name, c.SurfaceArea, cl.Language, cl.Percentage FROM country c INNER JOIN countrylanguage cl ON 
      c.Code = cl.CountryCode
	  WHERE Language = 'English'
      AND   IsOfficial = 'T'
      ORDER BY SurfaceArea;      
      
      -- Foi incluído na view o campo da porcentagem de pessoas que falam o idioma ‘English’ como oficial.
      -- Para listar o nome dos países, sua respectiva área, tendo ‘English’ como idioma oficial e a porcentagem de pessoas que falam este idioma,
      -- consultar a view world.vw_paisesenglish da seguinte maneira:
      -- Selecionar o database 'world' como 'schema' padrão e digitar o comando abaixo;      
      -- SELECT * FROM world.vw_paisesenglish;
      -- Não sendo necessário, a criação de comandos ou de joins pois com a criação da view, esta etapa já foi realizada.       
      






