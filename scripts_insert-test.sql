INSERT INTO `dbprojetod`.`tb_usuario`
(`id_usuario`,
`nome`,
`numero_cpf`,
`email`,
`telefone`)
VALUES
#(1, 'Thiago R', '01010101010', 'thiagor@email.com', '05513910101010'),
#(2, 'Tiago Sudden', '12312312311', 'sudden@email.com', '05513911111111');
#(NULL, 'Ailton Leite', '12345678910', 'ailton@email.com', '05511912345678'),
#(NULL, 'Thalita Chavez', '11223344556', 'thalita@email.com', '05512987654321'),
#(NULL, 'Danic Silva', '98765432100', 'danic@email.com', '05515900000000'),
(NULL, 'Josias J', '54321987600', 'josiasj@email.com', '05528955555555');


INSERT INTO `dbprojetod`.`tb_endereco`
(`nome_rua`,
`bairro`,
`numero`,
`complemento`,
`cidade`,
`estado`,
`cep`,
`tb_usuario_id_usuario`)
VALUES
#('Rua Aparecida', 'jardim', 7, NULL, 'Maua', 'Sao Paulo', '09400000', 3),
#('Rua Juventude', 'Mocca', 21, 1, 'Sul', 'Sao Paulo', '09410000', 4),
#('Av do estado', 'Franco', 55, NULL, 'Santo Andre', 'Sao Paulo', '09411111', 5),
#('Rua Alphavile', 'Alphavile', 1000, 2, 'Barra da Tijuca', 'Rio de Janeiro', '09500000', 1),
#('Rua Copacabana', 'Copacabana', 500, NULL, 'Rio de Janeiro', 'Rio de Janeiro', '09510000', 2),
('Rua Vila Pelicanos', 'Orvalho', 123, NULL, 'Goiania', 'Goias', '07510000', 6);

INSERT INTO `dbprojetod`.`tb_carteira`
(`saldo`)
VALUES
#(0.0),
#(150.0),
(0.0);


INSERT INTO `dbprojetod`.`tb_perfil_designer`
(`nota_geral`,
`tb_endereco_num_seq`,
`tb_endereco_tb_usuario_id_usuario`,
`tb_carteira_id_carteira`)
VALUES
#(0.0, 2, 4, 1),
(9.5, 3, 5, 2),
(0.0, 5, 2, 3);

INSERT INTO `dbprojetod`.`tb_tipopedido_has_tb_designer`
(`tb_tipopedido_id_tipo`,
`tb_designer_id_designer`)
VALUES
#(1, 1),
#(2, 1),
#(1, 2),
#(2, 2),
#(3, 2),
(1, 3),
(4, 3);

INSERT INTO `dbprojetod`.`tb_tipopedido`
(`nome_tipo_pedido`)
VALUES
('logotipo'),
('Banner'),
('Flyer/Folder'),
('Arte animada'),
('Web design'),
('Outro');

INSERT INTO `dbprojetod`.`tb_tipopagamento`
(`tipo_pagamento`)
VALUES
('Pix'),
('Boleto'),
('Credito'),
('Debito');

INSERT INTO `dbprojetod`.`tb_pedido`
(`status`,
`dimensao`,
`descricao`,
`data_inicio`,
`data_estimada`,
`data_fim`,
`tb_usuario_id_usuario`,
`tb_designer_id_designer`,
`tb_tipopedido_id_tipo`,
`tb_tipopagamento_id_tipopagamento`)
VALUES
#('Aberto', '2040x1080', 'Gostaria de um banner com meu nome em azul e fundo branco', '2023-12-03', NULL, NULL, 3, NULL, 2, 3),
#('Finalizado', '250x250', 'Uma logo para meu projeto D', '2023-11-30', '2023-12-03', '2023-12-03', 3, 2, 1, 1),
('Atendimento', '250x250', 'Preciso de uma logo para minha loja de bots', '2023-11-30', '2023-12-02', NULL, 1, 3, 1, 4);

INSERT INTO `dbprojetod`.`tb_exemplo`
(`link_midia`,
`tb_pedido_num_pedido`)
VALUES
#('https://example.com/image1.jpg', 2),
('https://example.com/logoex1.jpg', 3),
('https://example.com/logoex2.jpg', 3);

INSERT INTO `dbprojetod`.`tb_transacao`
(`valor`,
`tb_pedido_num_pedido`)
VALUES
(150.0, 2),
(150.0, 3);
