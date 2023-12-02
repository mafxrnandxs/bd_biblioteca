SELECT * FROM emprestimo where data = "2023-03-01";

SELECT email FROM  autores where nome = "Autor 1";

select * from cliente
join endereco on cliente.codigo_endereco = endereco.idendereco
where bairro = "Bairro B";

select * from exemplares where data_aquisicao = "2023-01-01";

select codigo, email, nome from autores where nome = "Maria";

select codigo, nome, email from cliente where nome like "Maria%";

select nome from autores
join autoria on autores.codigo = autoria.codigo_autores
where codigo_livro = 1;

select avg(custo) as media_precos from livros;

select nome from livros 
join editora on livros.codigo = editora.codigo
where livros.codigo =1;

select titulo, data_aquisicao from livros 
join exemplares on livros.codigo = exemplares.codigo
where livros.codigo =1;
