<?php
$email = $_POST['email'];
$message = $_POST['message'];
$con = new mysqli("localhost","root","","mini project");
if($con->connect_error)
{
    die("Failed to connect : ".$con->connect_error);
}
else
{
$stmt = $con->prepare("INSERT INTO contact_form(`email`,`message`) VALUES (?,?)");
$stmt->bind_param("ss",$email,$message);
$stmt->execute();
echo"Contact sent successfully";
}
?>
