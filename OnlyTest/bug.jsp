
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.regex.*, java.util.*, java.net.*" %>


<%
	String[] kinds = {"玄幻", "奇幻", "武侠", "仙侠", "都市", "现实", "军事",
					"历史", "游戏", "体育", "科幻", "灵异", "二次元" };
	String[] words = {"xuanhuan", "qihuan", "wuxia", "xianxia", "dushi", "xianshi", "junshi",
					"lishi", "youxi", "tiyu", "kehuan", "lingyi", "2cy" };

	String writes = "";
	FileWriter fileWriter=new FileWriter("D:\\tmp.txt");
	for (int i = 0; i < 5; i++)
	{
		
		out.print("<div class='mdui-row-xs-3 mdui-row-sm-4 mdui-row-md-5 mdui-row-lg-6 mdui-row-xl-7 mdui-grid-list'>\n");
		if (i > 0 && i <= 2)
		{
			String source = "", line = "", url = "https://www.qidian.com/"+words[i];
			HttpURLConnection l_connection = (HttpURLConnection) (new URL(url)).openConnection();
			l_connection.connect();
			InputStreamReader isr = new InputStreamReader(l_connection.getInputStream(), "UTF-8");
			BufferedReader l_reader = new BufferedReader(isr);
			while ((line = l_reader.readLine()) != null) source+=line;

			int startPos = source.indexOf("<div id=\"new-book-list\"");
			int endPos = source.indexOf("<div class=\"right-rank fr\"", startPos);
			// out.print(source.length()+"   "+startPos+"  "+endPos+"  ");
			String ulPart = source.substring(startPos, endPos);
			String[] liPart = ulPart.split("</li");

			fileWriter.write("\n\n" + ulPart + "\n\n");
			fileWriter.flush();

			int indexID = 0;
			while (indexID < 9 && indexID < liPart.length) // 每个 li
			{
				String bookID = "", bookUrl = "", bookname = "", bookWriter = "", bookKind = "", imgsrc = "";

				String regEx ="href=\"//book.qidian.com/info/(\\d+)\"";
				Pattern p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
				Matcher m = p.matcher(liPart[indexID]);
				if(m.find()) bookID = m.group(1);
				else bookID = "0000000000";
				bookUrl = "http://book.qidian.com/info/" + bookID;

				regEx = "alt=\"([^\"].+?)\"";
				p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
				m = p.matcher(liPart[indexID]);
				if(m.find()) bookname = m.group(1);
				else bookname = "未获取到";

				regEx = "<p>([^/]+)</p>";
				p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
				m = p.matcher(liPart[indexID]);
				if(m.find()) bookWriter = m.group(1);
				else bookWriter = "未获取到";

				regEx = "src=\"//(qidian.qpic.cn/qdbimg/[^>]+?)\"";
				p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
				m = p.matcher(liPart[indexID]);
				if(m.find()) imgsrc = "http://" + m.group(1);
				else imgsrc = "未获取到";

				writes = i + "--" + indexID + "  " + bookID + "\n\n" + bookname + "\n\n" + bookWriter + "\n\n" + imgsrc + "\n\n";
				fileWriter.write(writes);
				fileWriter.flush();

				indexID++;
			}
		}
	
	}
	
	fileWriter.flush();
	fileWriter.close();

%>