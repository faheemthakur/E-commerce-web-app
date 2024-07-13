<?php
$prodID = $_POST['prodID'];
$prodname = $_POST['prodname'];
$prodcat = $_POST['prodcat'];
$subcat = $_POST['subcat'];
$sellerID = $_POST['sellerID'];
$prodstatus = $_POST['prodstatus'];
$prodqua = $_POST['prodqua'];
$prodloc = $_POST['prodloc'];
$prodprice = $_POST['prodprice'];
$image = $_POST['image'];
$con = new mysqli("localhost","root","","mini project");
if($con->connect_error)
{
    die("Failed to connect : ".$con->connect_error);
}
else
{
$stmt = $con->prepare("INSERT INTO product(`product_id`,`product_name`,`product_cat`,`product_subcat`,
`product_seller_id`,`product_status`,`product_qty`,`product_location`,`price`,`image`) 
VALUES (?,?,?,?,?,?,?,?,?,?)");
$stmt->bind_param("isssisisis",$prodID,$prodname,$prodcat,$subcat,$sellerID,$prodstatus,$prodqua,$prodloc,$prodprice,$image);
$stmt->execute();
echo"Contact sent successfully";
}
?>