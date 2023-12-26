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
                </ul>
            </div>
        </nav>

        <div class="container">
            <h1 class="mt-5">Customer Management</h1>

            <c:if test="${sessionScope.LOGIN_USER == null} || ${sessionScope.LOGIN_USER .roleID ne 'QL'}">
                <c:redirect url="login.html"></c:redirect>
            </c:if>

            <form class="mt-3" action="MainController" method="post">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" name="searchPattern" value="${param.searchPattern}" placeholder="Search Customer" />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="submit" name="action" value="SearchCustomer">Search</button>
                    </div>
                </div>
            </form>

            <p>${requestScope.LIST_SEARCH_EMPTY}</p>

            <c:if test="${requestScope.LIST_CUSTOMER !=null}">
                <c:if test="${not empty requestScope.LIST_CUSTOMER}">
                    <table class="table table-bordered mt-3">
                        <thead>
                            <tr>
                                <th>Customer ID</th>
                                <th>Username</th>
                                <th>Name</th>                  
                                <th>Update Customer</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="customer" varStatus="counter" items="${requestScope.LIST_CUSTOMER}">
                            <form action="MainController" method="POST">
                                <tr>
                                    <td>${customer.getUserID()}</td>
                                    <td>${customer.getUserName()}</td>
                                    <td>
                                        <input type="text" class="form-control" name="name" value="${customer.getName()}" />
                                    </td>
                                    <td>
                                        <button type="submit" class="btn btn-primary" name="action" value="UpdateCustomer">Update Customer</button>
                                        <input type="hidden" name="customerID" value="${customer.getUserID()}" />
                                        <input type="hidden" name="searchPattern" value="${param.searchPattern}" />
                                        <input type="hidden" name="userName" value="${customer.getUserName()}" />
                                    </td>
                                    <td>
                                        <button type="submit" class="btn btn-danger" name="action" value="DeleteCustomerFromManager">Delete</button>
                                        <input type="hidden" name="customerID" value="${customer.getUserID()}" />
                                        <input type="hidden" name="searchPattern" value="${param.searchPattern}" />
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        <p>${requestScope.UPDATE_SUCCESS}</p>
                        </tbody>
                    </table>
                </c:if>
            </c:if>
        </div>
        <footer>
            Made by Kyrov (GiangDQ)
        </footer>
    </body>
</html>
