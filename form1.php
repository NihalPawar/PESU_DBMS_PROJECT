<html>
<head>
    <title>
        ID management system
    </title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
     <style type="text/css">

        .large-header {
   position: relative;
   width: 100%;
   background: #111;
   overflow: hidden;
   background-size: cover;
   background-position: center;
   z-index: 1;
}

.demo .large-header {
   background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/499416/demo-bg.jpg");
}

.main-title {
   position: absolute;
   margin: 0;
   padding: 0;
   color: #F9F1E9;
   
   top: 50%;
   left: 50%;
   -webkit-transform: translate3d(-50%, -50%, 0);
   transform: translate3d(-50%, -50%, 0);
}

.demo .main-title {
   text-transform: uppercase;
   font-size: 16px;
  font-family: monospace;
}
 footer {
    padding: 1em;
    color: white;
    background-color: black;
    clear: left;
    text-align: center;
    position: fixed;
    bottom: 0%;
    width: 100%;
}

     </style>
</head>
<body>
    <div class="demo">
   <div class="content">
      <div id="large-header" class="large-header">
         <canvas id="demo-canvas"></canvas>
         <h1 class="main-title" >Person Identification Details</h1>
      </div>
   </div>
</div> 

<?php

                            $servername = "localhost";
                            $username = "root";
                            $password = "";
                            $dbname="Person_identification";

                            $c = mysqli_connect($servername,$username,$password,$dbname);//forth parameter is when you what to connect to only one database
                            if(!$c)
                            {
                            echo("conection failed!<br>");
                            }
                          /*  else
                            {
                            echo("conection established!<br>");
                            }*/


$sql="";
$sql.=$_POST["qry"];
echo "<h3 style=\"margin-left:20px;font-family:monospace\">Entered Query</h3>";
echo "<p style=\"margin-left:20px;\">" .$sql. "</p>" ."<br>";
$a=explode(",",trim(trim(substr(explode("from",$sql)[0],7)."\n")," "));
//var_dump($a);
$result = mysqli_query($c, $sql);
echo "<table style=\"margin-left:20px;margin-bottom:20px;\" border = '2'>";
if (mysqli_num_rows($result) > 0) {
    // output data of each row
    echo "</tr>";
    foreach($a as $x)
        {
            $z = explode("AS", $x);
            $b = trim($z[count($z) - 1], " ");
            $c = explode(".",$b);
            $i = count($c);
            $d = trim($c[$i - 1], " ");
           // echo "".trim($d, " ")."";
            echo "<th style=\"text-align:center;padding:7px;\">".trim($d, " ")."</th>";
        }
    echo "<tr>";
    while($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
       // var_dump($row);
        foreach($a as $x)
        {
            $z = explode("AS", $x);
            $b = trim(trim($z[count($z) - 1], " "),"\n");
            $c = explode(".",$b);
            $i = count($c);
            $d = trim(trim($c[$i - 1], " "), "\n");
           // echo "".trim($d, " ")."~~";
            echo "<td style=\"text-align:center;padding:7px;\">".$row[trim(trim($d, " "), "\n")]."</td>";
        }
        echo "</tr>";
    }
}
echo "</table>";



?>

<footer>Copyright &copy; DataWorld.com</footer>

</body>
</html>






