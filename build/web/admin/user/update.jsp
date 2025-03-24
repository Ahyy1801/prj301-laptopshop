<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="Cao Văn Huy - Dự án laptopshop" />
        <meta name="author" content="Cao Văn Huy" />
        <title>Update User</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <link href="${pageContext.request.contextPath}/resources/admin/css/styles.css" rel="stylesheet"/>
        <style>
        <link href="${pageContext.request.contextPath}/resources/admin/css/styles.css" rel="stylesheet" />
            /* Đảm bảo các nút không bị ẩn */
            .btn-sm {
                margin-right: 5px;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="../layout/header.jsp" />
        <div id="layoutSidenav">
            <jsp:include page="../layout/sidebar.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <div class="container mt-4">
                            <div class="container mt-4">
                                <h1>Update User</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"><a href="/laptopshop/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active"><a href="/laptopshop/admin/user">User</a></li>
                                    <li class="breadcrumb-item active">Update user</li>
                                </ol>

                                <%-- Hiển thị thông báo --%>
                                <% if (session.getAttribute("message") != null) { %>
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    <%= session.getAttribute("message") %>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <% session.removeAttribute("message"); %>
                                <% } %>
                                <% if (session.getAttribute("error") != null) { %>
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <%= session.getAttribute("error") %>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <% session.removeAttribute("error"); %>
                                <% } %>

                                <c:choose>
                                    <c:when test="${not empty user}">
                                        <form action="/laptopshop/admin/user/update" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="id" value="${user.id}">
                                            <div class="form-group">
                                                <label for="email">Email:</label>
                                                <input type="email" class="form-control" id="email" name="email" value="${user.email}" required readonly>
                                            </div>
                                            <div class="form-group">
                                                <label for="password">Password (leave blank to keep current):</label>
                                                <input type="password" class="form-control" id="password" name="password">
                                            </div>
                                            <div class="form-group">
                                                <label for="firstName">First Name:</label>
                                                <input type="text" class="form-control" id="firstName" name="firstName" value="${user.firstName}" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="lastName">Last Name:</label>
                                                <input type="text" class="form-control" id="lastName" name="lastName" value="${user.lastName}" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="phone">Phone:</label>
                                                <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}">
                                            </div>
                                            <div class="form-group">
                                                <label for="address">Address:</label>
                                                <input type="text" class="form-control" id="address" name="address" value="${user.address}">
                                            </div>
                                            <div class="form-group">
                                                <label for="roleName">Role:</label>
                                                <select class="form-control" id="roleName" name="roleName">
                                                    <option value="USER" ${user.roleId == 1 ? 'selected' : ''}>User</option>
                                                    <option value="ADMIN" ${user.roleId == 2 ? 'selected' : ''}>Admin</option>
                                                </select>
                                            </div>

                                            <button type="submit" class="btn btn-primary">Update User</button>
                                            <a href="/laptopshop/admin/user" class="btn btn-secondary">Back to User List</a>
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-danger">No user data available to update.</p>
                                        <a href="/laptopshop/admin/user" class="btn btn-secondary">Back to User List</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="../layout/footer.jsp" />
            </div>
        </div>
    </body>
</html>