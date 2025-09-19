<?php
$localhost = "localhost"
$username = "root"
$password = " "
$dbname = "medical"


$conn =new mysqli ($localhost='localhost', $username = 'root', $password='', $dbname='medical');

$email = $_POST['email'];
$password = $_POST['password'];

$sql = "INSERT INTO staff (email, password) VALUES ('$email', '$password')";
$result = mysqli_query($conn,$sql);

if ($conn->query($sql)->num_rows > 0){
    echo "success";

} else {
    echo "Invalid email or password.";


mysqli_close();
}
?>

