<%@page import="org.apache.shiro.authc.credential.PasswordService"%>
<%@page import="org.apache.shiro.authc.credential.DefaultPasswordService"%>
<%@include file="config.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>用户管理</title>
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
        <h1>用户管理</h1>

        <%@ page import="java.sql.*"%>
        <%@page import="java.security.MessageDigest"%>
        <%@page import="java.security.NoSuchAlgorithmException"%>
        <%@page import="java.security.NoSuchProviderException"%>
        <%@page import="java.security.SecureRandom"%>




        <%            System.out.println(request.getParameter("username"));
            if (request.getParameter("username") != null) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                PasswordService passwordService = new DefaultPasswordService();
                String securePassword = passwordService.encryptPassword(password);

                System.out.println(securePassword);

                Connection con = null;
                PreparedStatement ps = null;
                int result = 0;

                try {
                    // Register JDBC driver
                    Class.forName(DB_DRIVER_CLASS_NAME);

                    // establish the connection
                    con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

                    // compile SQL query and
                    // store it in PreparedStatemet object
                    if (con != null) {
                        String sql = "Update users set password=? where username=?";
                        ps = con.prepareStatement(sql);
                    }

                    // set input values and execute query
                    if (ps != null) {
                        // set input values to query parameters

                        ps.setString(1, securePassword);
                        ps.setString(2, username);
                        // execute the query
                        result = ps.executeUpdate();
                    }
                    // process the result
                    if (result == 0) {
                        out.println("未更新记录");
                    } else {
                        out.println("更新记录成功");
                    }

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
            }


        %>
        <%@include file="footer.jsp"%>
    </body>
</html>