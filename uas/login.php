<?php

include 'includes/connects.php';

if (!empty($session_login))
    header('location: admin.php');


if (isset($_POST['login']))
{
    $username = $_POST['username'];
    $password = $_POST['password'];

    $check_data = $connect->prepare("SELECT id FROM `user` WHERE username = ? AND password = ? AND status_aktif = 1");
    $check_data->execute([$username, $password]);

    if ($check_data->rowCount() == 0)   
        $msg = 'Username dan katasandi tidak tersedia.';

    else
    {
        $fetch_data = $check_data->fetch();

        $_SESSION['login'] = $fetch_data['id'];

        header('location: admin.php');
    }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        .login {
            max-width: 500px;
            width: 100%;
            position: absolute;
            top: 50%;
            left:50%;
            transform: translate(-50%, -50%);
            border-radius: 5px;
            border: 1px solid #ccc
        }
        
        .login  .content {
            padding: 20px;
        }

        .login .title {
            padding: 15px;
            text-align: center;
            font-size: 20px;

        }
    </style>
</head>
<body>
    
    <div class="login">
        <div class="title bg-dark text-white">WELCOME</div>
        <div class="content">
            <?=isset($msg) ? '<div class="alert alert-danger">'.$msg.'</div>' : '' ?>

            <form method="post">
                <b>Username</b>
                <input type="text" name="username" class="form-control form-control-lg">
                <br/>

                <b>Password</b>
                <input type="password" name="password" class="form-control form-control-lg"><br/>

                <div class="d-grid gap-2">
                    <button class="btn btn-dark" name="login">Login</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>