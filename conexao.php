<?php

$host = "localhost";
$db_name = "db_sitevendas";
$username = "root";
$password = ""; 

try {
    
    $conexao = new PDO("mysql:host=$host;dbname=$db_name;charset=utf8", $username, $password);
    


    $conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Conexão com o banco de dados realizada com sucesso!";

} catch (PDOException $erro) {

    echo "Erro na conexão: " . $erro->getMessage();
}
?>