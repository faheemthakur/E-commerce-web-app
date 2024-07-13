<?php
$prodID = $_GET ['prodID'];
$image = $_GET ['image'];
$con = mysqli_connect("localhost","root","","mini project");
if($con->connect_error)
{
    die("Failed to connect : ".$con->connect_error);
}
      $stmt=$con->prepare (" UPDATE  product SET image=? WHERE product_id=$prodID;");
      $stmt->bind_param("s",$image);
      $stmt-> execute();
      echo"Contact sent successfully";
    ?>