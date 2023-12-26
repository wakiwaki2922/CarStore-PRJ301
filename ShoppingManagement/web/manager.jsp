<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
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

            .btn-primary {
                background-color: #007BFF;
                color: #fff;
                border-color: #007BFF;
            }

            .btn-outline-primary {
                color: #007BFF;
                border-color: #007BFF;
            }

            .btn-secondary {
                background-color: #007BFF;
                color: #fff;
                border-color: #007BFF;
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
        <c:choose>
            <c:when test="${empty sessionScope.LOGIN_USER or !sessionScope.LOGIN_USER.roleID eq 'QL'}">
                <c:redirect url="login.html" />
            </c:when>
            <c:otherwise>
                <div class="container">
                    <div class="row">
                        <!-- Cột thứ nhất -->
                        <div class="col-md-5 mx-auto"> <!-- Sử dụng mx-auto để căn giữa cột -->
                            <div class="card">
                                <div class="card-body text-center">
                                    <img src="asset/avatar.png" alt="avatar" class="rounded-circle img-fluid"
                                         style="width: 150px;">
                                    <h5 class="my-3">${sessionScope.LOGIN_USER.userName}</h5>
                                    <div class="d-flex flex-column align-items-center mb-2">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-primary"
                                                    onclick="location.href = 'MainController?action=Logout'">Logout</button>
                                            <button type="button" class="btn btn-secondary ms-1"
                                                    onclick="location.href = 'updateManager.jsp'">Edit</button>
                                        </div>
                                        <button type="button" class="btn btn-outline-primary mt-1"
                                                onclick="location.href = 'MainController?action=SearchCustomer'">Manage 
                                            Customers</button>
                                        <button type="button" class="btn btn-outline-primary mt-1"
                                                onclick="location.href = 'MainController?action=SearchProduct'">Manage
                                            Products</button>
                                        <button type="button" class="btn btn-outline-primary mt-1"
                                                onclick="location.href = 'MainController?action=SeacrchInvoice'">Manage
                                            Invoices</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Cột thứ hai -->
                        <div class="col-md-7">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Full Name</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0">${sessionScope.LOGIN_USER.name}</p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Role</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0">${sessionScope.LOGIN_USER.roleID}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer>
                    Made by Kyrov (GiangDQ)
                </footer>
            </c:otherwise>
        </c:choose>
    </body>

</html>
