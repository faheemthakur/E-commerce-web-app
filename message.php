<?php
$con = mysqli_connect("localhost","root","","mini project");
if($con->connect_error)
{
    die("Failed to connect : ".$con->connect_error);
}
$sql = "SELECT * FROM `contact_form`  ;";
$result = $con->query($sql);
$con->close();
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="style.css">
  </head>
  <body>

    <nav class="navbar sticky-top navbar-expand-sm navbar-dark" style="background-color: #415e74;">
      <div class="container-fluid">
        <a class="navbar-brand mt-1" href="index.html"><img src="logo.png" width="230" alt="SHOPPERS STOP"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="index.html">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Aboutus.html">About Us</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
              </svg>
                Account
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="Wishlist.html">Wish List</a></li>
                <li><a class="dropdown-item" href="orders.html">Orders</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="profile.html">Profile</a></li>
                <li><a class="dropdown-item" href="login.html">Log out</a></li>
              </ul>
            </li>
          </ul>
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Type..." aria-label="Search">
            <button class="btn btn-outline-dark" type="submit" style="background-color:rgb(255, 255, 255)"><a href="Search.html">Search</a></button>
          </form>
        </div>
      </div>
    </nav>
    <h3 class="=display-6 text-center "> Search Results.</h3>
    <div class="row pt-5">
        <div class="col">
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">Email</th>
                    <th scope="col">Message</th>               
                  </tr>
                  <?php
                while($rows=$result->fetch_assoc())
                {
            ?>
                </thead>
                <tbody>
                  <tr>
                    <td><?php echo $rows['email'];?></td>
                    <td><?php echo $rows['message'];?></td>
                  </tr>  
                  <?php
                }
            ?>             
                </tbody>
              </table>
            </div>
      </div>
      </body>
      </html>