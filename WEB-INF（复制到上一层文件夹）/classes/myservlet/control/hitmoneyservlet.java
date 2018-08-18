package myservlet.control;
// import mybean.hitmoneybean;
// import javax.servlet.annotation.WebServlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class hitmoneyservlet extends HttpServlet
{
    public void init(ServletConfig config) throws ServletException
    {
        super.init(config);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {
        hitmoneybean digitBean = null;
        HttpSession session = request.getSession(true);
        try
        {
            digitBean = (hitmoneybean)session.getAttribute("digitBean");
            if(digitBean == null)
            {
                digitBean = new hitmoneybean(); //´´½¨Javabean¶ÔÏó
                session.setAttribute("digitBean", digitBean);
            }
        }
        catch(Exception exp)
        {
            digitBean = new hitmoneybean(); //´´½¨Javabean¶ÔÏó
            session.setAttribute("digitBean", digitBean); //digitBean´æ´¢µ½sessionÖÐ
        }
        double a = Double.parseDouble(request.getParameter("money"));
        double b = Double.parseDouble(request.getParameter("number"));

        digitBean.setLatestmoney(a);     //½«Êý¾Ý´æ´¢ÔÚdigitBeanÖÐ
        digitBean.setMoneynum(b);

        double sum = digitBean.getAllmoney();

        sum = sum + a * b;

        digitBean.setAllmoney(sum);

        response.sendRedirect("hitmoney.jsp");  //ÖØ¶¨Ïò
    }

}
class hitmoneybean
{
    double latestmoney;
    double moneynum;
    double allmoney = 0;

    public hitmoneybean()
    {
        ;
    }

    public double getLatestmoney()
    {
        return latestmoney;
    }
    public void setLatestmoney(double a)
    {
        latestmoney = a;
    }
    public double getMoneynum()
    {
        return moneynum;
    }
    public void setMoneynum(double b)
    {
        moneynum = b;
    }
    public double getAllmoney()
    {
        return allmoney;
    }
    public void setAllmoney(double c)
    {
        allmoney = c;
    }
}