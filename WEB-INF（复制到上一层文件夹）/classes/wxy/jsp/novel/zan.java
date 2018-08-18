package wxy.jsp.novel;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.lang.String;

public class zan extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        String bookID = request.getParameter("bookID");
        String username = request.getParameter("username");
        PrintWriter out = response.getWriter();

        if (username == null)
        {
            out.print("not login");
        }

        if ( bookID != null && !(bookID.equals("")) && username != null && !(username.equals("")))
        {
            try
            {

                String url = "jdbc:mysql://localhost/novel?user=root&password=root";
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection(url);
                Statement stmt = conn.createStatement();

                String sql = "SELECT zan from users where username = '" + username + "'";
                ResultSet rs = stmt.executeQuery(sql);
                if(rs != null && rs.next() == true)
                {
                	if (rs.getString(1).equals("1")) // 赞的数量到达上限
                	{
                		out.print("can't zan");
                		return ;
                	}
                }
                else
                {
                	out.print("can't read zan");
                	return ;
                }

                sql = "SELECT zan from zans where bookID = '" + bookID + "'";
                rs = stmt.executeQuery(sql);
                if(rs != null && rs.next() == true) // 记录已经存在
                {
                    String zan_s = rs.getString(1);
                    int zan = Integer.valueOf(zan_s);

                    out.print(zan + 1);

                    sql = "UPDATE zans set zan = zan + 1 where bookID = '" + bookID + "'";
                    stmt.executeUpdate(sql);
                }
                else
                {
                    sql = "INSERT INTO zans (bookID, zan) values('" + bookID + "', 1)";
                    stmt.executeUpdate(sql);

                    out.print(1);
                }

                sql = "UPDATE users set zan = zan - 1 where username = '" + username + "'";
                stmt.executeUpdate(sql);

                stmt.close();
                conn.close();
            }
            catch(IllegalAccessException iae)
            {
                out.print("Load Driver Error: " + iae.getMessage());
            }
            catch(InstantiationException ie)
            {
                out.print("Load Driver Error: " + ie.getMessage());
            }
            catch(java.lang.ClassNotFoundException e)
            {
                out.print("Load Driver Error: " + e.getMessage());
            }
            catch (SQLException ex)
            {
                out.print("SQL Error: " + ex.getMessage());
            }
        }
        else
        {
        	out.print("not login");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        doGet(request, response);
    }


}
