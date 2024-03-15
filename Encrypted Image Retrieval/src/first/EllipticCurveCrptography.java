package first;
import java.lang.*;
import java.math.*;
import java.util.*;
///* long power */String args[]
public class EllipticCurveCrptography {
	//long power=0;
	
	public static  long power (long a, long b, long p) {
		if(b == 1) {
			return a;
		} else {
			return ((long)Math.pow(a, b)) % p;
		}

	}

	public static void main(String args[]) {
		long   x,  y,  ka, kb;
		System.out.print("Enter p value:");
		Scanner sc = new Scanner(System.in);
	    long p = sc.nextLong();
		System.out.println("The value of P : " + p);
		System.out.print("Enter g value:");
	    long g = sc.nextLong();
		System.out.println("The value of G : " + g + "\n");
		
		System.out.print("Enter a value:");
	    long a= sc.nextLong();
		System.out.println("The private key a for Alice : " + a);
		x = power(g, a, p);
		System.out.print("Enter b value:");
	    long b= sc.nextLong();
		System.out.println("The private key b for Bob : " + b + "\n");
		y = power(g, b, p);

		System.out.println(x+"======"+y);
		
		ka = power(y, a, p);
		kb = power(x, b, p);
		System.out.println("Secret key for the Alice is : " + ka);
		System.out.println("Secret Key for the Bob is : " + kb);
	}
}