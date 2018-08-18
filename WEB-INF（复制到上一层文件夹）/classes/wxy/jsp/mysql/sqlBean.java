package wxy.jsp.mysql;

import java.sql.*;
import java.lang.String;

public class sqlBean
{

    Connection conn;
    Statement stmt;
    ResultSet rs;

    public sqlBean()
    {
        // init();
    }

    public void init(String dburl, String db_user, String db_passwd)
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(dburl, db_user, db_passwd);
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
        catch(SQLException ex)
        {
            System.err.println("Get Connection Error: " + ex.getMessage());
        }
    }

    public void init()
    {
        try
        {
            String url = "jdbc:mysql://localhost/novel?user=root&password=root";
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url);
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
        catch(SQLException ex)
        {
            System.err.println("Get Connection Error: " + ex.getMessage());
        }
    }

    public ResultSet executeQuery(String sql)
    {
        if (conn == null)
            init();

        try
        {
            if (stmt == null)
                stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
        }
        catch(SQLException ex)
        {
            System.err.println("SQL Error: " + ex.getMessage());
        }

        return rs;
    }

    public void executeUpdate(String sql)
    {
        if (conn == null)
            init();

        try
        {
            if (stmt == null)
                stmt = conn.createStatement();

            stmt.executeUpdate(sql);
        }
        catch(SQLException ex)
        {
            System.err.println("SQL Error: " + ex.getMessage());
        }
    }

    public int executeU(String sql)
    {
        try
        {
            String url = "jdbc:mysql://localhost/novel?user=root&password=root";
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(url);
            Statement stmt = conn.createStatement();

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

        return 0;
    }

    public ResultSet executeQ(String sql)
    {
        try
        {
            String url = "jdbc:mysql://localhost/novel?user=root&password=root";
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(url);
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            stmt.close();
            conn.close();

            return rs;
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

        return rs;
    }

    public void close() throws SQLException
    {
        stmt.close();
        conn.close();
    }

    public static boolean SafeCheck(String str)
    {
        str += " ";
        String inj_str = "'|*|%|;|or|-|+|,";
        String inj_stra[] = inj_str.split("|");
        for (int i = 0 ; i < inj_stra.length ; i++ )
        {
            if (str.indexOf(inj_stra[i]) > 0)
            {
                return false;
            }
        }
        return true;
    }
}