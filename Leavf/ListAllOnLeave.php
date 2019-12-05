
<?php include_once('../db.php');  ?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
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
                <a class="nav-link" href="/LeaveManager/admin.php">
                <i class="fa fa-cog"></i> Dashboard</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/LeaveManager/admin.php?tab=3">
                <i class="fa fa-refresh"></i> Pending Leaves</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/LeaveManager/admin.php?tab=1">
                <i class="fa fa-plus"></i> New Leave Type</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/LeaveManager/admin.php?tab=5">
                <i class="fa fa-arrows"></i> Assign Supervisor</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/LeaveManager/admin.php?tab=4">
                <i class="fa fa-user-secret"></i> My Account</a>
            </li>

              <li class="nav-item">
                <a class="nav-link" href="#">
                <i class="fa fa-user-secret"></i>On Leave</a>
            </li>

            <li class="nav-item">
                <a href="logout.php" class="nav-link">
                    <i class="fa fa-sign-out"></i>
                    Logout
                </a>
            </li>
        </ul>
    </div>
</nav>
    <hr>
 <div class="jumbotron text-center">
	<h3>All Employees on Leave</h3><hr><br>
  <table class="table table-striped table-inverse table-hover">
  	<thead class="thead-defaultinverse bg-info">
  		<?php 
$result = $db_con->query("SELECT staff_id,CONCAT(fname,CONCAT(' '),lname) AS fullname,email,staff_level,staus,TIMESTAMPDIFF(day, date_registered,CURDATE()) AS NumofLeavedays FROM employee WHERE staus = 'away'");
  		 ?>
  		<tr>
  			<th>Emp#</th>
  			<th>Fullname</th>
  			<th>E-mail Address</th>
  			<th>Staff Level</th>
  			<th>Number of Leave Days</th>
  			<th>Status</th>
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
  			<td><?php echo $row->staus; ?></td>
  		
  			
  		</tr>
  	<?php }} ?>

  	</tbody>

  </table>
  <br><br>
  <hr>
  <h3>All Available Employees</h3><hr><br>
  <table class="table table-striped table-inverse table-hover">
  	<thead class="thead-defaultinverse bg-success">
  			<?php 
$result = $db_con->query("SELECT staff_id,CONCAT(fname,CONCAT(' '),lname) AS fullname,email,staff_level,staus, TIMESTAMPDIFF(day, date_registered,CURDATE()) AS NumofLeavedays FROM employee WHERE staus = 'Active'");
  		 ?>
  		<tr>
  			<th>Emp#</th>
  			<th>Fullname</th>
  			<th>E-mail Address</th>
  			<th>Staff Level</th>
  			<th>Number of Leave Days</th>
  			<th>Status</th>
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
  			<td><?php echo $row->staus; ?></td>
  		</tr>
  	<?php }} ?>
  	</tbody>
  </table>
</div>

</body>
</html>
