<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>权限管理</title>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
        <link href="bootstrap-icons-1.8.3/bootstrap-icons.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">



    </head>
    <body>
        <%@include file="header.jsp"%>
        <h1>权限管理</h1>

        <form method="post" action="<%=response.encodeURL("permission-create-process.jsp")%>">
            <center>
                <table border="1" cellpadding="5" cellspacing="2">
                    <thead>
                        <tr>
                            <th colspan="2">添加权限</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>权限</td>
                            <td><input type="text" name="name" required /></td>
                        </tr>
                        <tr>
                            <td>描述</td>
                            <td><input type="text" name="description" required /></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"><input type="submit"
                                                                  value="添加" /> &nbsp;&nbsp; <input type="reset" value="重置" /></td>
                        </tr>
                    </tbody>
                </table>
            </center>
        </form>
    </body>
</html>