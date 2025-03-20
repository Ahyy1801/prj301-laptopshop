<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="py-4 bg-light mt-auto">
    <div class="container-fluid px-4">
        <div class="d-flex align-items-center justify-content-between small">
            <div class="text-muted">Copyright &copy; vanhuy</div>
            <div>
                <a href="https://www.facebook.com/Hyluv1801/" target="_blank">Facebook</a>
                &middot;

            </div>
        </div>
    </div>
</footer>
<% 
                         String message = (String) session.getAttribute("message");
                         if (message != null) {
%>
<div id="alertMessage" class="alert alert-success text-center" style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999; width: 50%;" role="alert">
    <%= message %>
</div>
<script>

    setTimeout(function () {
        document.getElementById("alertMessage").style.display = 'none';
    }, 2000);
</script>
<% 
    session.removeAttribute("message");
    } 
%>