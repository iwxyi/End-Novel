<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> ​-->

<!--

    JDBC 驱动名及数据库 URL 

    数据库的用户名与密码，需要根据自己的设置

    useUnicode=true&characterEncoding=utf-8 防止中文乱码

 -->

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8" user="root" password="root" />

<!-- 查询操作到 result -->

<sql:query dataSource="${snapshot}" var="result">

	SELECT * from websites;

</sql:query>

​

<!-- 展示查询结果 -->

<c:forEach var="row" items="${result.rows}">
	ID:
	<c:out value="${row.id}" /> <br /> 站点名:
	<c:out value="${row.name}" /> <br /> 站点地址:
	<c:out value="${row.url}" /> <br />
</c:forEach>