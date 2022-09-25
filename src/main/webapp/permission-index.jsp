<%@include file="config.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>

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
        <a href="<%=response.encodeURL("permission-create.jsp")%>"><button type="button" class="add">增加</button></a>
        <table class="table table-hover" style="width: 1024px">
            <thead class="table-dark">
                <tr>
                    <th><b>权限</b></th>
                    <th><b>描述</b></th>
                    <th><b>操作</b></th>
                </tr>
            </thead>
            <tbody>
                <%

                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        // Register JDBC driver
                        Class.forName(DB_DRIVER_CLASS_NAME);

                        // Open a connection
                        System.out.println("Connecting to database...");
                        con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

                        // Execute a query
                        System.out.println("Creating statement...");

                        // compile SQL query and
                        // store it in PreparedStatemet object
                        if (con != null) {
                            String sql = "select * from permissions";
                            ps = con.prepareStatement(sql);
                        }
                        // set input value to query parameter

                        // execute the query
                        if (ps != null) {
                            rs = ps.executeQuery();
                        }
                        // process the result
                        if (rs != null) {

                            while (rs.next()) {
                %>
                <tr>
                    <td><%=StringEscapeUtils.escapeHtml4(rs.getString("name"))%></td>
                    <td><%=StringEscapeUtils.escapeHtml4(rs.getString("description"))%></td>
                    <td><a
                            href="<%=response.encodeURL("permission-update.jsp?name=" + rs.getString("name"))%>"><button
                                type="button" class="update">修改</button></a><a href="<%=response.encodeURL("permission-delete.jsp?name=" + rs.getString("name"))%>"><button
                                type="button" class="delete">删除</button></a></td>
                </tr>
                <%
                            }
                        }
                        // Clean-up environment
                        rs.close();
                        ps.close();
                        con.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    } catch (Exception e) {
                        e.printStackTrace();
                    } // end of try-catch block
                    finally {
                        // close JDBC objects
                        try {
                            if (rs != null) {
                                rs.close();
                            }
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                        try {
                            if (ps != null) {
                                ps.close();
                            }
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                        try {
                            if (con != null) {
                                con.close();
                            }
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }

                    }
                %>
            </tbody>
        </table>
        <%@include file="footer.jsp"%>
    </body>
</html>