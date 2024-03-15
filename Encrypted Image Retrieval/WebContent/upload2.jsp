<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@page import="java.sql.*" %>
<%@page import="java.io.*"%>
<%@page import="java.util.zip.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.zip.*"%>
<%@page import="java.io.File"%>
<%@page	import="java.io.FileInputStream"%>
<%@page	import="java.io.FileNotFoundException"%>
<%@page	import="java.io.FileOutputStream"%>
<%@page	import="java.io.IOException"%> 
<%@page	import="java.io.InputStream"%>
<%@page	import="java.security.Key"%>
<%@page	import="java.security.NoSuchAlgorithmException"%>
<%@page	import="javax.crypto.Cipher"%>
<%@page	import="javax.crypto.KeyGenerator"%>
<%@page import="first.*"%>     
<%@page import="java.io.IOException"%>   
<%@page import="java.io.InputStream"%>   
<%@page import="java.io.OutputStream"%>   
<%@page import="java.security.InvalidAlgorithmParameterException"%>   
<%@page import="java.security.InvalidKeyException"%>  
<%@page import="java.security.NoSuchAlgorithmException"%>  
<%@page import="java.security.spec.AlgorithmParameterSpec"%>  
<%@page import="javax.crypto.Cipher"%>   
<%@page import="javax.crypto.CipherInputStream"%>   
<%@page import="javax.crypto.CipherOutputStream"%>   
<%@page import="javax.crypto.KeyGenerator"%>   
<%@page import="javax.crypto.NoSuchPaddingException"%>   
<%@page import="javax.crypto.SecretKey"%>  
<%@page import="javax.crypto.spec.IvParameterSpec"%> 


   
<%	String sql="";

Cipher encrypt1;  

Cipher decrypt1; 
Key kk=null;
SecretKey ss=null;
String s11=(String)session.getAttribute("un").toString();
System.out.println(s11); 

/* String s6 = request.getParameter("fid"); */
String s = request.getParameter("id");
session.setAttribute("id",s);

String s1 = request.getParameter("fname");
System.out.println(s1);

String file = request.getParameter("file");
System.out.println(file);

String email = request.getParameter("qemail");
session.setAttribute("qemail",email);
/* String email=(String)session.getAttribute("pemail").toString(); */
System.out.println(email); 

String encrypt = request.getParameter("encrypt");
byte[] keyBytes=null;
 
byte[] encrypted = null;


int cnt=0;
File f = new File("C:/Users/bhara/OneDrive/Desktop/" + file);
if( encrypt.equals("aes"))
{

	KeyGenerator keyGenerator = KeyGenerator.getInstance("AES");
	keyGenerator.init(128);
	
    KeyGenerator keyGen = KeyGenerator.getInstance("AES");

    SecretKey key = keyGen.generateKey();
    
    
    //Key key = keyGenerator.generateKey();
	System.out.println(key);
	keyBytes=key.getEncoded();
	InputStream is = null;
	try {
		is = new FileInputStream(f);
	} catch (FileNotFoundException e2) {

		e2.printStackTrace();
	}
	byte[] content = null;
	try {
		content = new byte[is.available()];
	} catch (IOException e1) {

		e1.printStackTrace();
	}
	try {
		is.read(content);
	} catch (IOException e) {

		e.printStackTrace();
	}

	System.out.println(content);

	Cipher cipher;
	try {
		cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE, key);
		encrypted = cipher.doFinal(content);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	sql="insert into upload(fname,file,email,aesencfile,uid,key1 ) values(?,?,?,'"+encrypted+"',?,'"+keyBytes+"')";

	
}
else{
	
	
	final byte[] initialization_vector = { 22, 33, 11, 44, 55, 99, 66, 77 }; 



	  
SecretKey scrtkey = KeyGenerator.getInstance("DES").generateKey(); 


System.out.println(scrtkey);
 keyBytes=scrtkey.getEncoded();
 

AlgorithmParameterSpec aps = new IvParameterSpec(initialization_vector);  
encrypt1 = Cipher.getInstance("DES/CBC/PKCS5Padding");  
encrypt1.init(Cipher.ENCRYPT_MODE, scrtkey, aps);  


sql="insert into upload(fname,file,email,aesencfile,uid,key1 ) values(?,?,?,'"+encrypt1+"',?,'"+keyBytes+"')";

}
	
	FileInputStream fis = new FileInputStream(f);
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imageretrieval?characterEncoding=latin1", "root" , "ROOT"); 
	
	
	
	
	
	//PreparedStatement ps=con.prepareStatement("insert into upload(fname,file,email,aesencfile,uid, ) values(?,?,?,?,?)");
	PreparedStatement ps=con.prepareStatement(sql);

		ps.setString(1, s1);		
		ps.setBinaryStream(2, (InputStream) fis, (int) (f.length()));
		ps.setString(3, email);
	//	ps.setBinaryStream(4, (InputStream)fis11, (int) (f11.length()));
		//ps.setBinaryStream(5, (InputStream)fis12, (int) (f12.length()));
		ps.setString(4, s11);
		
		
		
		ps.executeUpdate();
		response.sendRedirect("upload.jsp?msg=Registered Successful");			

%>
