PLEASE DO THIS BEFORE RUNNING THE PROJECT OR SKIP TO "#OTHERS"!!!

================================== #STEPS ======================================

#1 - Import the sample data (i.e leave_manager.sql) in LeaveManager/IMPORTANT STEPS!/ directory using either phpmyadmin or any database import tool. 

--------------------------------- #NOTES ---------------------------------------
 You have to create the database named "leave_manager", then select it before doing the importation. Also note that you have to create a user account with "groupone" and "12345678" as username and password respectively for the database.

You can also change these details to your database account details in the file "LeaveManager/connection.php" without having to create a new account.

--------------------------------------------------------------------------------

#2 - After successfully importing, navigate to the project main page where you'll be asked for your login details.

================================ Login Details =================================

To login as normal staff, the following details can be used:
    1. Username: "staff-one"
    2. Password: "00000000"


To login as supervisor, you can use:
    1. Username: "supervisor"
    2. Password: "12345678"


To login as admin, use the following details - but first navigate to LeaveManager/admin.php:
    1. Username: "admin"
    2. Password: "admin"



=================================== #OTHERS ====================================

Note that you'll still need to do whatever is outlined at the "#NOTES" section before continuing.

If you don't want to import the data using above steps, you can run the project in your browser. All the needed tables will be created and you may need to populate the admin table before attempting to login as admin. Also, you need to hash the password for the password field by using PHP's password_hash() function.

For example, if your password is "admin_123@e/$r" you can hash it by:
    
    $password = password_hash("admin_123@e/$r",PASSWORD_DEFAULT);

The variable $password now holds this password and you can echo/print it using PHP, then copy and insert it into the admin password field.

You'll also need to register as a normal staff before you can login as staff. When you register as staff, you'll need to be approved by the admin. To approve yourself after creating a staff account:
1. Logout of your account
2. Login as admin by going to "LeaveManager/admin.php" in your browser and using the details you created for your admin account
3. Use Approve Registered Staff tab to approve yourself
