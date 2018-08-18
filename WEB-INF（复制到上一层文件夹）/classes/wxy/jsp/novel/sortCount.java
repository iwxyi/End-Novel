package wxy.jsp.novel;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.lang.String;

public class sortCount extends HttpServlet
{
	/*String[] kindsName = {"玄幻", "奇幻", "武侠", "仙侠", "都市", "现实", "军事",
					"历史", "游戏", "体育", "科幻", "灵异"};*/
	String[] kindsName = {"xuanhuan", "qihuan", "wuxia", "xianxia", "dushi", "xianshi", "junshi",
					"lishi", "youxi", "tiyu", "kehuan", "lingyi"};

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String kind = request.getParameter("kind");
		String bookID = request.getParameter("bookID");

		if (!(kind.equals("")))
		{
			try
			{
				String url="jdbc:mysql://localhost/test?user=root&password=root";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection conn=DriverManager.getConnection(url);
				Statement stmt = conn.createStatement();

				String sql = "UPDATE sortCount set count = count + 1 where kindName = '" + kind + "'";
				stmt.executeUpdate(sql);

				stmt.close();
				conn.close();
			}
			catch(IllegalAccessException iae)
	        {
	            System.err.println("Load Driver Error: " + iae.getMessage());
	        }
	        catch(InstantiationException ie)
	        {
	            System.err.println("Load Driver Error: " + ie.getMessage());
	        }
	        catch(java.lang.ClassNotFoundException e)
	        {
	            System.err.println("Load Driver Error: " + e.getMessage());
	        }
	        catch (SQLException ex)
	        {
	            System.err.println("SQL Error: " + ex.getMessage());
	        }
		}

		response.setContentType("text/html;charset=utf-8");
		String bookUrl = "catalogue.jsp?bookID="+bookID;
		response.sendRedirect(bookUrl);
		return ;
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		doGet(request, response);
	}


}
