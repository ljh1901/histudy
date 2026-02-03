package com.histudy.security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PwdModule {
	public static String securityPwd(String pwd) {
		try {
			MessageDigest md= MessageDigest.getInstance("SHA-256");
			md.update(pwd.getBytes());
			byte[] bytes=md.digest();
			StringBuilder sb = new StringBuilder();
			for(byte temp : bytes) {
				sb.append(String.format("%02x", temp));
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
}
