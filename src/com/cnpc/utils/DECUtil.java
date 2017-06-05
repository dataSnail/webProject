package com.cnpc.utils;

import java.security.Key;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;


public class DECUtil {
	private static Key key;
    private static String KEY_STR = "0yvq4ag_FAeYBbJ%-%f.i03Ce?%1i|71:y~%%,$ad-6N2\"!He+H1bk1R`:BJ70D/b11a~h\\}qq4LcaC1a.4a!(05j7lSM*bc@&0694\f1fY~;+_H30f/j#;95JCbk)d0t^M1p70/B35K211RB)Fm1B}1'd]xo'}'947j8ED\"CiAj&Lb9_0p337)2*At#jc273NA1TB7`0WK14@Kp]@_8d27k0;Mz{BT91CT[7ys]e0F-za1dYG54OJdw7Z12o3";// 密钥
    private static String CHARSETNAME = "UTF-8";// 编码
    private static String ALGORITHM = "DES";// 加密类型
    static {
        try {
            KeyGenerator generator = KeyGenerator.getInstance(ALGORITHM);
            generator.init(new SecureRandom(KEY_STR.getBytes()));
            key = generator.generateKey();
            generator = null;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    /**
     * 对str进行DES加密
     * 
     * @param str
     * @return
     */
    public static String getEncryptString(String str) {
        try {
            byte[] bytes = str.getBytes(CHARSETNAME);
            Cipher cipher = Cipher.getInstance(ALGORITHM);
            cipher.init(Cipher.ENCRYPT_MODE, key);
            byte[] doFinal = cipher.doFinal(bytes);
            return BASE64.encode(doFinal);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    /**
     * 对str进行DES解密
     * 
     * @param str
     * @return
     */
    public static String getDecryptString(String str) {
        try {
            byte[] bytes = BASE64.decode(str);
            Cipher cipher = Cipher.getInstance(ALGORITHM);
            cipher.init(Cipher.DECRYPT_MODE, key);
            byte[] doFinal = cipher.doFinal(bytes);
            return new String(doFinal, CHARSETNAME);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    public static void main(String args []){
    	System.out.println("a");
    	System.out.println(DECUtil.getEncryptString("mmily"));
    	System.out.println(DECUtil.getDecryptString("j+GP5dgBLqA="));
    }
    
}
