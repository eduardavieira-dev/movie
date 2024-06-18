<?php
require '../../conexao/conexao.php'; // Ajuste o caminho conforme necessário

header('Content-Type: application/json');

$response = array();

if (isset($_GET['id'])) {
    $id = intval($_GET['id']);

    $query = $pdo->prepare("SELECT * FROM filmes WHERE id = :id");
    $query->execute(['id' => $id]);

    if ($query->rowCount() > 0) {
        $filme = $query->fetch(PDO::FETCH_ASSOC);
        $response = [
            'nome' => $filme['nome'],
            'imagem' => $filme['imagem'],
            'genero' => $filme['genero'],
            'video' => $filme['video']
        ];
    } else {
        $response = null;
    }
} else {
    $response = null;
}

echo json_encode($response);
?>
