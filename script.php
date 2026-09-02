<?php

$conn = new mysqli("aula_mariadb", "root", "root", "dbPokedex");

$result = $conn->query("SELECT pokemon_id, nome FROM pokemon");

while ($row = $result->fetch_assoc()) {

    $nome = strtolower($row['nome']);

    $json = file_get_contents(
        "https://pokeapi.co/api/v2/pokemon/$nome"
    );

    $dados = json_decode($json, true);

    $imagem = $dados['sprites']['front_default'];

    $stmt = $conn->prepare(
        "UPDATE pokemon SET imagem = ? WHERE pokemon_id = ?"
    );

    $stmt->bind_param(
        "si",
        $imagem,
        $row['pokemon_id']
    );

    $stmt->execute();
}

echo "Imagens atualizadas!";