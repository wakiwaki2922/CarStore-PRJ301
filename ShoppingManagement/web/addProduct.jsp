
<%@page import="sample.errors.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
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

            .login {
                border: 3px solid #f1f1f1;
                width: 100%;
                max-width: 400px;
                padding: 20px;
                text-align: center;
                background-color: rgba(255, 255, 255, 0.3);
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.3);
            }

            .loginForm {
                overflow: hidden;
            }

            .loginForm label {
                text-align: left;
                display: block;
                color: #fff;
                font-weight: bold;
                margin-top: 10px;
            }

            .loginForm input[type="text"],
            .loginForm input[type="number"] {
                width: calc(100% - 32px);
                padding: 16px;
                margin: 8px 0;
                display: block;
                border: none;
                border-radius: 0.25rem;
                background-color: rgba(59, 65, 72, 0.8);
                color: #eee;
                font-size: 16px;
                line-height: 1.5;
                outline: none;
                margin-left: 16px;
            }

            .loginForm input[type="text"]::placeholder,
            .loginForm input[type="number"]::placeholder {
                color: #ccc;
            }

            .textInput {
                text-align: left;
                margin-bottom: 10px;
                padding-left: 20px;
                padding-right: 20px;
            }

            .submit-reset {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 20px;
            }

            .submit-reset button[type="submit"] {
                flex: 1;
                padding: 14px 20px;
                margin: 8px 4px;
                border: none;
                border-radius: 0.25rem;
                cursor: pointer;
                text-transform: uppercase;
                background-color: #007BFF;
                color: #eee;
                font-weight: 700;
            }

            .error-message {
                color: #ff0000;
                font-size: 14px;
            }
        </style>
    </head>

    <body>
        <div class="login">
            <h1>Add a New Product</h1>
            <form class="loginForm" action="MainController" method="POST">
                <label>Product Name</label>
                <input type="text" name="nameProduct" id="nameProduct" required="">
                <span class="text-danger">${requestScope.ERROR_ADD.nameError}</span>
                <br>
                <label>Price</label>
                <input type="number" name="price" id="price" required="">
                <span class="text-danger">${requestScope.ERROR_ADD.priceError}</span>
                <br>
                <label>Quantity</label>
                <input type="number" name="quantity" id="quantity" required="">
                <span class="text-danger">${requestScope.ERROR_ADD.quantityError}</span>
                <div class="submit-reset">
                    <button type="submit" class="btn btn-primary" name="action" value="AddProduct">Add Product</button>
                </div>
            </form>
        </div>
        <footer>
            Made by Kyrov (GiangDQ)
        </footer>
    </body>

</html>
