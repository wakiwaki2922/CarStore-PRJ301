
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-b2imEuI+T0VAm3siObZym/lA91d0yH04uZeC4Nlqmijs3CvLIp0qD67+Upq37Nm4" crossorigin="anonymous">
        <link rel="stylesheet" href="css/account_login.css" />
        <title>Sign in and Sign up</title>
    </head>

    <body>
        <div class="container">
            <div class="forms-container">
                <div class="signin-signup">

                    <!--login-->
                    <form action="MainController" method="POST" class="sign-in-form">
                        <h2 class="title">Sign in</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" name="userName" id="userLogin" placeholder="Username" required="" />
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="passWord" id="passLogin" placeholder="Password" required="" />
                        </div>
                        <div>
                            <button class="btn solid" type="submit" name="action" value="Login">Login</button>
                            <button class="btn solid" type="reset">Reset</button>
                        </div>
                    </form>

                </div>
            </div>
            <div class="panels-container">
                <div class="panel left-panel">
                    <div class="content">
                        <h3>New here?</h3>
                        <p>
                            What you waiting for? Sign up now!
                        </p>
                        <a href="signin.html">
                            <button class="btn " id="sign-up-btn">Sign up</button>
                        </a>
                    </div>
                    <img src="img/Login.svg" class="image" alt="" />
                </div>
            </div>
        </div>
    </body>
</html>
