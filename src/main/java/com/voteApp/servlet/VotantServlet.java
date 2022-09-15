package com.voteApp.servlet;






import com.didisoft.pgp.PGPLib;
import com.voteApp.Mail.SendMail;
import com.voteApp.dao.Gestiondb;
import com.voteApp.entities.Employe;
import com.voteApp.security.Security;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class TraiterVotant
 */
@WebServlet("/VotantServlet")
public class VotantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VotantServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/TraiterCo");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("******* arriére-plan de votant	  ********");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String datenaissance = request.getParameter("datenaissance");
		String identificateur = request.getParameter("identificateur");
		String bulltinvote = request.getParameter("bulltinvote");
		Gestiondb bd = new Gestiondb();
		Employe e = new Employe(nom, prenom, datenaissance, identificateur);
		
		
		
		
		
		
		
		
		
		
		
		
		
		if(bd.findEmploye(e)) {
			try {
				SendMail s = new SendMail();
				Security sec = new Security();
				// ici on supprime le lien entre le votant et son bulltin de vote
				
				String message1 = nom + ";;" + prenom + ";;" + datenaissance + ";;" + identificateur;
				String message2 = identificateur + ";;" + bulltinvote;
				message1 = sec.encrypteMessage(message1, "CentreCo__publicKey.asc");
				message2 = sec.encrypteMessage(message2, "CentreDe__publicKey.asc");
				System.out.println("le votant à chiffré les deux message avec succés");
				if (s.send("I_CO",
						message1, "votant123@gmail.com",
						"vetkatelvkowaqpx", "comptagecentre@gmail.com") &&
					s.send("B_CO", 
								message2, "votant123@gmail.com",
								"vetkatelvkowaqpx", "comptagecentre@gmail.com") &&
					s.send("B_DE", 
							message2, "votant123@gmail.com",
							"vetkatelvkowaqpx", "depouillementc@gmail.com")
				)
				System.out.println("le votant à envoyé  les message à les deux centre avec succés ");
	
				} catch (Exception ex) {
				// TODO Auto-generated catch block
				ex.printStackTrace();
			}
			ServletContext context= getServletContext();
			RequestDispatcher rd= context.getRequestDispatcher("/CoServlet");
			rd.forward(request, response);
		}else {
			HttpSession session = request.getSession(true);
			String msgErreur = "Erreur : Employ&eacute;(e) non trouv&eacute;(e).";
		    String pageAuth = "/voter.jsp";
			session.setAttribute("erreur", msgErreur);
			session.setAttribute("page", pageAuth);
			getServletContext().getRequestDispatcher("/erreur.jsp").forward(request, response);
		}
	}
	

}

