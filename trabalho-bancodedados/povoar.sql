
-- populacao_tabelas.sql

-- Povoar endereco e editora
INSERT INTO `trabalho_bd`.`endereco` (`rua`, `cep`, `bairro`) VALUES
('Rua 1', '12345-678', 'Bairro A'),
('Rua 2', '98765-432', 'Bairro B');

INSERT INTO `trabalho_bd`.`editora` (`nome`) VALUES
('Editora X'),
('Editora Y');

-- Povoar cliente usando endereço existente
INSERT INTO `trabalho_bd`.`cliente` (`nome`, `email`, `rg`, `codigo_endereco`) VALUES
('João Silva', 'joao@email.com', '123456', 1),
('Maria Oliveira', 'maria@email.com', '789012', 2);

-- Povoar autores
INSERT INTO `trabalho_bd`.`autores` (`codigo`,`email`, `nome`) VALUES
('1','Maria@email.com', 'Maria'),
('2','Carlos@email.com', 'Carlos');

-- Povoar livros usando editora e autores existentes
INSERT INTO `trabalho_bd`.`livros` (`edicao`, `custo`, `titulo`, `codigo_editora`) VALUES
('Edição 1', 50.00, 'Livro 1', 1),
('Edição 2', 40.00, 'Livro 2', 2);

-- Povoar exemplares usando livros existentes
INSERT INTO `trabalho_bd`.`exemplares` (`data_aquisicao`, `codigo_livro`) VALUES
('2023-01-01', 1),
('2023-02-01', 2);

-- Povoar emprestimo usando clientes e exemplares existentes
INSERT INTO `trabalho_bd`.`emprestimo` (`codigo_cliente`, `codigo_exemplar`, `codigo_emprestimo`, `data`) VALUES
(1, 1, 1, '2023-03-01'),
(2, 2, 2, '2023-04-01');

-- Povoar autoria usando autores, livros e editoras existentes
INSERT INTO `trabalho_bd`.`autoria` (`codigo_autores`, `codigo_livro`, `codigo_editora`) VALUES
(1, 1, 1),
(2, 2, 2);


-- Povoar endereco e editora
INSERT INTO `trabalho_bd`.`endereco` (`rua`, `cep`, `bairro`) VALUES
('Rua 1', '12345-678', 'Bairro A'),
('Rua 2', '98765-432', 'Bairro B'),
('Avenida 3', '54321-876', 'Bairro C');

INSERT INTO `trabalho_bd`.`editora` (`nome`) VALUES
('Editora X'),
('Editora Y'),
('Editora Z');

-- Povoar cliente usando endereço existente
INSERT INTO `trabalho_bd`.`cliente` (`nome`, `email`, `rg`, `codigo_endereco`) VALUES
('João Silva', 'joao@email.com', '123456', 1),
('Maria Oliveira', 'maria@email.com', '789012', 2),
('Pedro Santos', 'pedro@email.com', '456789', 3),
('Ana Lima', 'ana@email.com', '987654', 1);

-- Povoar autores
INSERT INTO `trabalho_bd`.`autores` (`email`, `nome`) VALUES
('autor1@email.com', 'Autor 1'),
('autor2@email.com', 'Autor 2'),
('autor3@email.com', 'Autor 3');

-- Povoar livros usando editora e autores existentes
INSERT INTO `trabalho_bd`.`livros` (`edicao`, `custo`, `titulo`, `codigo_editora`) VALUES
('Edição 1', 50.00, 'Livro 1', 1),
('Edição 2', 40.00, 'Livro 2', 2),
('Edição 3', 60.00, 'Livro 3', 3);

-- Povoar exemplares usando livros existentes
INSERT INTO `trabalho_bd`.`exemplares` (`data_aquisicao`, `codigo_livro`) VALUES
('2023-01-01', 1),
('2023-02-01', 2),
('2023-03-01', 3),
('2023-04-01', 1);

-- Povoar emprestimo usando clientes e exemplares existentes
INSERT INTO `trabalho_bd`.`emprestimo` (`codigo_cliente`, `codigo_exemplar`, `codigo_emprestimo`, `data`) VALUES
(1, 1, 1, '2023-03-01'),
(2, 2, 2, '2023-04-01'),
(3, 3, 3, '2023-05-01'),
(4, 1, 4, '2023-06-01');

-- Povoar autoria usando autores, livros e editoras existentes
INSERT INTO `trabalho_bd`.`autoria` (`codigo_autores`, `codigo_livro`, `codigo_editora`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);
