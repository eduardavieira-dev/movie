<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login de Usuário</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="container">
        <a href="../index.html">Voltar</a>
        <h2>Login de Usuário</h2>
        <form action="login_usuario.php" method="POST">
            <div class="form-group">
                <label for="nome_usuario">Nome de Usuário:</label>
                <input type="text" id="nome_usuario" name="nome_usuario" required>
            </div>
            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha" required>
            </div>
            <button type="submit" name="submit" value="Enviar" class="btn">Login</button>
        </form>
        <H1>login</H1>
    <form action="test.php" method="post">
        <input name="email" type="text" placeholder="Email" required><br><br>
        <input name="senha" type="password" placeholder="Senha" required>
        <br><br>
        <button type="submit" name="submit" value="Enviar">Enviar</button>
    </form>
    </div>
</body>
</html>
