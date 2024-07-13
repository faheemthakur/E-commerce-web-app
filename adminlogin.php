<?php
$admin_username =$_POST['admin_username'];
$admin_password =$_POST['admin_password'];
//database connection
$con = new mysqli("localhost","root","","mini project");
if($con->connect_error)
{
    die("Failed to connect : ".$con->connect_error);
}
else
{
    $stmt = $con ->prepare("select * from admin where admin_username = ?");
    $stmt ->bind_param("s",$admin_username);
    $stmt->execute();
    $stmt_result = $stmt->get_result();
    if($stmt_result->num_rows > 0)
    {
        $data = $stmt_result->fetch_assoc();
        if($data['admin_password'] === $admin_password)
        {
            ini_set("display_errors","1");
            ini_set("display_startup_errors","1");
            error_reporting(E_ALL);
            //header("http://localhost/Project/index.html",true,301);
            //exit();
            echo '<script type="text/javascript">
            location.replace("http://localhost/Project/adminspage.html"); </script>';
        }
        else
        {
            echo '<script type="text/javascript">
            location.replace("http://localhost/Project/failed.html"); </script>';
            //header("http://localhost/Project/login.html",true,301);
            //exit();
        }
    }
    else
    {
        echo '<script type="text/javascript">
        location.replace("http://localhost/Project/failed.html"); </script>';
        //header("http://localhost/Project/login.html",true,301);
        //exit();
    }
}
?>