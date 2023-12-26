<%@page import="sample.products.ProductDTO"%>
<%@page import="sample.shopping.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                </ul>
            </div>
        </nav>
        <c:if test="${not empty sessionScope.CART and sessionScope.CART.cart.size() > 0}">
            <div class="container py-5">
                <div class="row d-flex justify-content-center my-4">
                    <div class="col-md-8">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Cart - ${sessionScope.CART.cart.size()} items</h5>
                            </div>
                            <div class="card-body">
                                <c:set var="cart" value="${sessionScope.CART.cart}" />
                                <c:set var="total" value="0" />
                                <c:forEach var="entry" items="${cart}">
                                    <div class="row">
                                        <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                            <form action="MainController" method="post">
                                                <input type="hidden" name="productID" value="${entry.key}" />
                                                <input type="hidden" name="price" value="${entry.value.getPrice()}" />
                                                <p><strong>${entry.value.productName}</strong></p>
                                                <p>Product ID: ${entry.key}</p>
                                                <p>Price: $${entry.value.getPrice()}</p>
                                                <input type="hidden" name="action" value="Remove" />
                                                <button type="submit" class="btn btn-primary btn-sm me-1 mb-2" data-mdb-toggle="tooltip" title="Remove item">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                            </form>
                                        </div>
                                        <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                            <div class="d-flex mb-4" style="max-width: 300px">
                                                <form action="MainController" method="post" class="w-100">
                                                    <div class="d-flex">
                                                        <input type="hidden" name="productID" value="${entry.key}" />
                                                        <input type="number" name="quantity" value="${entry.value.getQuantity()}" min="0" class="form-control" />
                                                        <button type="submit" class="btn btn-primary px-3 ms-2">
                                                            <i class="fa fa-check"></i>
                                                        </button>
                                                        <input type="hidden" name="action" value="Edit" />
                                                    </div>
                                                </form>
                                            </div>
                                            <p class="text-start text-md-center">
                                                <label>Subtotal: </label>
                                                <strong>$${entry.value.getQuantity() * entry.value.getPrice()}</strong>
                                            </p>
                                        </div>

                                    </div>
                                    <c:set var="temp" value="${entry.value.quantity * entry.value.price}" />
                                    <c:set var="total" value="${total + temp}" />
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <c:set var="vatRate" value="0.10" />
                    <c:set var="subtotal" value="${total}" />
                    <c:set var="vat" value="${subtotal * vatRate}" />
                    <c:set var="totalPrice" value="${subtotal + vat}" />

                    <div class="col-md-4">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Summary</h5>
                            </div>
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                        Products
                                        <span>$${subtotal}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                        <div>
                                            <strong>VAT (10%)</strong>
                                        </div>
                                        <span>$${vat}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                        <div>
                                            <strong>Total amount (including VAT)</strong>
                                        </div>
                                        <span><strong>$${totalPrice}</strong></span>
                                    </li>
                                </ul>
                                <form action="MainController" method="POST">
                                    <button type="submit" class="btn btn-primary btn-lg btn-block" name="action" value="Check out">
                                        Check out
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <footer>
            Made by Kyrov (GiangDQ)
        </footer>
    </body>
</html>