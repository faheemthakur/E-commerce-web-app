<?php
$prodID = $_GET ['prodID'];
$prodname = $_GET ['prodname'];
$prodstatus = $_GET ['prodstatus'];
$prodqua = $_GET ['prodqua'];
$prodloc = $_GET ['prodloc'];
$prodprice = $_GET ['prodprice'];
$con = mysqli_connect("localhost","root","","mini project");
if($con->connect_error)
{
    die("Failed to connect : ".$con->connect_error);
}

      $stmt=$con->prepare (" UPDATE  product SET product_id=?,product_name=?,
      product_status=?,product_qty=?,product_location=?,price=? WHERE product_id=$prodID;");
      $stmt->bind_param("issisi",$prodID,$prodname,$prodstatus,$prodqua,$prodloc,$prodprice);
      $stmt-> execute();
      echo"Contact sent successfully";
    ?>