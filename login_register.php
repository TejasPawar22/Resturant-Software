<?php
include('connection.php');
session_start();
//for login
if(isset($_POST['login']))
{
      
  $username=$_POST['username'];
  $password=md5($_POST['password']);

     $authlogin="SELECT * FROM login WHERE username='$username' and password='$password'";
   
     $run=mysqli_query($con,$authlogin);
     
     $count=mysqli_num_rows($run);
     $row=mysqli_fetch_array($run);
     if($count>0){
      $_SESSION['username']=$row['username'];
      $_SESSION['logged_in']=$row['id'];
      echo '<script>window.open("index.php","_self")</script>';
     }
     
      }
   



//for registeration
if(isset($_POST['register']))
{
    $user_exist_query="SELECT * FROM `login` WHERE `username`='$_POST[username]' OR `email`='$_POST[email]'";
    $result=mysqli_query($con,$user_exist_query);
    if($result)
    {
        if(mysqli_num_rows($result)>0){   // itwill be executed if username or email is already taken
            $result_fetch=mysqli_fetch_assoc($result);
            //username already registered
            if($result_fetch['username']==$_POST['username'])
            {
                echo"
                 <script>
                    alert('$result_fetch[username] Username Already Taken');
                    window.location.href='index.php';
                 </script>
                
                ";
            }
            else{
                //email already taken
                echo"
                 <script>
                    alert('$result_fetch[email] E-mail Already Taken');
                    window.location.href='index.php';
                 </script>
                
                ";
            }
        }
        else{ // it will be excuted if no one has taken username or email
            $password=md5($_POST['password']);
            $qry="INSERT INTO `login`(`full_name`, `username`, `email`, `password`) VALUES ('$_POST[fullname]','$_POST[username]','$_POST[email]','$password')";
            if(mysqli_query($con,$qry))
            {
                //if data insert successfully
                echo"
                   <script>
                      alert('Registeration Successfull');
                      window.location.href='index.php';
                  </script>
           
               ";

            }
            else{
                //if data cannot be inserted
                echo"
                  <script>
                       alert('Cannot run');
                       window.location.href='index.php';
                   </script>
           
                  ";
            }
        }
    }
    else{
        echo"
           <script>
             alert('Cannot run');
             window.location.href='index.php';
           </script>
           
           ";
    }
}
?>
