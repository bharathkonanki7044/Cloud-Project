<%@page import="java.util.Random"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.*"%>


<%
	int count=0;


String s1=session.getAttribute("uid").toString();
Random r=new Random();
int a=r.nextInt(10000);	
int c=0;
String a1=request.getParameter("p");
System.out.println(a);

Random d=new Random();
int e=d.nextInt(10000);	
int c1=0;


String e1=request.getParameter("g");
System.out.println(e);
/* String s1 = request.getParameter("uid"); */
System.out.println(s1);
String a2=request.getParameter("b");

	try
		{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imageretrieval?characterEncoding=latin1","root","ROOT"); 
	PreparedStatement pst =con.prepareStatement("update req set p='"+a+"',g='"+e+"',b='"+a2+"'where uid='"+s1+"'");
	int k=pst.executeUpdate();
	if(k!=0)
	{
	response.sendRedirect("viewreq.jsp?msg=sended");
	}
	else
	{
	response.sendRedirect("viewreq.jsp?msg=failed");
	}
	
	 %>
	
	
	
	<%
		} catch (Exception e2) {
			out.println(e2);
		}
	%>
	<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hybrid Encryption</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicons
    ================================================== -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"  href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.css">

<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css"  href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Rochester" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
     < <style>
 body  {
  background-image: url("img/cloud9.jpg");
  background-color: #cccccc;
  background-size:cover;
} 
h2{
text-transform:capitalize;
color:white;
}

</style> 
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
<!-- Navigation
    ==========================================-->
<nav id="menu" class="navbar navbar-default navbar-fixed-top">
  <div class="container"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
    </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <h1 style="color:white">Enhancing Cloud Image Retrieval Efficiency through Secure Optimization</h1></br>
      <ul class="nav navbar-nav">
       <li class="active" align="left"> <a href="userhome.jsp">Home</a> </li>                                               
         <li> <a href="upload.jsp">Upload</a> </li>
         <li><a href="download2.jsp">View Files</a></li> 
         <li><a href="sfile.jsp">Search Files</a></li>
         <li><a href="viewreq.jsp">View Request</a></li>
         <li><a href="status.jsp">View Status</a></li>
         <li><a href="index.html">Logout</a></li> 
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
</nav>
<%
String id= request.getParameter("uid");
session.setAttribute("uid",id);
String a3= request.getParameter("a");
session.setAttribute("a",a3);
%>
<!-- Header -->
<header id="header">
  <!-- <div class="intro"> -->
    <div class="overlay">
      <div class="container">
        <div class="row">
          <div class="intro-text">
            
             <center>             
      <form action=setup2back.jsp method="post"><br>
	     
			<h2 style="color: #4dffff">Key Generation</h2><br>
			<table>
			<tr>
			<td style="color:white;">Enter value for b:</td>
			<td><input type="text" name="b" required></td>
			</tr>
			
			
			</table><br>
			
		 
		  
		  <input type="submit" value="submit"  style="color:white;background-color:#608499">
		  
			
             </form>
                         
	<div>
	 
    </div>



          </div></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
          </br>
        </div>
      </div>
    </div>
  </div>
</header>

<script type="text/javascript" src="js/jquery.1.11.1.js"></script> 
<script type="text/javascript" src="js/bootstrap.js"></script> 
<script type="text/javascript" src="js/SmoothScroll.js"></script> 
<script type="text/javascript" src="js/jqBootstrapValidation.js"></script> 
<script type="text/javascript" src="js/contact_me.js"></script> 
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>