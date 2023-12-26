<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager - Customer</title>
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
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light custom-navbar" style="background-color: transparent !important;">
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="manager.jsp">Manager</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addProduct.jsp">Add product</a>
                    </li>
                </ul>
            </div>
        </nav>

        <c:if test="${empty sessionScope.LOGIN_USER or sessionScope.LOGIN_USER.roleID ne 'QL'}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>

        <div class="container">
            <h1 class="mt-5">Product Management</h1>
            <c:if test="${not empty sessionScope.LIST_PRODUCT_FROM_MANAGER}">

                <table class="table table-bordered mt-3">
                    <thead>
                        <tr>
                            <th scope="col">Product ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="productIndex" items="${sessionScope.LIST_PRODUCT_FROM_MANAGER}">
                        <form action="MainController" method="POST">
                            <tr>
                                <td>${productIndex.value.getProductID()}</td>
                                <td>${productIndex.value.getProductName()}</td>
                                <td>
                                    <input type="text" name="price" value="${productIndex.value.getPrice()}">
                                </td>
                                <td>
                                    <input type="text" name="quantity"
                                           value="${productIndex.value.getQuantity()}">
                                </td>
                                <td>
                                    <button type="submit" name="action" class="btn btn-primary"
                                            value="EditProduct">Edit Product</button>
                                    <input type="hidden" name="productID"
                                           value="${productIndex.value.getProductID()}" />
                                    <input type="hidden" name="productName"
                                           value="${productIndex.value.getProductName()}" />
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
        <footer>
            Made by Kyrov (GiangDQ)
        </footer>
    </body>
</html>
