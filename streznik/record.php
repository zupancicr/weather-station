<?php
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "database_name";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

//vreme.suhokranjske-novice.com/record.php?temperatura=2.0&vlaga=1.0&tlak=1005.0

$cas = date('Y-m-d H:i:s');
$temperatura = $_GET["temperatura"];
$vlaga = $_GET["vlaga"];
$tlak = $_GET["tlak"];

echo "$cas: T=$temperatura, Vl=$vlaga, Tl=$tlak<br>";

$sql = "INSERT INTO vreme (cas, temperatura, vlaga, tlak)
VALUES ('$cas', '$temperatura', '$vlaga', '$tlak')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully<br>";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
