package com.voteApp.security;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import com.didisoft.pgp.PGPException;
import com.didisoft.pgp.PGPLib;

public class Security {
	public String encrypteMessage(String message, String keyFile) {
		   String encryptedString = "";
		 try {
			 
		        // creer un objet PGPLib
		        PGPLib pgp = new PGPLib();
		 
		        String publicEncryptionKeyFile = "C:\\Users\\MyPC\\OneDrive\\Bureau\\Vote_Securise\\Keys\\" + keyFile;
		        
		 
		        InputStream publicEncryptionKeyStream = null;
					publicEncryptionKeyStream = new FileInputStream(publicEncryptionKeyFile);
		 
		        // encrypte une chaine de caractere passee en argument
					encryptedString = pgp.encryptString(message,
		                               publicEncryptionKeyStream);
		       } catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		             return encryptedString;
	   }
	
	
	public void decrypteFile(String fileName, String privateKeyFile, String output) {
		String path1 = "C:\\Users\\MyPC\\OneDrive\\Bureau\\Vote_Securise\\Keys\\";
		String path2 = "C:\\Users\\MyPC\\OneDrive\\Bureau\\Vote_Securise\\messages\\";
		// creer un objet PGPLib
		   PGPLib pgp = new PGPLib();
		   
		   String privateKeyPass = "";
		   try {
		// D�crypte un fichier crypt� OpenPGP � l'aide d'une cl� d'un magasin de cl�s OpenPGP.
			String originalFileName = pgp.decryptFile(path2+fileName,
								path1+privateKeyFile,
								privateKeyPass,
								path2+output);
		} catch (PGPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	
}
