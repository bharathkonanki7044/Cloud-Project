<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.security.Key"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import=" java.io.*"%>
<%@page import=" java.nio.*"%>
<%@page import=" java.security.*"%>
<%@page import=" java.security.spec.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		KeyGenerator keyGenerator = KeyGenerator.getInstance("AES");
		keyGenerator.init(128);
		byte[] keyBytes = Files.readAllBytes(Paths.get("C:/users/TEMP.YMTS.007/Desktop/filename.txt"));// .readAllBytes(Paths.get(filename));

		//byte[] keyBytes = Files.readAllBytes(Paths.get("C:/users/TEMP.YMTS.007/Desktop/hydrangeas new.jpg"));
        KeyGenerator keyGen = KeyGenerator.getInstance("AES");

        SecretKey key4 = new SecretKeySpec(keyBytes,"AES");// SecretKeySpec(keyBytes, algorithm);
        //SecretKey key4 = session.getAttribute(key1);
 
	File f = new File("C:/Users/prathap/Desktop/enc.jpg");
	InputStream is = null;
	
	byte[] content = null;

	try {
		is = new FileInputStream(f);
	} catch (FileNotFoundException e2) {

		e2.printStackTrace();
	}
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

	

		Cipher cipher1;
		byte[] decrypted = null;
		try {
			cipher1 = Cipher.getInstance("AES/ECB/PKCS5Padding");
			cipher1.init(Cipher.DECRYPT_MODE, key4);
			decrypted = cipher1.doFinal(content);
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println(decrypted);

	
		FileOutputStream fos1 = new FileOutputStream("C:/users/TEMP.YMTS.007/Desktop/logoencaa.jpg");
		fos1.write(decrypted);
		fos1.close();


		System.out.println("Done");
	%>
</body>
</html>