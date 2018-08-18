<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.regex.*, java.io.*, java.net.*" errorPage="" %>
<% // 上一个测试JSP的压缩
	String sCurrentLine = "", sTotalString = "";
	URL l_url = new URL("https://www.qidian.com/all");
	HttpURLConnection l_connection = (HttpURLConnection) l_url.openConnection();
	l_connection.connect();
	InputStream l_urlStream = l_connection.getInputStream();
	InputStreamReader isr = new InputStreamReader(l_urlStream, "UTF-8");
	BufferedReader l_reader = new BufferedReader(isr);
	while ((sCurrentLine = l_reader.readLine()) != null)
	{
		sTotalString+=sCurrentLine;
	}
	
	String regEx ="href=[\"\']([^\"]*)[\"\']";//找出href="****"的链接
	Pattern p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
	Matcher m = p.matcher(sTotalString);
	int j=0;
	while(m.find()){
		j++;
		out.println("m.group(" + j + "): " + m.group(0)+"<br>");
	}

	FileWriter fileWriter=new FileWriter("D:\\tmp.txt");
	fileWriter.write(sTotalString);
	fileWriter.flush();
	fileWriter.close();
%>