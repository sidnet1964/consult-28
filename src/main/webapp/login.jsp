<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="css/bootstrap.css" rel="stylesheet" id="bootstrap-css">
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.js"></script>

    <link href="css/login.css" rel="stylesheet" id="login-css">
</head>
<body>
<div class="wrapper fadeInDown">
    <div id="formContent">
        <!-- Tabs Titles -->

        <!-- Icon -->
        <div class="fadeIn first">
            <img src="images/progwards-logo-bw-500x375.jpg" id="icon" alt="User Icon" />
        </div>

        <!-- Login Form -->
        <form method="post" action="show">
            <input type="text" id="login" class="fadeIn second" name="login" placeholder="login">
            <input type="text" id="password" class="fadeIn third" name="password" placeholder="password">
            <input type="submit" class="btn btn-primary btn-lg" value="Log In">
        </form>

        <!-- Remind Passowrd -->
        <div id="formFooter">
            <a class="underlineHover" href="#">Forgot Password?</a>
        </div>

    </div>
</div>
</body>
</html>


