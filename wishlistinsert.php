<?php

$sno = $_GET ['sno'];
$pname = $_GET ['pname'];
$pid = $_GET ['pid'];
$sname = $_GET ['sname'];
$saddress = $_GET ['saddress'];
$scno = $_GET ['scno'];
$con = mysqli_connect("localhost","root","","mini project");
if($con->connect_error)
{
    die("Failed to connect : ".$con->connect_error);
}
$stmt = $con->prepare("INSERT INTO wishlist(`customer_name`,`product_name`,
`product_id`,`seller_shop`,`shop_location`,`store_contact_no`) VALUES ('Alex D Freed',?,?,?,?,?)");
$stmt->bind_param("sissi",$pname,$pid,$sname,$saddress,$scno);
$stmt->execute();

echo"Sent successfully";
?>