<%@page import="sample.users.UserError"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <form action="MainController" method="POST" class="loginForm">
                        <h2 class="title">Sign up</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" name="userName" id="userSignUp" placeholder="Username" required="" />
                        </div>
                        <span class="error-message"><c:out value="${requestScope.ERROR.usernameError}" /></span>

                        <div class="input-field">
                            <i class="fas fa-envelope"></i>
                            <input type="text" name="name" id="userSignUp" placeholder="Name" required="" />
                        </div>

                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="passWord" id="passSignUp" placeholder="Password" required="" />
                        </div>

                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="confirm" id="passSignUp" placeholder="Confirm password" required="" />
                        </div>
                        <span class="error-message"><c:out value="${requestScope.ERROR.passwordError}" /></span>

                        <div class="submit-reset">
                            <button class="btn solid" type="submit" name="action" value="Signin">Signin</button>
                            <button class="btn solid" type="reset">Reset</button>
                        </div>
                    </form>
                    <span class="error-message"><c:out value="${requestScope.ERROR.error}" /></span>
                </div>
            </div>
        </div>
        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <div class="content">
                        <h3>Already have one?</h3>
                        <p>
                            Let sign in now!
                        </p>
                        <a href="login.html"> <button class="btn transparent" id="sign-in-btn">
                                Sign in
                            </button></a>
                    </div>
                    <img src="img/Login.svg" class="image" alt="" />
                </div>
            </div>
        </div>
    </body>
</html>

