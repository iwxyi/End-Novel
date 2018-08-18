<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wxy.*" %>
<jsp:useBean id="t1" scope="session" class="wxy.SimpleBean" />
<jsp:setProperty name="t1" property="message" value="hhh" />
<jsp:getProperty name="t1" property="message" />
<%
	

%>