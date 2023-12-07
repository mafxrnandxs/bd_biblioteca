select Nome, Sobrenome, Logradouro, Numero, Bairro, CEP, Telefone_Contato, Telefone_Emergencia from Pessoa_Associada
join Endereco on Pessoa_Associada.Endereco_ID = Endereco.Endereco_ID
join Telefone on Pessoa_Associada.Telefone_ID = Telefone.Telefone_ID;

select avg(valor) as media_precos from plano;