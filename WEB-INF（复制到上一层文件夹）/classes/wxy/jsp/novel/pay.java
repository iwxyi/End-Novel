package wxy.jsp.novel;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.lang.String;

public class pay extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        String money = request.getParameter("money");
        String username = request.getParameter("username");

        PrintWriter out = response.getWriter();

        if (username == null)
        {
            out.print("not login");
        }

        if ( (username != null && !(username.equals(""))) || 1>0)
        {
            try
            {
                String url = "jdbc:mysql://localhost/novel?user=root&password=root";
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection(url);
                Statement stmt = conn.createStatement();

                if (username == null) username = "123";

                String sql0 = "create trigger t_a on users after update as begin select * from users end";

                String sql = "UPDATE users set money = money + " + 20 + " where username = '" + username + "'";
                stmt.executeUpdate(sql);

                stmt.close();
                conn.close();

                response.setContentType("text/html;charset=utf-8");
                String url2 = "pay_2.jsp";
                response.sendRedirect(url2);
                return ;
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
