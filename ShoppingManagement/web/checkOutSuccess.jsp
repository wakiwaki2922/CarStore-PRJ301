

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Out Success</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script> 
        <style>
            body {
                background-image: url(asset/profile-background.jpg);
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                height: 100vh;
                margin: 0;
                display: flex;
                align-items: center;
                justify-content: flex-start;
                text-align: left;
                color: #fff;
                font-family: Arial, sans-serif;
                padding-left: 200px;
            }
            .custom-navbar {
                width: 1440px;
                margin: 0 auto;
                padding: 7px 200px;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 1000;
                background-color: transparent !important;
            }

            .custom-navbar a {
                color: #fff;
                margin: 0 15px;
                text-decoration: none;
            }

            .custom-navbar a:hover {
                color: #ddd;
            }

            footer {
                position: fixed;
                bottom: 0;
                left: 0;
                right: 0;
                background-color: transparent !important;
                text-align: center;
                padding: 10px;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light custom-navbar" style="background-color: transparent !important;">
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="MainController?action=Shopping_Page">Shopping</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MainController?action=customer.jsp">Home</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container d-flex align-items-center justify-content-center vh-100">
            <div class="text-center">
                <img src="img/Ok.svg" alt="Ok"/>
                <h1>Checkout Successfully</h1>
            </div>
        </div>
        <footer>
            Made by Kyrov (GiangDQ)
        </footer>
    </body>
</html>
