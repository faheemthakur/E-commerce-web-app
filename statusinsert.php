<?php
$order_no= $_GET ['order_no'];
$order_status= $_GET ['order_status'];
$con = mysqli_connect("localhost","root","","mini project");
if($con->connect_error)
{
    die("Failed to connect : ".$con->connect_error);
}
$stmt = $con->prepare("UPDATE  orders SET order_status=? WHERE order_no =$order_no");
$stmt->bind_param("s",$order_status);
$stmt->execute();
      echo"Contact sent successfully";
    ?>