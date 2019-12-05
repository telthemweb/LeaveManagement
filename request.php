<?php
include_once("connection.php");

include_once("functions.php");

if(isset($_POST['request'])){
    
    $errors = array();
    
    if(var_set($_POST['leave_start_date'])){
        
        $leave_start_date = strip_tags($_POST['leave_start_date']);
    }else{
        
        $errors[] = urlencode("Please select the start date of your leave");
    }

    if (var_set($_POST['recomnd'])) {
        $recomnd = strip_tags($_POST['recomnd']); 
    }else{
        
        $errors[] = urlencode("Please enter who recomend you to take a leave!");
    }
    
    
    if(var_set($_POST['leave_end_date'])){
        $leave_end_date = strip_tags($_POST['leave_end_date']);
    }else{
        
        $errors[] = urlencode("Please select end date of your leave");
    }
    
    $refined_date_start = intval(implode("", explode("-", $leave_start_date)));
    
    $refined_date_end = intval(implode("", explode("-", $leave_end_date)));
    
    $range = $refined_date_end - $refined_date_start;
    
    if($range <= 0){
        $errors[] = urlencode("Start date must be less than end date");
    }
    
    if(var_set($_POST['staff_id'])){
    
        $staff_id = strip_tags($_POST['staff_id']);
    
    }else{
        
        $errors[] = urlencode("An error occured. Try again".$db_con->error);
    }
    
    $date_requested = date("d-m-Y");
    
    if(var_set($_POST['leave_id'])){
        
        $leave_id = strip_tags($_POST['leave_id']);
        
        $res = query_db("SELECT id,leave_id,leave_type FROM leaves WHERE leave_id = $leave_id");
        
        if($res){
            
            $leave_type = $res->leave_type;
        }else{
        
            $errors[] = urlencode("An error occurred+".$db_con->error);
        }
    
        
    }else{
        
        $errors[] = urlencode("You must select leave type");
    }
    
    
    
    $r = $db_con->query("SELECT * FROM leave_applications WHERE leave_id = $leave_id
        AND staff_id = $staff_id");
    
    if($r->num_rows == 1){
        
        $errors[] = urlencode("You have already applied for this leave");
    }
    
    if(!$errors){

         $kr = $db_con->query("SELECT TIMESTAMPDIFF(day, date_registered,CURDATE()) as numofday FROM employee WHERE TIMESTAMPDIFF(day, date_registered,CURDATE())<30 AND staff_id = $staff_id");
    
    if($kr->num_rows ==1){
        $errors[] = urlencode("You days are below minimum leave days standard");
        
         // minimum
         redirect_user("dashboard.php?tab=6&error=".join($errors, urlencode("<br>")));
    }
       else{
        $stmt = $db_con->prepare("INSERT INTO leave_applications(leave_id,staff_id,
                leave_type,leave_start_date,leave_end_date,recomndedby,date_requested) 
                VALUES(?,?,?,?,?,?,?)");
        
        $stmt->bind_param("iisssss", $leave_id,$staff_id,$leave_type,
                $leave_start_date,$leave_end_date,$recomnd,$date_requested);
        
        $stmt->execute();
        
        echo "<h3>Error: $db_con->error</h3>";
        
        if($db_con->affected_rows == 1){
            
            $msg = urlencode("Leave request successfully sent please keep checking your email for approval! Bear with us. This will take 24 hour for proper processing.");

            //C:\laragon\bin\sendmail\output
            
            redirect_user("dashboard.php?tab=6&msg=$msg");
        } 
        }   
    }  else {
        redirect_user("dashboard.php?tab=6&error=".join($errors, urlencode("<br>")));
    }
}