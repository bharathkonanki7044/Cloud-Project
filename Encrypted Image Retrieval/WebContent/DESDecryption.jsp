 <%@page import="first.*"%>  
<%@page import=" java.io.FileInputStream"%>  
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


 String textFile = "C:/users/TEMP.YMTS.007/Desktop/hydrangeas new.jpg";  
 
String encryptedData = "C:/users/TEMP.YMTS.007/Desktop/penguins.txt";  
  
String decryptedData = "C:/users/TEMP.YMTS.007/Desktop/jellyfish.jpg";  
try   
{  
  
SecretKey scrtkey = KeyGenerator.getInstance("DES").generateKey();  
AlgorithmParameterSpec aps = new IvParameterSpec(initialization_vector);  
  
encrypt = Cipher.getInstance("DES/CBC/PKCS5Padding");  
encrypt.init(Cipher.ENCRYPT_MODE, scrtkey, aps);  
  
decrypt = Cipher.getInstance("DES/CBC/PKCS5Padding");  
decrypt.init(Cipher.DECRYPT_MODE, scrtkey, aps);  
 
/* /* encryption(new FileInputStream(textFile), new FileOutputStream(encryptedData)); */   
 



OutputStream output = new CipherOutputStream(new FileOutputStream(encryptedData), encrypt);  
  


byte[] writeBuffer = new byte[512];  
int readBytes = 0;  

InputStream input=new FileInputStream(textFile);
while ((readBytes = input.read(writeBuffer)) >= 0)   
{  
output.write(writeBuffer, 0, readBytes);  
}  

writeBytes.main(input,output);
//writeBytes(input, output);  
output.close();  

input.close();  




 

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

System.out.println("The Decrypted  file have been created successfully.");  
}    
 
catch (NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | InvalidAlgorithmParameterException | IOException e)   
{  
  
e.printStackTrace();  
}  
 
%>