<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.mysql.jdbc.Driver, java.sql.*" %>
<%
String url="jdbc:mysql://localhost/novel?user=root&password=root";
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn=DriverManager.getConnection(url);
Statement stmt = conn.createStatement();%>

<%
String bookID = request.getParameter("bookID");
    if (bookID == null) bookID = "";
String bookName = request.getParameter("bookName");
    if (bookName == null) bookName = "";
String bookWriter = request.getParameter("bookWriter");
    if (bookWriter == null) bookWriter = "";
 String bookInfo = request.getParameter("bookInfo");
    if (bookInfo == null) bookInfo = "";
String img = request.getParameter("img");
    if (img == null) img = "";
    String sql="INSERT into novels (bookID, bookName, bookWriter, bookInfo, img) values ('"+bookID+"', '"+bookName+"', '"+bookWriter+"', '"+bookInfo+"', '"+img+"')";
    // out.print(sql);
	stmt.executeUpdate(sql); 	
	stmt.close();
	conn.close();
%>

<script type="text/javascript">
alert("提交成功，请检查数据库");
window.location.href="caogao.jsp";
</script>