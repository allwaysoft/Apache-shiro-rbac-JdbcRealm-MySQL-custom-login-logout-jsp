<%@include file="config.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<!DOCTYPE html>
<html>
    <head>
        <title>用户角色管理</title>

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
        <h1>用户角色管理</h1>

        <form method="post" action="<%=response.encodeURL("user-role-create-process.jsp")%>">
            <center>
                <table border="1" cellpadding="5" cellspacing="2">
                    <thead>
                        <tr>
                            <th colspan="2">添加用户角色</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>用户</td>
                            <td>
                                <select name="username">
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
                                                String sql = "select * from users";
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
                                    <option value="<%=StringEscapeUtils.escapeHtml4(rs.getString("username"))%>"><%=StringEscapeUtils.escapeHtml4(rs.getString("username"))%></option>
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
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>角色</td>
                            <td><select name="role_name">
                                    <%
                                        Connection con2 = null;
                                        PreparedStatement ps2 = null;
                                        ResultSet rs2 = null;
                                        try {
                                            // Register JDBC driver
                                            Class.forName(DB_DRIVER_CLASS_NAME);

                                            // Open a connection
                                            System.out.println("Connecting to database2...");
                                            con2 = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

                                            // Execute a query
                                            System.out.println("Creating statement2...");

                                            // compile SQL query and
                                            // store it in PreparedStatemet object
                                            if (con2 != null) {
                                                String sql2 = "select * from roles";
                                                ps2 = con2.prepareStatement(sql2);
                                            }
                                            // set input value to query parameter

                                            // execute the query
                                            if (ps2 != null) {
                                                rs2 = ps2.executeQuery();
                                            }
                                            System.out.println("execute the query2 end...");
                                            // process the result
                                            if (rs2 != null) {
                                                System.out.println("process the result2 ...");
                                                while (rs2.next()) {
                                    %>
                                    <option value="<%=StringEscapeUtils.escapeHtml4(rs2.getString("name"))%>"><%=StringEscapeUtils.escapeHtml4(rs2.getString("name"))%></option>
                                    <%
                                                }
                                            }
                                            // Clean-up environment
                                            rs2.close();
                                            ps2.close();
                                            con2.close();
                                        } catch (SQLException se) {
                                            se.printStackTrace();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        } // end of try-catch block
                                        finally {
                                            // close JDBC objects
                                            try {
                                                if (rs2 != null) {
                                                    rs2.close();
                                                }
                                            } catch (SQLException se) {
                                                se.printStackTrace();
                                            }
                                            try {
                                                if (ps2 != null) {
                                                    ps2.close();
                                                }
                                            } catch (SQLException se) {
                                                se.printStackTrace();
                                            }
                                            try {
                                                if (con2 != null) {
                                                    con2.close();
                                                }
                                            } catch (SQLException se) {
                                                se.printStackTrace();
                                            }

                                        }
                                    %>
                                </select></td>
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