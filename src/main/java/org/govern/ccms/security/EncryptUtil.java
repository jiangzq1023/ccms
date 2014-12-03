package org.govern.ccms.security;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;

public class EncryptUtil implements PasswordEncoder{

	//从配置文件中获得  
   private static final String SITE_WIDE_SECRET = "EncryptUtil";  
   private static final PasswordEncoder encoder = new StandardPasswordEncoder(  
      SITE_WIDE_SECRET);  
  
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		EncryptUtil e =new EncryptUtil();
		System.out.println(e.encode("admin"));
		System.out.println(e.matches("admin","a65ccfe15418439f1abe1a3940dc0f7c5650698895ab613cbabc219740296b015f816579fcbc5b8c"));
	}

	@Override
	public String encode(CharSequence rawPassword) {
		return encoder.encode(rawPassword);  
	}

	@Override
	public boolean matches(CharSequence rawPassword, String password) {
		return encoder.matches(rawPassword, password);  
	}


}
