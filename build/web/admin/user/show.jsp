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
        <title>User List</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <link href="${pageContext.request.contextPath}/resources/admin/css/styles.css" rel="stylesheet"/>
        <style>
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
                            <h1>User List</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active"><a href="/laptopshop/admin">Dashboard</a> </li>
                                <li class="breadcrumb-item active">User</li>
                            </ol>

                            <%-- Hiển thị thông báo --%>
                            <% if (session.getAttribute("message") != null) { %>
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <%= session.getAttribute("message") %>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <% session.removeAttribute("message"); %>
                            <% } %>
                            <% if (session.getAttribute("error") != null) { %>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <%= session.getAttribute("error") %>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <% session.removeAttribute("error"); %>
                            <% } %>

                            <div class="d-flex justify-content-between">
                                <h3>Users Table</h3>
                                <a href="/laptopshop/admin/user/create" class="btn btn-primary">Create new
                                    User</a>
                            </div>
                            <hr />
                            <table class="table table-bordered table-hover mt-3">
                                <thead class="thead-light">
                                    <tr>
                                        <th>ID</th>
                                        <th>Email</th>
                                        <th>Full Name</th>
                                        <th>Role</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty data}">
                                            <c:forEach var="user" items="${data}">
                                                <tr>
                                                    <td>${user.id}</td>
                                                    <td>${user.email}</td>
                                                    <td>${user.firstName} ${user.lastName}</td>
                                                    <td>${user.roleId == 1 ? 'User' : 'Admin'}</td>
                                                    <td>
                                                        <a href="/laptopshop/admin/user/detail?id=${user.id}" class="btn btn-info btn-sm">View</a>
                                                        <a href="/laptopshop/admin/user/update?id=${user.id}" class="btn btn-warning btn-sm">Update</a>
                                                        <a href="/laptopshop/admin/user/delete?id=${user.id}" class="btn btn-danger btn-sm">Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="5" class="text-center text-muted">No users found.</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>

                            <%-- Debug thông tin data --%>
                            <c:if test="${empty data}">
                                <p class="text-warning">Debug: Data attribute is empty or null. Check servlet logic.</p>
                            </c:if>
                        </div>
                    </div>
                </main>
                <jsp:include page="../layout/footer.jsp" />
            </div>
        </div>
    </body>
</html>