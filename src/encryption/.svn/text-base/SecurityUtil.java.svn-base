package encryption;

import java.security.*;

public class SecurityUtil {
	
	public static byte[] digest(String alg,byte[] input)throws NoSuchAlgorithmException{
		MessageDigest md =MessageDigest.getInstance(alg);
		return md.digest(input);
	}
	
	public static String getCryptoMD5String(String inputValue)throws Exception{
		if(inputValue==null) throw new Exception("Can't conver to Message Digest 5 String value");
		byte[] ret =digest("SHA-1",inputValue.getBytes());
		String result=Base64Util.encode(ret);
		return result;
	}

}
