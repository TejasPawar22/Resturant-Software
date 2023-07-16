<?php
include 'dbcon.php';
include 'header.php';
?>

<div class="hall-container">
  <div class="hall-img" style="height:100vh;background-image:url(img/partyhall.jpg);background-size:100% 100%;" >
  <div id="book-form" style="display:flex;justify-content:center;position:relative;top:100px;">
    <form action="bh.php" method="post" style="background:#fff;width:600px;">
      <center>
        <table>
          <tr>
            <th width="50%" height="50px">Check Hall Avaibility</th>

          </tr>
          <tr>
            <td width="50%" height="50px"><center><input type="date" name="hall"><input style="background:lightgreen;padding:5px;" type="submit" name="sub" value="Check" required></center></td>
          </tr>
        </table>
      </center>
    </form>
  </div>
  </div>
 
</div>

</body>
</html>