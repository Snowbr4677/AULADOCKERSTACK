<?php
echo"<h1>Docker funcionando!</h1>";
$host = 'aula_mariadb';

$user = 'root';
$pass = 'root';

$db = 'dbPokedex';
$conn = new mysqli($host, $user, $pass, $db);

$conn->set_charset('utf8mb4');

if ($conn->connect_error) {
    die('Erro: '. $conn->connect_error);
}

$busca = "";
if (isset($_GET['buscar'])) {
    $busca = $conn->real_escape_string($_GET['buscar']);
    $sql = "SELECT pokemon_id, nome, altura, peso, descricao FROM pokemon
    WHERE nome LIKE '%busca%'
    ORDER BY pokemon_id ASC";
} else{
    $sql = "SELECT pokemon_id, nome, altura, peso, descricao FROM pokemon ORDER BY pokemon_id ASC";
}
$result = $conn->query($sql);
echo "Conexão com o banco foi bem sucedido yeaaa!";
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Pokedex</title>
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
    <h2> Lista de Pokemon</h2>

    <form method="GET">
        <input type="text" name="buscar" placeholder="Buscar Pokemon" value="<?php echo $busca; ?>">
        <button type="submit">Buscar</button>
        <a href="index.php">Mostrar Todos</a>
    </form>

    <br>

    <table>
        <tr>
            <th>Id</th>
            <th>Nome</th>
            <th>Altura (m)</th>
            <th>Peso(kg)</th>
            <th>Descrição</th>
        </tr>
        <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/<?php echo $row['pokemon_id']; ?>.png" width="50">
        <?php
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . htmlspecialchars($row["pokemon_id"]) . "</td>";
                // Primeira letra em maiúsculo para o nome ficar bonito
                echo "<td><strong>" . ucfirst(htmlspecialchars($row["nome"])) . "</strong></td>";
                echo "<td>" . number_format($row["altura"], 2, ',', '.') . " m</td>";
                echo "<td>" . number_format($row["peso"], 1, ',', '.') . " kg</td>";
                echo "<td>" . htmlspecialchars($row["descricao"]) . "</td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='5'>Nenhum pokemon encontrado</td></tr>";
        }
        ?>

    </table>

</body>

</html>

<?php
$conn->close();
?>