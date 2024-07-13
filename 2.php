<?php
$con = mysqli_connect("localhost","root","","mini project");
if($con->connect_error)
{
    die("Failed to connect : ".$con->connect_error);
}
if(isset($_POST['ASC']))
{
  $asc_query ="SELECT product.`product_seller_id`,product.`image`,product.`Serial_no`,product.`product_name`,product.`product_id`,product.`product_subcat`,product.`price`,store.store_name,store.store_contact_no,store.store_address
  FROM product 
  INNER JOIN store
  ON product.product_seller_id = store.store_id
  WHERE`product_seller_id`='2'
  ORDER BY PRICE  DESC;";
  $result = $con->query($asc_query);
}
else if(isset($_POST['DESC']))
{
  $asc_query ="SELECT product.`product_seller_id`,product.`image`,product.`Serial_no`,product.`product_name`,product.`product_id`,product.`product_subcat`,product.`price`,store.store_name,store.store_contact_no,store.store_address
  FROM product 
  INNER JOIN store
  ON product.product_seller_id = store.store_id
  WHERE`product_seller_id`='2'
  ORDER BY PRICE  ASC;";
  $result = $con->query($asc_query);
}
else{
$sql = "SELECT product.`product_seller_id`,product.`image`,product.`Serial_no`,product.`product_name`,product.`product_id`,product.`product_subcat`,product.`price`,store.store_name,store.store_contact_no,store.store_address
FROM product 
INNER JOIN store
ON product.product_seller_id = store.store_id
WHERE`product_seller_id`='2';";
$result = $con->query($sql);
}
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
    <h3 class="display-6 text-center pb-5"><b>All Products sold by Atul.</b></h3>
    <form method="post">
    <p><b>Sort By:</b></p><br>
    <button type="submit" name="DESC" class="btn btn-success">Low to High</button>
    <button type="submit" name="ASC" class="btn btn-info">High to Low</button>
      </ul>
    </div> 
    <div class="row pt-5">
        <div class="col">
            <table class="table">
            <thead>
                  <tr>
                    <th scope="col">S no.</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Product Id</th>
                    <th scope="col">Product Seller Id</th>
                    <th scope="col">Product Subcategory</th>
                    <th scope="col">Seller Shop</th>
                    <th scope="col">Shop Location</th>
                    <th scope="col">Store Contact No.</th>
                    <th scope="col">Price</th>
                    <th scope="col">image</th> 
                    <th scope="col">View</th> 
                  </tr>
                </thead>
                <tbody>
                  <?php
                while($rows=$result->fetch_assoc())
                {
                  echo"
                  <tr>
                    <td>".$rows['Serial_no']."</td>
                    <td>". $rows['product_name']."</td>
                    <td>". $rows['product_id']."</td>
                    <td>". $rows['product_seller_id']."</td>
                    <td>". $rows['product_subcat']."</td>
                    <td>". $rows['store_name']."</td>
                    <td>". $rows['store_address']."</td>
                    <td>". $rows['store_contact_no']."</td>
                    <td>". $rows['price']."</td>
                    <td>"?><img src="<?php echo $rows['image'];?>"height="100"width="100"><?php echo"</td>
                    <td><a href='Product.php?psid=$rows[product_seller_id]&sno=$rows[Serial_no]&pname=$rows[product_name]&pid=$rows[product_id]&
                    sname=$rows[store_name]&saddress=$rows[store_address]&scno=$rows[store_contact_no]&price=$rows[price]'>View</td>
                  </tr>
                  ";
                }
            ?>                
                </tbody>
              </table>
            </div>
      </div>
      </form>
      <div class="row pt-3 pb-5 justify-content-evenly" style="background-color:#bed8ec">
        <div class="col-md-5 mt-5">
          <h4 class="display-6 pb-3 text-center">Contact Form</h4>
          <form>
            <div class="mb-3">
              <label for="exampleInputEmail1" class="form-label">Email address</label>
              <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
              <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <div class="mb-3">
              <label for="inputusername" class="form-label">Username</label>
              <input type="text" class="form-control" id="exampleInputPassword1">
            </div>
            <div class="mb-3">
              <label for="inputmessage" class="form-label">Message</label>
              <input type="Message" class="form-control" id="exampleInputmessgage">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
        </div>
        <div class="col-md-5 mt-5">
          <h4 class="display-6 text-center">Contact Details</h4>
          <p class="text-center mt-4">
            We provide service to the out of trend and nowadays out of business traditional, old school mode of operating shops by moving them online and giving them a platform to have their name and brand in the powerfull shpere of internet to maximise thier sales and services by reaching out to a broader audiance.<br>
            If you are interested to benifit from our services kindly fill out the form or contact us on the below given contact numbers and reach out so that we could help.<br>
            <br>
            </p>
            <p class="text-center"> <b>Phone No. : </b> 7006193339<p>
              <p class="text-center"><b>Email Id :</b> Faheem.thakur24@gmail.com</p>
      
          </p>
      
        </div>
      </div>
  </body>
  </html>