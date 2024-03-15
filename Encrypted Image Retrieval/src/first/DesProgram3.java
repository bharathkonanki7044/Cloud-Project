package first;

/*import java.io.FileWriter;*/
import java.io.FileInputStream;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.io.OutputStream;  
import java.security.InvalidAlgorithmParameterException;  
import java.security.InvalidKeyException;  
import java.security.NoSuchAlgorithmException;  
import java.security.spec.AlgorithmParameterSpec;  
import javax.crypto.Cipher;  
import javax.crypto.CipherInputStream;  
import javax.crypto.CipherOutputStream;  
import javax.crypto.KeyGenerator;  
import javax.crypto.NoSuchPaddingException;  
import javax.crypto.SecretKey;  
import javax.crypto.spec.IvParameterSpec;    
public class DesProgram3   
{  
 
private static Cipher encrypt;  
  
private static Cipher decrypt;  
  
private static final byte[] initialization_vector = { 22, 33, 11, 44, 55, 99, 66, 77 };  
 
public static void main(String textFile )   
	{ /*
		 * try { FileWriter fw=new
		 * FileWriter("C:/users/TEMP.YMTS.007/Desktop/Demodata.txt");
		 * fw.write("Welcome to DES Alogithm"); fw.close(); } catch(Exception
		 * e){System.out.println(e);} System.out.println("Success...");
		 */
	
  
 textFile = "C:/users/TEMP.YMTS.007/Desktop/logo.jpg";  
 
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
 
//encryption(new FileInputStream(textFile), new FileOutputStream(encryptedData));  
 



OutputStream output = new CipherOutputStream(new FileOutputStream(encryptedData), encrypt);  
  


byte[] writeBuffer = new byte[512];  
int readBytes = 0;  

InputStream input=new FileInputStream(textFile);
while ((readBytes = input.read(writeBuffer)) >= 0)   
{  
output.write(writeBuffer, 0, readBytes);  
}  
writeBytes(input, output);  
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

System.out.println("The encrypted and decrypted files have been created successfully.");  
}   
 
catch (NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | InvalidAlgorithmParameterException | IOException e)   
{  
  
e.printStackTrace();  
}  
}  
  
	
private static void writeBytes(InputStream input, OutputStream output)  throws IOException   
{ 
byte[] writeBuffer = new byte[512];  
int readBytes = 0;  
while ((readBytes = input.read(writeBuffer)) >= 0)   
{  
output.write(writeBuffer, 0, readBytes);  
}  
  

}   

}



//select 'kk',aes_encrypt('kk','kp'), AES_decrypt(aes_encrypt('kk','kp'),'kp')
