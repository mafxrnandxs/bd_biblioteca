select Nome, Sobrenome, Logradouro, Numero, Bairro, CEP, Telefone_Contato, Telefone_Emergencia from Pessoa_Associada
join Endereco on Pessoa_Associada.Endereco_ID = Endereco.Endereco_ID
join Telefone on Pessoa_Associada.Telefone_ID = Telefone.Telefone_ID;

select * from Pessoa_Associada
join Treino on pessoa_associada.Pessoa_Associada_ID = treino.Pessoa_Associada_ID
where treino.Modalidade_ID is not null and treino.Horario_ID is not null;

select pa.* from Pessoa_Associada pa
left join Treino t on pa.Pessoa_Associada_ID = t.Pessoa_Associada_ID
where t.Modalidade_ID is not null;

select p.Nome_plano, COUNT(pa.Pessoa_Associada_ID) as Quantidade_Associados from Plano p
left join Pessoa_Associada pa on p.Plano_ID = pa.Plano_ID
group by p.Plano_ID, p.Nome_plano;

select avg(valor) as media_precos from plano;

select PA.Nome as Nome_Associado, M.Nome_modalidade as Modalidade, PT.Nome as Nome_Treinador
from Pessoa_Associada PA
join Treino T on PA.Pessoa_Associada_ID = T.Pessoa_Associada_ID
join Modalidade M on T.Modalidade_ID = M.Modalidade_ID
left join Pessoa_Treinadora PT on T.Pessoa_Associada_ID = PT.Pessoa_Treinadora_ID;

create temporary table if not exists AssociadosComLetraA as
select CONCAT(PA.Nome, ' ', PA.Sobrenome) as Nome_Completo, CONCAT(E.Logradouro, ', ', E.Numero, ', ', E.Bairro, ', CEP: ', E.CEP) as Endereco_Completo,
    M.Nome_modalidade as Modalidade,
    H.Periodo as Turno_Treino
from Pessoa_Associada PA
join Treino T on PA.Pessoa_Associada_ID = T.Pessoa_Associada_ID
join Modalidade M on T.Modalidade_ID = M.Modalidade_ID
join Horario H on T.Horario_ID = H.Horario_ID
join Endereco E on PA.Endereco_ID = E.Endereco_ID
where PA.Nome like 'A%';

select * from AssociadosComLetraA;

create temporary table if not exists AssociadosComLetraS as
select CONCAT(PA.Nome, ' ', PA.Sobrenome) as Nome_Completo,
    CONCAT(E.Logradouro, ', ', E.Numero, ', ', E.Bairro, ', CEP: ', E.CEP) as Endereco_Completo,
    PL.Nome_plano as Nome_Plano,
    MD.Nome_modalidade as Modalidade,
    PL.Valor as Valor_Pago
from Pessoa_Associada PA
join Plano PL on PA.Plano_ID = PL.Plano_ID
join Treino T on PA.Pessoa_Associada_ID = T.Pessoa_Associada_ID
join Modalidade MD on T.Modalidade_ID = MD.Modalidade_ID
join Endereco E on PA.Endereco_ID = E.Endereco_ID
where PA.Nome like '%S%';

select * from AssociadosComLetraS;

create table if not exists ExemploSubconsultas (
    NomeCompleto VARCHAR(100),
    EnderecoCompleto VARCHAR(255),
    ModalidadeTreino VARCHAR(45),
    ValorPago DOUBLE
);

insert into ExemploSubconsultas (NomeCompleto, EnderecoCompleto, ModalidadeTreino, ValorPago)
select CONCAT(PA.Nome, ' ', PA.Sobrenome) as NomeCompleto,
    CONCAT(E.Logradouro, ', ', E.Numero, ', ', E.Bairro, ', CEP: ', E.CEP) as EnderecoCompleto,
    MD.Nome_modalidade as ModalidadeTreino,
    PL.Valor as ValorPago
from Pessoa_Associada PA
join Plano PL on PA.Plano_ID = PL.Plano_ID
join Treino T on PA.Pessoa_Associada_ID = T.Pessoa_Associada_ID
join Modalidade MD on T.Modalidade_ID = MD.Modalidade_ID
join Endereco E on PA.Endereco_ID = E.Endereco_ID;

select * from ExemploSubconsultas;