-------------------------
USE DATABASE dbprojetod;
-------------------------

/*
SELECT de todas as tabelas do banco de dados
*/
SELECT * FROM tb_usuario;
SELECT * FROM tb_endereco;
SELECT * FROM tb_tipopedido;
SELECT * FROM tb_perfil_designer;
SELECT * FROM tb_tipopagamento;
SELECT * FROM tb_exemplo;
SELECT * FROM tb_pedido;
SELECT * FROM tb_carteira;
SELECT * FROM tb_tipopedido_has_tb_designer;
SELECT * FROM tb_transacao;

/*
DESIGNERS: Retornar todos os usuários que são designers.
*/
SELECT tb_usuario.name FROM dtb_usuario INNER JOIN tb_endereco
ON tb_usuario.id_usuario = tb_endereco.tb_usuario_id_usuario INNER JOIN tb_perfil_designer
ON tb_endereco.tb_usuario_id_usuario = tb_perfil_designer.tb_endereco_tb_usuario_id_usuario;

/*
PEDIDOS EM ABERTO: Retornar todos os pedidos que ainda não começaram a ser atendidos
por nenhum designer.
*/
SELECT * FROM tb_pedido
WHERE tb_pedido.status = 'Aberto';

/*
PEDIDOS EM ATENDIMENTO: Retornar todos os pedidos que já estão sendo atendidos
*/
SELECT * FROM tb_pedido
WHERE tb_pedido.status = 'Atendimento';

/*
PEDIDOS EM ATRASO: Retornar todos os pedidos que estão sendo atendidos, porem atrasados.
*/
SELECT * FROM tb_pedido
WHERE tb_pedido.data_estimada > CURRENT_DATE();

/*
PEDIDOS POR TIPO: Retornar a quantidade de pedidos por categoria.
*/
SELECT tb_tipopedido.nome_tipo_pedido, COUNT(b_pedido.num_pedido) AS quantidade_pedidos
FROM tb_tipopedido LEFT JOIN tb_pedido
ON tb_tipopedido.id_tipo = tb_pedido.tb_tipopedido_id_tipo
GROUP BY tb_tipopedido.nome_tipo_pedido;

/*
FATURAMENTO POR MÊS: Retornar o total faturado por mês.
*/
SELECT SUM(tb_transacao) AS valor_total_faturado FROM tb_transacao
INNER JOIN tb_pedido ON tb_transacao.tb_pedido_num_pedido = tb_pedido.num_pedido
WHERE tb_pedido.status = 'Finalziado' AND MONTH(tb_pedido.data_fim) = 12