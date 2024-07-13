<?php
$password = $_POST ['password'];
$con = mysqli_connect("localhost","root","","mini project");
if($con->connect_error)
{
    die("Failed to connect : ".$con->connect_error);
}

      $stmt=$con->prepare (" UPDATE  login_detail SET login_password=? WHERE customer_id ='4';");
      $stmt->bind_param("s",$password);
      $stmt-> execute();
      echo"Contact sent successfully";
    ?>