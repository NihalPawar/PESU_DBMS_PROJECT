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
                            /*else
                            {
                            echo("conection established!<br>");
                            }*/

$sql = "SELECT * from person where aadhar_no=".$_POST['adr'];
$result = mysqli_query($c, $sql);
echo "<div style=\"margin-left:20px;margin-bottom:20px;\">";
if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        echo "<h3>Person Details</h3>";
        echo "Name: " . $row["name"]. "<br>". "Aadhar No: ". $row["aadhar_no"]. "<br>".  "Age: " . $row["age"]."<br>";
            
    }
}

$sql = "select Fathers_name from Aadhar_card where aadhar_no=".$_POST['adr'];
$result = mysqli_query($c, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        echo "Father's Name: " . $row["Fathers_name"]."<br>";
    }
}

$sql = "SELECT * from person natural join master_details where aadhar_no=".$_POST['adr'];
$result = mysqli_query($c, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        echo "<h3>Identification Details</h3>";
        echo "Passport No: " . $row["passport_no"]. "<br>". "Driving Licence No: ". $row["Dl_no"]. "<br>".  "Ration card No:" . $row["ration_cardno"]."<br>";
        echo "Voter ID No: " . $row["voter_idno"]. "<br>";      
    }
}

$sql = "select property.Area,reg_no from person natural join property where aadhar_no=".$_POST['adr'];
$result = mysqli_query($c, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
       echo "<h3>Property</h3>";
        echo "Property Owned: " . $row["Area"]."<br>" ."Plot No: " . $row["reg_no"]."<br>";
    }
}

$sql = "select insurance.insurance_type,insurance.policy_no,insurance.amt_insured from person natural join insurance where aadhar_no=".$_POST['adr'];
$result = mysqli_query($c, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        echo "<h3>Insurance Details</h3>";
        echo "Insurance Type: " . $row["insurance_type"]. "<br>". "Policy No: " . $row["policy_no"]. "<br>".      "Amount Insured: " . $row["amt_insured"]. "<br>";
    }
}

$sql = "select Bank_account.Bank_Name,Bank_account.Branch,Bank_account.acc_type,Bank_account.acc_no from person natural join Bank_account where aadhar_no=".$_POST['adr'];
$result = mysqli_query($c, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        echo "<h3>Account Details</h3>";
        echo "Bank name: " . $row["Bank_Name"]."<br>". "Branch: " . $row["Branch"]. "<br>".  "Account type: " . $row["acc_type"]. "<br>".  "Account Number: " . $row["acc_no"]. "<br>";
    }
}

echo "</div>";
?>


<footer>Copyright &copy; DataWorld.com</footer>
</body>
</html>



