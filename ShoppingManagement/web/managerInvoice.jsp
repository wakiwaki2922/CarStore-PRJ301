

<%@page import="sample.shopping.OrderDisplayDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.users.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage - Invoices</title>
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
                </ul>
            </div>
        </nav>
        <c:if test="${empty sessionScope.LOGIN_USER or sessionScope.LOGIN_USER.roleID ne 'QL'}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        <c:set var="searchPattern" value="${param.searchPattern}" />
        <c:if test="${empty searchPattern}">
            <c:set var="searchPattern" value="" />
        </c:if>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="mt-5">Order View</h1>
                    <c:if test="${requestScope.LIST_INVOICE !=null}">
                        <c:if test="${not empty requestScope.LIST_INVOICE}">
                            <table class="table table-bordered mt-3">
                                <thead>
                                    <tr>
                                        <th scope="col">Order ID</th>
                                        <th scope="col">Customer ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="orderDetail" varStatus="counter" items="${requestScope.LIST_INVOICE}">
                                    <form action="MainController" method="POST">
                                        <tr>
                                            <td>${orderDetail.orderID}</td>
                                            <td>${orderDetail.userID}</td>
                                            <td>${orderDetail.name}</td>
                                            <td>${orderDetail.dateOrder}</td>
                                        </tr>
                                    </form>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </div>
        <footer>
            Made by Kyrov (GiangDQ)
        </footer>
    </body>
</html>

