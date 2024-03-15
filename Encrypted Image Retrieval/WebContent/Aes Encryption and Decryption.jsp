<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page   import= "java.io.File"%>
<%@page	import= "java.io.FileInputStream"%>
<%@page	import= "java.io.FileNotFoundException"%>
<%@page	import= "java.io.FileOutputStream"%>
<%@page	import= "java.io.IOException"%>
<%@page	import= "java.io.InputStream"%>
<%@page	import= "java.security.Key"%>
<%@page	import= "java.security.NoSuchAlgorithmException"%>
<%@page	import= "javax.crypto.Cipher"%>
<%@page	import= "javax.crypto.KeyGenerator"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%   KeyGenerator keyGenerator = KeyGenerator.getInstance("AES");
keyGenerator.init(128);
Key key = keyGenerator.generateKey();
System.out.println(key);


File f = new File("C:/users/TEMP.YMTS.007/Desktop/a.mp4");
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
    byte[] encrypted = null;
    try {
        cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        encrypted = cipher.doFinal(content);
    } catch (Exception e) {
        e.printStackTrace();
    }
	       
System.out.println(encrypted);


Cipher cipher1; byte[] decrypted = null; try { cipher1 =
Cipher.getInstance("AES/ECB/PKCS5Padding"); cipher1.init(Cipher.DECRYPT_MODE,
key); decrypted = cipher1.doFinal(encrypted); } catch (Exception e)
{e.printStackTrace();}



System.out.println(decrypted);

try {
FileOutputStream fos = new FileOutputStream("C:/users/TEMP.YMTS.007/Desktop/hydrangeas new.jpg");
fos.write(encrypted);
fos.close();
}
catch (Exception e)  
{e.printStackTrace();}


FileOutputStream fos1 = new
FileOutputStream("C:/users/TEMP.YMTS.007/Desktop/logoenc.mp4");
fos1.write(decrypted); fos1.close();


//  saveFile(decrypted);


System.out.println("Done");





%>
</body>
</html>