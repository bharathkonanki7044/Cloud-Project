<%@page import="java.util.Random"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.*"%>
<%@page import="first.*"%> 
<%@page import="first.EllipticCurveCrptography"%>

<%
String id=session.getAttribute("reqid").toString();
//String uid=request.getParameter("uid");
System.out.println(id);

//String b=session.getAttribute("b").toString();
 String b=request.getParameter("b");
System.out.println(b); 



 /* Key generating */
String s1=session.getAttribute("p").toString();
String s2=session.getAttribute("g").toString();
String s3=session.getAttribute("a").toString();
String s4=request.getParameter("b"); 

System.out.println(s1);
System.out.println(s2);
System.out.println(s3);
System.out.println(s4);

long a1=Long.parseLong(s1);
long a2=Long.parseLong(s2);
long a3=Long.parseLong(s3);
long a4=Long.parseLong(s4);

long x=0, y=0;
long pka=0, pkb=0;


x=((long)Math.pow(a2,a3)) %a1;
y=((long)Math.pow(a2,a4)) %a1;
System.out.println(x+"========="+a4);

pka=((long)Math.pow(y, a3)) %a1;
pkb=((long)Math.pow(x, a4)) %a1;
System.out.println(pka+"========="+pkb);

if(pka==pkb)
{
   String z=request.getParameter("pkey");
    System.out.println("pka"+pka);
}
else
{
	System.out.println("Key is not Generated");
}

	try
		{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imageretrieval?characterEncoding=latin1","root","ROOT");  
	PreparedStatement pst =con.prepareStatement("update req set status='accepted', b='"+b+"',pkey='"+pka+"' where reqid='"+id+"'");	
	int k=pst.executeUpdate();
	if(k!=0)
	{
	response.sendRedirect("viewreq.jsp?msg=sended");
	}
	else
	{
	response.sendRedirect("viewreq.jsp?msg=failed");
	}
	
	
	}
	catch(Exception e2)
	{
	out.println(e2);
	} 
	%>