package wxy.jsp.novel;

import java.util.List;
import java.util.ArrayList;

public class UserO
{
	private String userID;
	private String username;
	private String password;
	private String nickname;
	private String email;
	private String tel;
	private List<Book> shelf = new ArrayList<Book>();
	private List<Book> works = new ArrayList<Book>();
	private double money;
	private boolean VIP;
	private boolean writer;

	public UserO()
	{
		;
	}

	public UserO(String id, String name, String ps, String nick)
	{
		userID = id;
		username = name;
		password = ps;
		nickname = nick;
	}

	public void setUserID(String id)
	{
		userID = id;
	}

	public String getUserID()
	{
		return userID;
	}

	public void setUsername(String name)
	{
		username = name;
	}

	public String getUsername()
	{
		return username;
	}

	public void setPassword(String ps)
	{
		password = ps;
	}

	public String getPassword()
	{
		return password;
	}

	public void setNickname(String nick)
	{
		nickname = nick;
	}

	public String getNickname()
	{
		return nickname;
	}

	public void setEmail(String mail)
	{
		email = mail;
	}

	public String getEmail()
	{
		return email;
	}

	public void setTel(String t)
	{
		tel = t;
	}

	public String getTel()
	{
		return tel;
	}

	public void addShelf(String name, String id)
	{
		Book b = new Book(name, id);
		shelf.add(b);
	}

	public String getShelf()
	{
		int len = shelf.size();
		String ans = "";
		Book tb = new Book();
		for (int i = 0; i < len; i++)
		{
			if (i > 0) ans += "|";
			tb = shelf.get(i);
			ans += tb.bookname + "|" + tb.bookID;
		}
		return ans;
	}

	public double getMoney()
	{
		return money;
	}

	public void addMoney(double a) // 只能增减，不能直接设置数值
	{
		money += a;
	}

	public boolean isVIP()
	{
		return VIP;
	}

	public boolean isWriter()
	{
		return writer;
	}


	class Book
	{
		public String bookname;
		public String bookID;
		public String writername;
		public String writerID;

		Book ()
		{
			;
		}

		Book (String a, String b)
		{
			bookname = a;
			bookID = b;
		}

		Book (String a, String b, String c, String d)
		{
			bookname = a;
			bookID = b;
			writername = c;
			writerID = d;
		}
	}

}
