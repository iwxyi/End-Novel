<%@ page import="java.io.*,java.util.*" %>
<%
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "homepage.jsp");
%>