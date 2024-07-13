<?php
$username = $_POST ['username'];
$con = mysqli_connect("localhost","root","","mini project");
if($con->connect_error)
{
    die("Failed to connect : ".$con->connect_error);
}

      $stmt=$con->prepare (" UPDATE  login_detail SET username=? WHERE customer_id ='4';");
      $stmt->bind_param("s",$username,);
      $stmt-> execute();
      echo"Contact sent successfully";
    ?>