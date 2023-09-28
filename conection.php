<?php
$servername = "localhost";
$username = "adminLogin";
$password = "A(bq_B0eOW[/CxQt";
$database = "dbLogin";

// Crear una conexión a la base de datos
$mysqli = new mysqli($servername, $username, $password, $database);

// Verificar la conexión
if ($mysqli->connect_error) {
    die("Error de conexión: " . $mysqli->connect_error);
}

// Establecer el juego de caracteres a UTF-8 (opcional)
$mysqli->set_charset("utf8");

function getAllUsers($con){
    $query = "SELECT * FROM vwallusersdata";
    $result = $con->query($query);
    $row = $result->fetch_all();
    return $row;
}

function getAllUsers2($con){
    $query = "SELECT * FROM vwallusersdata";
    $result = $con->query($query);
    while($row = $result->fetch_assoc()){
        print_r($row);
        echo "<br>";
    }
}
function getAllUsers3($con){
    $query = "SELECT * FROM vwallusersdata";
    $result = $con->query($query);
    $row = $result->fetch_row();
    print_r($row);
}
function getAllUsers4($con){
    $query = "SELECT * FROM vwallusersdata";
    $result = $con->query($query);
    $row = $result->fetch_array();
    print_r($row);
}

?>