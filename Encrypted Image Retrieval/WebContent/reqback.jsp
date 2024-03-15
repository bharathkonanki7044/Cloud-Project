<%@page import="java.util.Random"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.*"%>
<%@page import="first.*"%> 
<%@page import="first.EllipticCurveCrptography.* "%>
<%
	int count=0;

//String s1=request.getParameter("id");
String s1=session.getAttribute("fid").toString();
//String s1=request.getParameter("oid");
System.out.println(s1);

String s2=session.getAttribute("fname").toString();
//String s2 = request.getParameter("fname");
System.out.println(s2);

String email=session.getAttribute("qemail").toString();
//String email = request.getParameter("qemail");
System.out.println(email);

/* String fid=session.getAttribute("fid").toString();
//String fid = request.getParameter("fid");
System.out.println(fid); */



String s11=session.getAttribute("uid").toString();
System.out.println(s11); 

 String s12=session.getAttribute("un").toString();
System.out.println(s12);  

 Random r=new Random();
	int a=r.nextInt(10000);	
	int c=0;
//String a1=S;//request.getParameter("p");
System.out.println(a);

Random d=new Random();
int e=d.nextInt(10000);	
int c1=0;


//String e1=request.getParameter("g");
System.out.println(e); 



String a2=request.getParameter("a");
System.out.println(a2);
/* String uid=request.getParameter("uid");
session.setAttribute("uid",uid);
System.out.println(uid); */

	try
		{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imageretrieval?characterEncoding=latin1","root","ROOT"); 
	PreparedStatement pst =con.prepareStatement("insert into req (fid,fname,email,p,g,a,owid,uid) values(?,?,?,?,?,?,?,?)");
	pst.setString(1, s1);
	pst.setString(2, s2);
	pst.setString(3,email);
	//pst.setString(4,fid);
	pst.setInt(4,a);
	pst.setInt(5,e);
	pst.setString(6,a2);
	pst.setString(7,s11);
	pst.setString(8,s12);
	
	
	
	
	
	
	int k=pst.executeUpdate();
	/* PreparedStatement pst1 =con.prepareStatement("insert into req (a)"); */
	if(k==1)
	{
	response.sendRedirect("searchback.jsp?msg=sended");
	}
	else
	{
	response.sendRedirect("searchback.jsp?msg=failed");
	}
	
	 %>
	
	
	
	<%
		} catch (Exception e2) {
			out.println(e2);
		}
	%></html>