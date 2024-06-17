<?php

    if(isset($_POST['submit']))
    {
        include_once('../php/conexao.php');

        $nome_usuario = $_POST ['nome_usuario'];
        $email = $_POST ['email'];
        $senha = $_POST ['senha'];
        

        $result = mysqli_query($conexao, "INSERT INTO admins(nome_usuario, email, senha) VALUES ('$nome_usuario', '$email', '$senha')");

        header('Location: login.php');
    }

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Usuário</title>
 <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="container">
        <a href="../index.html">Voltar</a>
        <h2>Cadastro de Usuário</h2>
        <form  action="cadastrar_usuario.php" method="POST">
            <div class="form-group">
                <label for="nome_usuario">Nome de Usuário:</label>
                <input type="text" id="nome_usuario" name="nome_usuario" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha" required>
            </div>
            <p>Já tem um cadastro?Faça o<a href="./login.html">Login</a></p>
            <button type="submit" name="submit" id="submit" class="btn">Cadastrar</button>
        </form>
    </div>
</body>
</html>

