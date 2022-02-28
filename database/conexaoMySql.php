<?php
/*=============================================================================
    Objetivo: Arquivo para configurar a conexão com o Banco de Dados MySQL
    Data: 27/02/2022
    Autor: George Leal
===============================================================================
*/

function conexaoMysql() 
{
    $server = (string) DB_SERVER;
    $user = (string) DB_USER;
    $password = (string) DB_PASSWORD;
    $database = (string) DB_DATABASE;

    if($conexao  = mysqli_connect($server, $user, $password, $database))
        return $conexao;
    else
    {
        echo(ERRO_CONEXAO_DB);
        return false;
    }    
}
?>