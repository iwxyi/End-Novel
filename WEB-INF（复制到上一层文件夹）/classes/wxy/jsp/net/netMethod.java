package wxy.jsp.net;

import java.io.*;
import java.util.regex.*;
import java.util.*;
import java.net.*;

public class netMethod
{
    public netMethod()
    {
        ;
    }

    public static String getWebSource(String url)
    {
        String source = "", line = "";
        try
        {
            HttpURLConnection l_connection = (HttpURLConnection) (new URL(url)).openConnection();
            l_connection.connect();
            InputStreamReader isr = new InputStreamReader(l_connection.getInputStream(), "UTF-8");
            BufferedReader l_reader = new BufferedReader(isr);
            while ((line = l_reader.readLine()) != null) source += line;
        }
        catch (MalformedURLException e)
        {
            System.out.println(e.toString());
        }
        catch (IOException e)
        {
            System.out.println(e.toString());
        }

        return source;
    }

    public static String getWebReg(String url, String regEx)
    {
        String source = "", line = "";
        try
        {
            HttpURLConnection l_connection = (HttpURLConnection) (new URL(url)).openConnection();
            l_connection.connect();
            InputStreamReader isr = new InputStreamReader(l_connection.getInputStream(), "UTF-8");
            BufferedReader l_reader = new BufferedReader(isr);
            while ((line = l_reader.readLine()) != null) source += line;
        }
        catch (MalformedURLException e)
        {
            System.out.println(e.toString());
        }
        catch (IOException e)
        {
            System.out.println(e.toString());
        }

        Pattern p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(source);
        if(m.find())
            return m.group(1);
        else
            return null;
    }

    public static String getWebReg(String url, String regEx, String def)
    {
        String source = "", line = "";
        try
        {
            HttpURLConnection l_connection = (HttpURLConnection) (new URL(url)).openConnection();
            l_connection.connect();
            InputStreamReader isr = new InputStreamReader(l_connection.getInputStream(), "UTF-8");
            BufferedReader l_reader = new BufferedReader(isr);
            while ((line = l_reader.readLine()) != null) source += line;
        }
        catch (MalformedURLException e)
        {
            System.out.println(e.toString());
        }
        catch (IOException e)
        {
            System.out.println(e.toString());
        }

        Pattern p = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(source);
        if(m.find())
            return m.group(1);
        else
            return def;
    }
}