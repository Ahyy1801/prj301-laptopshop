<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="Cao Văn Huy - Dự án laptopshop" />
        <meta name="author" content="Cao Văn Huy" />
        <title>Create New User</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <link href="${pageContext.request.contextPath}/resources/admin/css/styles.css" rel="stylesheet"/>
    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="../layout/header.jsp" />
        <div id="layoutSidenav">
            <jsp:include page="../layout/sidebar.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <div class="container mt-4">
                            <div class="container mt-5">
                                <h2>Create New User</h2>

                                <%-- Hiển thị thông báo --%>
                                <% if (session.getAttribute("message") != null) { %>
                                <div class="alert alert-success"><%= session.getAttribute("message") %></div>
                                <% session.removeAttribute("message"); %>
                                <% } %>
                                <% if (session.getAttribute("error") != null) { %>
                                <div class="alert alert-danger"><%= session.getAttribute("error") %></div>
                                <% session.removeAttribute("error"); %>
                                <% } %>

                                <form action="/laptopshop/admin/user/create" method="post" enctype="multipart/form-data" id="createUserForm">
                                    <div class="form-group">
                                        <label for="email">Email:</label>
                                        <input type="email" class="form-control" id="email" name="email" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Password:</label>
                                        <input type="password" class="form-control" id="password" name="password" required minlength="6">
                                    </div>
                                    <div class="form-group">
                                        <label for="firstName">First Name:</label>
                                        <input type="text" class="form-control" id="firstName" name="firstName" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="lastName">Last Name:</label>
                                        <input type="text" class="form-control" id="lastName" name="lastName" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Phone:</label>
                                        <input type="text" class="form-control" id="phone" name="phone" pattern="[0-9]{10}" title="Phone number must be 10 digits">
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Address:</label>
                                        <input type="text" class="form-control" id="address" name="address">
                                    </div>
                                    <div class="form-group">
                                        <label for="roleName">Role:</label>
                                        <select class="form-control" id="roleName" name="roleName">
                                            <option value="USER">User</option>
                                            <option value="ADMIN">Admin</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="avatarFile">Avatar:</label>
                                        <input type="file" class="form-control-file" id="avatarFile" name="avatarFile" accept="image/*">
                                        <img id="avatarPreview" src="" alt="Avatar Preview" style="max-width: 200px; display: none; margin-top: 10px;">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Create User</button>
                                    <a href="/laptopshop/admin/user" class="btn btn-secondary">Back to User List</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="../layout/footer.jsp" />
            </div>
        </div>


        <link href="${pageContext.request.contextPath}/resources/admin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            $(document).ready(function () {
                $("#avatarFile").change(function () {
                    const file = this.files[0];
                    if (file) {
                        const reader = new FileReader();
                        reader.onload = function (e) {
                            $("#avatarPreview").attr("src", e.target.result).show();
                        };
                        reader.readAsDataURL(file);
                    } else {
                        $("#avatarPreview").hide();
                    }
                });

                $("#createUserForm").submit(function (e) {
                    const password = $("#password").val();
                    if (password.length < 6) {
                        alert("Password must be at least 6 characters.");
                        e.preventDefault();
                    }
                });
            });
        </script>
    </body>
</html>