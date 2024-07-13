<?php
$con = mysqli_connect("localhost","root","","mini project");
if($con->connect_error)
{
    die("Failed to connect : ".$con->connect_error);
}
$sno=$_GET['sno'];
$query = "DELETE FROM wishlist WHERE sno='$sno'";
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