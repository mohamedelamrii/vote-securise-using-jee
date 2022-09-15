package com.voteApp.Mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

 
public class SendMail {  
	// Constructor
		public SendMail() {
		}
		
		public Boolean send(String subjecttype,String text,final String from,final String password,String to){
		      String host = "smtp.gmail.com";
		      
		      // Creer un objet Properties qui contient les informations necessaire pour assurer la connection au serveur de mails.
		      Properties prop = new Properties();
				prop.put("mail.smtp.host", "smtp.gmail.com");
		        prop.put("mail.smtp.port", "587");
		        prop.put("mail.smtp.auth", "true");
		        prop.put("mail.smtp.starttls.enable", "true"); //TLS    

		      // La classe Session encapsule pour un client donn� sa connexion avec le serveur de mails.
		        Session session = Session.getInstance(prop,
		                new javax.mail.Authenticator() {
		                    protected PasswordAuthentication getPasswordAuthentication() {
		                        return new PasswordAuthentication(from, password);
		                    }
		                });

		      try{
		         // Creer une objet MimeMessage
		         MimeMessage message = new MimeMessage(session);
		         // Mettre � jour l'�metteur
		         message.setFrom(new InternetAddress(from));
		         // Mettre � jour les destinataires d'un type
		         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		         // Mettre � jour le sujet du message
		         message.setSubject(subjecttype);
		         // Mettre � jour le contenu du message
		         message.setText(text);
		         // Envoyer le message
		         Transport.send(message);
		         return true;         	         
		      }catch (MessagingException mex) {
		         mex.printStackTrace();
		      }
			return false;
		 }
}