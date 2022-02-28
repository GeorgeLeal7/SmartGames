<?php

require_once(SRC."bd/conexaoMySql.php");

function listarProdutos(){

    $sql = "select * from tblProduto order by idProduto desc";

    $conexao = conexaoMysql();

    $select = mysqli_query($conexao, $sql);
    return $select;
}

function listarCategorias(){

    $sql = "select * from tblCategoria order by idCategoria desc";

    $conexao = conexaoMysql();

    $select = mysqli_query($conexao, $sql);
    return $select;
}

function listarProdutoCategoria(){

    $sql = "select * from vwProdutoCategoria";

    $conexao = conexaoMySql();

    $select = mysqli_query($conexao, $sql);
    return $select;
}

function listarLojaProduto(){
    $sql = "select tblLojaProduto.idLojaProduto, 
                    tblProduto.nome as Produto, tblProduto.idProduto, 
                    tblLoja.nome as Loja, tblLoja.idLoja
                        from tblLojaProduto
                            inner join tblProduto on tblProduto.idProduto = tblLojaProduto.idProduto
                            inner join tblLoja on tblLoja.idLoja = tblLojaProduto.idLoja 
                                order by tblLojaProduto desc";

    $conexao = conexaoMySql();

    $select = mysqli_query($conexao, $sql);
    return $select;

}

?>