<?php
   $con=mysqli_connect("localhost","root","root","rest1");
   
   if(mysqli_connect_error())
   {
       echo"<script>alert('Cannot Connect');</script>";
       exit();
   }

?>