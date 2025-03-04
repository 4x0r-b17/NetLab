<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auth</title>
</head>
<body>
<?php
    $servername = "10.0.0.3";
    $username = "web-server";
    $password = "web-server-password";
    $dbname = "server_management";
    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error){
        die("[!] Connection failed: ".$conn->connect_errno);
    }else{
        session_start();

        if ($_SERVER["REQUEST_METHOD"] == "POST"){
            $username = trim($_POST["username"]);
            $password = trim($_POST["password"]);

            $stmt = $conn->prepare("select * from users where username = '?' and password_hash = MD5('?');");
            $stmt->bind_param("ss", $username, $password);
            $stmt->execute();
            $stmt->store_result();

            if($stmt->num_rows > 0){
                $_SESSION["user_id"] = $id;
                $_SESSION["role"] = $role;
                $_SESSION["username"] = $username;
                
                header("Location: dashboard.html")
                exit();
            }else{
                echo "[!] Invalid username or password"
            }
            $stmt->close();
        }
    }

    $conn->set_charset("utf8mb4");

    
    $conn->close();
?>
</body>
</html>