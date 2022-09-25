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
        <%@page import="java.sql.*,java.util.*"%>
        <%            if (request.getParameter("username") != null) {
                String username = request.getParameter("username");

                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                int result = 0;
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
                        String sql = "select count(*) from users";
                        ps = con.prepareStatement(sql);
                    }
                    // set input value to query parameter

                    // execute the query
                    if (ps != null) {
                        rs = ps.executeQuery();
                    }
                    // process the result
                    if (rs != null) {
                        rs.next();
                        //Moving the cursor to the last row
                        if (rs.getInt("count(*)") > 1) {

                            // compile SQL query and
                            // store it in PreparedStatemet object
                            if (con != null) {
                                String sql = "DELETE FROM users WHERE username=?";
                                ps = con.prepareStatement(sql);
                            }

                            // set input values and execute query
                            if (ps != null) {
                                // set input values to query parameters
                                ps.setString(1, username);
                                // execute the query
                                result = ps.executeUpdate();
                            }

                            // process the result
                            if (result == 0) {
                                out.println("未发现记录");
                            } else {
                                out.println(result + " 条记录删除成功");
                            }

                        } else {
                            out.println("最后一个用户不能删除！");
                        }

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