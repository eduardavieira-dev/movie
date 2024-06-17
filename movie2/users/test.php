<?php
session_start();

// se existir um cadastro submitado fazer a seguinte ação

    if(isset($_POST['submit']) && !empty($_POST['nome_usuario'] && !empty($_POST['senha'])))
    {
    // Acessa
    include_once('../php/conexao.php');
    $nome_usuario = $_POST['nome_usuario'];
    $senha = $_POST['senha'];

    // print_r('nome_usuario: '.$nome_usuario.'Senha: '.$senha.'');

    $sql = "SELECT * FROM usuarios WHERE nome_usuario = '$nome_usuario' and senha ='$senha'";

    $result = $conexao->query($sql);

    if(mysqli_num_rows($result) < 1)
    {
        // print_r('Não existe');
        unset($_SESSION['nome_usuario']);
        unset($_SESSION['senha']);
        // destroi todos esses dados atraves do unset
        header('Location: login.php');
        
    }else{
        // print_r('Existe');
        $_SESSION['nome_usuario'] = $nome_usuario;
        $_SESSION['senha'] = $senha;
        header('Location: sim.html');
    }

    // print_r($result);
    // mostra o resultado do bd

    }else{ 
    // Não acessa
        header('Location: login.php');
    }


?>