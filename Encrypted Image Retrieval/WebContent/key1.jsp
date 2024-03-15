<%@ page import="java.sql.*, javax.sql.*,  java.util.HashSet, java.util.ArrayList, java.util.Iterator, java.io.*"%>
<html>
<head>

<script language="JavaScript">

</script>
</head>

<% Blob b = null;
String buff=null;
StringBuffer sb = new StringBuffer();

String fid = request.getParameter("fid");
System.out.println(fid);

String pkey = request.getParameter("pkey");
System.out.println(pkey);

String reqid = request.getParameter("req");
System.out.println(reqid);

String key1= request.getParameter("key");
System.out.println(key1);

int cnt=0;
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/imageretrieval?characterEncoding=latin1", "root", "ROOT"); 


PreparedStatement pp=con.prepareStatement("select count(*) from req where fid='"+fid+"' and pkey='"+key1+"'");


ResultSet poo=pp.executeQuery();
while(poo.next()){
	
cnt=poo.getInt(1);
}
if(cnt==1)
{
	response.sendRedirect("encimg.jsp?fid="+fid);
}
else
{
	response.sendRedirect("status.jsp?msg=Download Failed because entered KEY was WRONG");
}



%>

</body>
</html>