package com.voteApp.Mail;



import java.io.File;


import java.io.FileWriter;
import java.io.IOException;

import java.util.Properties;

import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.internet.MimeBodyPart;

import com.didisoft.pgp.PGPException;
import com.didisoft.pgp.PGPLib;
import com.sun.mail.imap.IMAPStore;

public class ReceiveMail {
	

	public ReceiveMail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void receive(String pop3Host, String user, String password, String saveDirectory, int nbrmessage)
			throws IOException {

		try {
			Properties properties = new Properties();
			properties.put("mail.store.protocol", "imaps");
			properties.setProperty("charset", "utf-8");
			Session emailSession = Session.getDefaultInstance(properties);

			// creer l'objet emailStore pour acceder aux messages IMAP
			IMAPStore emailStore = (IMAPStore) emailSession.getStore("imaps");
			emailStore.connect("imap.gmail.com", user, password);

			// creer un objet Folder
			Folder emailFolder = emailStore.getFolder("INBOX");
			// ouvrir l'objet Folder en mode lecture
			emailFolder.open(Folder.READ_ONLY);

			// retourne un tableu des Messages en cet Folder
			Message[] messages = emailFolder.getMessages();
			for (int i = messages.length - 1; i >= 0; i--) {
				Message message = messages[i];
				String subject = message.getSubject();
				if (nbrmessage > 0
						&& ((message.getSubject().compareTo("I_CO") == 0
								|| message.getSubject().compareTo("B_CO") == 0
								|| message.getSubject().compareTo("B_FromCoToDe") == 0
								|| message.getSubject().compareTo("B_DE") == 0 ))) {
					Object content = message.getContent();
					nbrmessage = nbrmessage - 1;
					File f = new File(saveDirectory + subject);
					FileWriter myWriter = new FileWriter(f);
				    myWriter.write(content.toString());
				    myWriter.close();
					}
				}

			// Fermer Folder sans supprimer les messages
			emailFolder.close(false);
			emailStore.close();

		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}
}
