<?php
$esn = $_POST ['esn'];
$esa = $_POST ['esa'];
$ecn = $_POST ['ecn'];
$id = $_POST ['id'];
$password = $_POST ['password'];
$con = mysqli_connect("localhost","root","","mini project");
if($con->connect_error)
{
    die("Failed to connect : ".$con->connect_error);
}

      $stmt=$con->prepare ("INSERT INTO store(`store_id`,`store_name`,`store_contact_no`,`store_address`,`password_store`) VALUES (?,?,?,?,?)");
      $stmt->bind_param("isiss",$id,$esn,$ecn,$esa,$password);
      $stmt-> execute();
      echo"Contact sent successfully";
    ?>