<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	request.getRequestDispatcher("www/main").forward(request, response);
%>