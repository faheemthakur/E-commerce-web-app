<?php
$con = mysqli_connect("localhost","root","","mini project");
if($con->connect_error)
{
    die("Failed to connect : ".$con->connect_error);
}
$prodID=$_GET['prodID'];
$query = "DELETE FROM product WHERE product_id='$prodID'";
$data=mysqli_query($con,$query);
if($data)
{
    echo"Deleted Successfully";
}
else
{
    echo"Deleted Failed to be deleted";
}
?>