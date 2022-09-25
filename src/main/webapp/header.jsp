<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
%>



<%
    //redirect user to home page if already logged in
    if ((String) session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
    }


%>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <ul class="navbar-nav">

                <li class="nav-item">
                    <a class="nav-link" href="<%=response.encodeURL("user-index.jsp")%>">用户管理</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<%=response.encodeURL("logout.jsp")%>">退出登录</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

