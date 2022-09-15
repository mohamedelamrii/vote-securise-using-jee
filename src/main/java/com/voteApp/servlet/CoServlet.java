package com.voteApp.servlet;
import java.io.IOException;

import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.voteApp.Mail.ReadFile;
import com.voteApp.Mail.ReceiveMail;
import com.voteApp.Mail.SendMail;
import com.voteApp.dao.Gestiondb;
import com.voteApp.entities.Votant;
import com.voteApp.security.Security;



/**
 * Servlet implementation class TraiterCo
 */
@WebServlet("/CoServlet")
public class CoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n*********** 	Centre de Comptage  	**********");
		Gestiondb bd = new Gestiondb();
		try {
		ReceiveMail r = new ReceiveMail();
		Security sec = new Security();
		r.receive("imap.gmail.com", "comptagecentre@gmail.com", "tshjfngapjflrotz",
				"C:\\Users\\MyPC\\OneDrive\\Bureau\\Vote_Securise\\messages\\co\\", 2);
		System.out.println("centre de comptage a recu les deux messages  avec succés .");
		sec.decrypteFile("co/I_CO", "CentreCo__SECRETKey.asc", "co/output.txt");
		System.out.println("Le centre de comptage dichiffré le message 1 avec succés .");
		ReadFile readfile = new ReadFile();
		String msg1 = readfile.readfile("C:\\Users\\MyPC\\OneDrive\\Bureau\\Vote_Securise\\messages\\co\\output.txt");
		String msg2 = readfile.readfile("C:\\Users\\MyPC\\OneDrive\\Bureau\\Vote_Securise\\messages\\co\\B_CO");
		String nom = null, prenom = null, datenaissance = null, identificateur = null, bulltinvote = null;
		String donne[] = msg1.split(";;");
		nom = donne[0];
		prenom = donne[1];
		datenaissance = donne[2];
		identificateur = donne[3];
		bulltinvote = msg2;

		Votant votant = new Votant(nom, prenom, datenaissance, identificateur, bulltinvote);
		System.out.println("Le votant est  :  "+votant.getNom() + " " + votant.getPrenom() + " --- Identificateur: "+votant.getIdentificateur());
		if (bd.setVotant(votant) == true) {
			SendMail send = new SendMail();
			
			msg2 = sec.encrypteMessage(msg2, "CentreDe__publicKey.asc");
			System.out.println("Le centre de comptage a chiffré une autre fois le message 2  avec succés .");
			send.send("B_FromCoToDe",
					msg2, "comptagecentre@gmail.com",
					"tshjfngapjflrotz", "depouillementc@gmail.com");
			System.out.println("Centre de comptage a envoyé le message 2 au centre DE avec succ�s .");
		} else {
			HttpSession session = request.getSession(true);
			String err = "Oooooops vous avez deja voter !!!!!!";
			session.setAttribute("erreur", err);
			 String pageAuth = "/voter.jsp";
			 session.setAttribute("page", pageAuth);
			getServletContext().getRequestDispatcher("/erreur.jsp").forward(request, response);
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		ServletContext context= getServletContext();
		RequestDispatcher rd= context.getRequestDispatcher("/DeServlet");
		rd.forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

