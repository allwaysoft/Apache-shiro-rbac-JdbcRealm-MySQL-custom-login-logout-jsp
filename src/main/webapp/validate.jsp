<%@page language="java" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
%>

<%@page import="nl.captcha.Captcha"%>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import ="org.apache.shiro.authc.AuthenticationException" %>
<%@ page import ="org.apache.shiro.authc.UsernamePasswordToken" %>
<%@ page import ="org.apache.shiro.subject.Subject" %>


<%
    Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
    System.out.println(captcha.getAnswer());
    request.setCharacterEncoding("UTF-8");
    String answer = request.getParameter("answer");
    boolean result = captcha.isCorrect(answer);
    session.removeAttribute(Captcha.NAME);

    if (result) {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        try {
            subject.login(token);
            request.getSession().setAttribute("username", username);
            response.sendRedirect(response.encodeURL("user-index.jsp"));
        } catch (AuthenticationException e) {
            response.sendRedirect(response.encodeURL("index.jsp"));
        }
    } else {
        response.sendRedirect(response.encodeURL("index.jsp"));
    }
%>