select * from Pessoa_Associada
join Endereco on Pessoa_Associada.Endereco_ID = Endereco.Endereco_ID
join Telefone on Pessoa_Associada.Telefone_ID = Telefone.Telefone_ID;
