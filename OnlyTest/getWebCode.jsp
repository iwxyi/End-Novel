<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.regex.*, java.io.*, java.net.*" errorPage="" %>
<%
	String sCurrentLine = "", sTotalString = "", url = "https://www.qidian.com/all";
	HttpURLConnection l_connection = (HttpURLConnection) (new URL(url)).openConnection();
	l_connection.connect();
	InputStreamReader isr = new InputStreamReader(l_connection.getInputStream(), "UTF-8");
	BufferedReader l_reader = new BufferedReader(isr);
	while ((sCurrentLine = l_reader.readLine()) != null) sTotalString+=sCurrentLine+"\n";
	
	String regEx ="href=[\"\']([^\"]*)[\"\']";//找出href="****"的链接
	Pattern p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
	Matcher m = p.matcher(sTotalString);
	int j=0;
	while(m.find()){
		j++;
		out.println("m.group(" + j + "): " + m.group(1)+"<br>");
	}

	FileWriter fileWriter=new FileWriter("D:\\tmp.txt");
	fileWriter.write(sTotalString);
	fileWriter.flush();
	fileWriter.close();
%>