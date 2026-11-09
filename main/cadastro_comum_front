tro · PHP
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro - Loja e Amigos</title>
 
    <!--
    <style>
        body { font-family: Arial; background: #f2f2f2; }
        form { background: #fff; width: 300px; margin: 50px auto; padding: 20px; }
        input { width: 100%; padding: 8px; margin-bottom: 10px; }
        button { width: 100%; padding: 10px; background: #ff6a88; color: #fff; border: none; }
    </style>
    -->
</head>
<body>
 
    <h1>Loja e Amigos</h1>
    <h2>Cadastro</h2>
 
    <form method="POST">
        <label>Nome:</label><br>
        <input type="text" name="nome"><br><br>
 
        <label>E-mail:</label><br>
        <input type="email" name="email"><br><br>
 
        <label>Senha:</label><br>
        <input type="password" name="senha"><br><br>
 
        <button type="submit">Cadastrar</button>
    </form>
 
    <?php
    if ($_POST) {
        $nome  = $_POST['nome'];
        $email = $_POST['email'];
        $senha = $_POST['senha'];
 
        if ($nome == "" || $email == "" || $senha == "") {
            echo "<p>Preencha todos os campos!</p>";
        } elseif (strpos($email, "@") === false) {
            echo "<p>E-mail inválido!</p>";
        } elseif (strlen($senha) < 6) {
            echo "<p>A senha precisa ter pelo menos 6 caracteres!</p>";
        } else {
            echo "<p>Cadastro feito! Bem-vindo, " . htmlspecialchars($nome) . "!</p>";
        }
    }
    ?>
 
</body>
</html>
