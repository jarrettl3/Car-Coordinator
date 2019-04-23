<HTML lang = "en_US">
    <head>
        <Title>Car Coordinator</Title>
        <style>
            .box{
                border: 20px solid black;
                background-color: darkslateblue;
                display: inline-block;
				width: 97.5%;
                height: 10%;
				text-align: center;
                font-style: italic;
                color: lightblue;
                text-shadow: 5px 5px darkblue;
                font-family: verdana;
                font-size: 70px;
                border-radius: 15px;
                border-left-color: mediumpurple;
                border-right-color: midnightblue;
                border-top-color: mediumpurple;
                border-bottom-color: midnightblue;
            }
            .formBox{
                display: inline-block;
                position: fixed;
                top: 20%;
                left: 40%;
                text-align: center;
                font-style: bold;
            }
            body{
                background-color: lightblue;
                border: 5px solid darkblue;
                border-radius: 20px;
            }
            
        </style>
    </head>
    <script>
        /*function login(){
            var username = document.getElementById("usrnm").value;
            var password = document.getElementById("psswd").value;
            if(username = ""){
                window.alert("Please input a valid username.");
            }else if(password = ""){
                window.alert("Please input a valid password.");
            }else{
                
            }
        }
        function createAccount(){
            
        }*/
    </script>
    
    <body>
                <?php
                ob_start();
                //echo "php script started";
                $servername = "avl.cs.unca.edu";
                $username = "jlefler";
                $password = "sql4you";

                //Create connection
                $conn = new mysqli($servername, $username, $password);
                


                //Check connection
                if($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }
                //echo "Connected successfully";
        
                //session_start();
        
                mysqli_select_db($conn,"jleflerDB");
        
                if($_SERVER["REQUEST_METHOD"] == "POST") {
                    // username and password sent from form 
      
                    $myusername = mysqli_real_escape_string($conn,$_POST['username']);
                    $mypassword = mysqli_real_escape_string($conn,$_POST['password']); 
      
                    $sql = "SELECT User_ID FROM User WHERE username = '$myusername' and password = '$mypassword'";
                    $result = mysqli_query($conn,$sql);
                    if (!$result) {
                        printf("Error: %s\n", mysqli_error($conn));
                        exit();
                    }
                    //printf("Got past error check");
                    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
                    $active = $row['active'];
      
                    $count = mysqli_num_rows($result);
      
                    // If result matched $myusername and $mypassword, table row must be 1 row
                    
                    $sql2 = "SELECT first_name FROM User WHERE username = '$myusername'";
                    $result2 = mysqli_query($conn, $sql2);
                    //$row2 = mysqli_fetch_array($result2,MYSQLI_ASSOC);
                    $row2 = mysqli_fetch_array($result);

		
                    if($count == 1) {
                        if (headers_sent()) {
                            $message = "Welcome, " . $row2['first_name']. "!";
                            //echo "<script type='text/javascript'>alert('$message');</script>";
                            die("<meta http-equiv=\"refresh\" content=\"0; url=/~jlefler/seniorproject/accountCode.php\" />");
                        }
                        else{
                            $message = "Welcome, " . $result2;
                            echo "<script type='text/javascript'>alert('$message');</script>";
                            exit(header("Location: /accountpage.html"));
                        }
                    }else {
                            $message = "invalid login";
                            echo "<script type='text/javascript'>alert('$message');</script>";
                        $error = "Your Login Name or Password is invalid";
                    }
                }
            ?>

        <h1></h1>
        <div class = "box">
            CAR COORDINATOR
        </div>
        <div class = "formBox">
            <form action = "" method = "post">
                  <label>Username: </label><input type = "text" name = "username" class = "contain"/><br /><br />
                  <label>Password: </label><input type = "password" name = "password" class = "contain" /><br/><br />
                  <input type = "submit" value = " Submit "/><br />
               </form>
        </div>
    </body>
</HTML>