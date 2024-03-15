package first;
import first.DesProgram3;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class writeBytes {

	public static void main(InputStream input, OutputStream output)   
		
		{ 
		byte[] writeBuffer = new byte[512];  
		int readBytes = 0;  
		try {
			while ((readBytes = input.read(writeBuffer)) >= 0)   
			{  
			output.write(writeBuffer, 0, readBytes);  
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		 
	}
	

}