
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="first.*"%> 
<%@page import=" java.io.*"%>  
<%@page import=" java.io.FileOutputStream"%>   
<%@page import=" java.io.IOException"%>   
<%@page import=" java.io.InputStream"%>   
<%@page import=" java.io.OutputStream"%>   
<%@page import=" java.security.InvalidAlgorithmParameterException"%>   
<%@page import=" java.security.InvalidKeyException"%>  
<%@page import=" java.security.NoSuchAlgorithmException"%>  
<%@page import=" java.security.spec.AlgorithmParameterSpec"%>  
<%@page import=" javax.crypto.Cipher"%>   
<%@page import=" javax.crypto.CipherInputStream"%>   
<%@page import=" javax.crypto.CipherOutputStream"%>   
<%@page import=" javax.crypto.KeyGenerator"%>   
<%@page import=" javax.crypto.NoSuchPaddingException"%>   
<%@page import=" javax.crypto.SecretKey"%>  
<%@page import=" javax.crypto.spec.IvParameterSpec"%> 

<%
  Cipher encrypt;  
  
 Cipher decrypt;  
  
 final byte[] initialization_vector = { 22, 33, 11, 44, 55, 99, 66, 77 }; 


 
String encryptedData = "C:/users/TEMP.YMTS.007/Desktop/desenc.jpg";  
  
String decryptedData = "C:/users/TEMP.YMTS.007/Desktop/desdecfile.jpg";  
try   
{  
  
//SecretKey scrtkey = KeyGenerator.getInstance("DES").generateKey(); 


//System.out.println(scrtkey);

	// File file = new File("C:/Users/prathap/Desktop/filename.txt");
	


	 byte[] keyBytes =Files.readAllBytes(Paths.get("C:/users/TEMP.YMTS.007/Desktop/filenamejj.txt"));// Files.readAllBytes(Paths.get("C:/Users/prathap/Desktop/filename.txt"));// .readAllBytes(Paths.get(filename));

	// byte[] keyBytes =Files.readAllBytes(Paths.get("C:/users/TEMP.YMTS.007/Desktop/a.txt"));
     KeyGenerator keyGen = KeyGenerator.getInstance("DES");

     SecretKey key4 = new SecretKeySpec(keyBytes,"DES");// new SecretKeySpec(keyBytes,"DES");// SecretKeySpec(keyBytes, algorithm);

     //SecretKey key4 = session.getAttribute(key1).toint();
     
AlgorithmParameterSpec aps = new IvParameterSpec(initialization_vector);  

  
decrypt = Cipher.getInstance("DES/CBC/PKCS5Padding");  
decrypt.init(Cipher.DECRYPT_MODE, key4, aps);  
 
 



  


byte[] writeBuffer = new byte[512];  
int readBytes = 0;  






 

InputStream input1=new FileInputStream(encryptedData);
OutputStream output1=new FileOutputStream(decryptedData);

input1 = new CipherInputStream(input1, decrypt);  




byte[] writeBuffer1 = new byte[512];  

int readBytes1 = 0;  
while ((readBytes1 = input1.read(writeBuffer1)) >= 0)   
{  
output1.write(writeBuffer1, 0, readBytes1);  
}  
output1.close();  

input1.close();    

System.out.println("The encrypted and decrypted files have been created successfully.");  
}   
 
catch (NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | InvalidAlgorithmParameterException | IOException e)   
{  
  
e.printStackTrace();  
}  
 
%>