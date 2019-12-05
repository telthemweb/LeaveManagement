<?php 
include_once('../db.php'); 
session_start();
if(!isset($_SESSION['staff-user']) && $_SESSION['staff-user'] == ""){

    echo "<script>location.href = 'index.php';</script>";

}
$staff_id = $_SESSION['staff-id'];

 ?>
<!DOCTYPE html>
<html>
<head>
	<title>My Number of Leave</title>
	<link href="/LeaveManager//bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="/LeaveManager//css/font-awesome.css" rel="stylesheet">

<link href="/LeaveManager//css/main.css" rel="stylesheet">
</head>
<body>
<nav class="fixed-top navbar-expand-lg navbar-expand-xl navbar">

  <a class="navbar-brand mr-5" href="/LeaveManager"><i class="fa fa-leaf text-green"></i> <b style="font-size: 20px; font-weight: bold;">Leave</b> <span style="font-size: 20px; color: #c3cc18;font-weight: bold;">App</span></a>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-toggle" aria-controls="navbar-toggle" aria-label="Toggle navigation">

    <span class="fa fa-bars"></span>

  </button>

  <div class="collapse navbar-collapse" id="navbar-toggle">

    <ul class="navbar-nav">


    
            <li class="nav-item">

                <a class="nav-link" href="/LeaveManager/dashboard.php">
                <i class="fa fa-cog"></i> Dashboard</a>

            </li>

            <li class="nav-item">

                <a class="nav-link" href="/LeaveManager/dashboard.php?tab=1">
                <i class="fa fa-calendar"></i> Leaves</a>

            </li>

            <li class="nav-item">

                <a class="nav-link" href="/LeaveManager/dashboard.php?tab=4">
                <i class="fa fa-user-secret"></i> My Account</a>

            </li>

            <li class="nav-item"><a class="nav-link" title="staff-one" href="#">
                <i class="fa fa-user"></i> Staff-one</a></li><li class='nav-item'><a href='/LeaveManager/logout.php' class='nav-link'><i class='fa fa-sign-out'></i> Logout</a></li>
        </ul>
    </div>
</nav>
    <hr>
<br>

<div class="jumbotron text-center">
	<h3>My number of Leave days</h3><hr><br>
  <table class="table table-striped table-inverse table-hover">
  	<thead class="thead-defaultinverse bg-info">
      <?php 
$result = $db_con->query("SELECT staff_id,CONCAT(fname,CONCAT(' '),lname) AS fullname,email,staff_level,TIMESTAMPDIFF(day, date_registered,CURDATE()) AS NumofLeavedays FROM employee WHERE staff_id = '$staff_id'");
       ?>
  		<tr>
  			<th>Emp#</th>
  			<th>Fullname</th>
  			<th>E-mail Address</th>
  			<th>Staff Level</th>
  			<th>Number of Leave Days</th>
  		</tr>
  	</thead>
  	<tbody>
      <?php if($result->num_rows > 0){
       while ($row = $result->fetch_object()){
     ?>
  		<tr>
  			<td><?php echo $row->staff_id; ?></td>
      
        <td><?php echo $row->fullname; ?></td>
      
        <td><?php echo $row->email; ?></td>
      
        <td><?php echo $row->staff_level; ?></td>
        <td><?php echo $row->NumofLeavedays; ?></td>
  		  </tr>
    <?php }} ?>
  	</tbody>
  </table>
</div>

<footer class="footer">

<div class="row">
    <div class="col ml-5">


        <ul class="footer-list text-center">

            <li><a href="about.php">About Leave Manager</a></li>

            <li><a href="sitemap.php">Sitemap</a></li>

        </ul>

    </div>

    <div class="col">


        <ul class="footer-list text-center">

            <li><a href="members.php">Developer</a></li>

           

        </ul>

    </div>


</div>

<div class="row">

<div class="col-12">
    <h6 class="text-center mt-3">Leave Manager &copy; 2019. 
        All rights reserved</h6>

</div>
</footer>
<script src="js/jquery.js"></script>

    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="js/main.js"></script></body>
</body>
</html>