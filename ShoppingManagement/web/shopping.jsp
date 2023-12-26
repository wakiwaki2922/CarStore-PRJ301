<%@page import="sample.users.UserDTO"%>
<%@page import="sample.shopping.Cart"%>
<%@page import="java.util.Map"%>
<%@page import="sample.products.ProductDTO"%>
<%@page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
              crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <style>
            body {
                background-color: #333;
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

            .navbar-brand img {
                max-height: 40px;
                margin-right: 10px;
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

            .card {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                max-width: 300px;
                margin: auto;
                text-align: center;
                font-family: arial;
            }

            .price {
                color: grey;
                font-size: 22px;
            }

            .card button {
                border: none;
                outline: 0;
                padding: 12px;
                background-color: #333;
                color: white;
                cursor: pointer;
                width: 100%;
                font-size: 18px;
            }

            .card button:hover {
                opacity: 0.7;
            }

            .card button[value="Buy Now"] {
                background-color: #555;
            }

            .custom-container {
                min-height: 100vh;
            }
            .rounded-container {
                background-color: rgba(255, 255, 255, 0.5); 
                padding: 20px;
                border-radius: 20px; 
            }
        </style>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light custom-navbar" style="background-color: transparent !important;">
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <p class="btn btn-dark">
                            Hello
                            <c:if test="${sessionScope.LOGIN_USER != null}">
                                <a href='customer.jsp' class='text-white'>
                                    <c:out value="${sessionScope.LOGIN_USER.name}" />
                                </a>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_USER == null}">
                                <a href='login.html' class='text-white'>
                                    <c:out value="Guest" />
                                </a>
                            </c:if>
                        </p>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-dark" href="javascript:checkCart();">
                            Your Cart
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-dark" href="index.html">
                            Home
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="custom-container d-flex align-items-center justify-content-center">
            <div class="text-center">
                <div class="rounded-container">
                    <h1>Car list</h1>
                    <p>${requestScope.ADD_SUCCESS}</p>
                    <div class="container">
                        <div class="row">
                            <c:forEach var="product" items="${sessionScope.AVAILABLE_PRODUCT.entrySet()}">
                                <div class="col-md-4">
                                    <div class="card mb-4">
                                        <form action="MainController" method="POST" >
                                            <p><c:out value="${product.value.productName}" /></p>
                                            <p class="price">Price: <c:out value="${product.value.price}" /></p>
                                            <input type="submit" name="action" value="Add to Cart" class="btn btn-sm btn-primary" />
                                            <input type="hidden" name="productID" value="<c:out value="${product.value.productID}" />" />
                                            <input type="submit" name="action" value="Buy Now" class="btn btn-sm btn-dark" />
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            Made by Kyrov (GiangDQ)
        </footer>
        <script>
            function checkCart() {
            <c:if test="${not empty sessionScope.CART}">
                location.href = 'viewCart.jsp';
            </c:if>
            <c:if test="${empty sessionScope.CART}">
                alertEmptyCart();
            </c:if>
            }

            function alertEmptyCart() {
                alert('Your cart is empty. Please add products to your cart.');
            }
        </script>
    </body>

</html>