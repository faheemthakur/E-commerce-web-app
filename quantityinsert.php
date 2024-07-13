<?php

$pname = $_GET ['pname'];
$psid = $_GET ['psid'];
$prodqua = $_GET ['prodqua'];
$con = mysqli_connect("localhost","root","","mini project");
if($con->connect_error)
{
    die("Failed to connect : ".$con->connect_error);
}

$stmt = $con->prepare("INSERT INTO orders(`customer_id`,`product_name`,
`quantity_purchased`,`seller_id`) VALUES ('4',?,?,?)");
$stmt->bind_param("sii",$pname,$prodqua,$psid);
$stmt->execute();
      echo"Contact sent successfully";
    
    
  ?>
  <html>
    <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
    <body>
      <br><br>
      <div class="container-fluid">
      <div class="row justify-content-evenly">
        <div class="col-3">
          
        </div>
        <div class="col-3 border border-4 pd-3">
          <h3 class="display-6 mt-4">Go to ELECTRONICS<h3>
    <a href="electronics.php"><button type="button" class="btn btn-success mt-5 pd-5">Click Here</button></a>
    <h3 class="display-6 mt-4">Go to MENS FASHION<h3>
    <a href="mens.php"><button type="button" class="btn btn-success mt-5 pd-5">Click Here</button></a>
    <h3 class="display-6 mt-4">Go to WOMENS FASHION<h3>
    <a href="womens.php"><button type="button" class="btn btn-success mt-5 pd-5">Click Here</button></a>
    </div>
    <div class="col-3">
      
    </div>

      </div>
      </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  </body>
</html>