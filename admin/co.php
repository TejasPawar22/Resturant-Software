<?php
include '../dbcon.php';
$rno = $_GET['rno'];
if (
    mysqli_query(
        $sql,
        "UPDATE `deluxacroom` SET `status`='un book' WHERE `roomno`='$rno'"
    )
) {
    echo '<script>alert("Check out Successfull !")</script>';
    header('location:roomdetails.php');
}
?>
