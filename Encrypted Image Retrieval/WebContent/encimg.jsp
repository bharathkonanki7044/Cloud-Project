<%@ page import="java.sql.*, javax.sql.*,  java.util.HashSet, java.util.ArrayList, java.util.Iterator, java.io.*"%>
<html>
<head>

<script language="JavaScript">

</script>
</head>
<%String id=request.getParameter("fid"); %>
<%@page import="java.sql.*"%>
<% Blob b = null;
String buff=null;


try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imageretrieval?characterEncoding=latin1","root","ROOT"); 
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select file from upload where fid='"+id+"'");
	while(rs.next())
	{
		b=rs.getBlob(1);
		buff="file"+".jpg";
	}
	}
catch(Exception e)
{
	out.println(e);
}
	%>
<body>		
<%

		
		if(b != null)
		{
			String fileName = buff;
			byte[] ba = b.getBytes(1, (int)b.length());
			response.setContentType("image");
			response.setHeader("Content-Disposition","attachment; fileName=\""+fileName+"\"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
			//session.removeAttribute("document1");
		}
		else
		{
			//response.sendRedirect("cost_recharge2.jsp");
			System.out.println("null");
		}
%>

</body>
</html>