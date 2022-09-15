package com.voteApp.servlet;


import java.io.IOException;

import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.voteApp.Mail.ReadFile;
import com.voteApp.Mail.ReceiveMail;
import com.voteApp.dao.Gestiondb;
import com.voteApp.entities.Votant;
import com.voteApp.entities.Vote;
import com.voteApp.security.Security;



/**
 * Servlet implementation class TraiterDe
 */
@WebServlet("/DeServlet")
public class DeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n********	Centre de Depouillement	   ********");
		ReceiveMail rec = new ReceiveMail();
		Gestiondb bd = new Gestiondb();
		Security sec = new Security();

		try {
			Thread.sleep(12000);
			rec.receive("imap.gmail.com", "depouillementc@gmail.com", "vuamxkcjeoxhwecz",
					"C:\\Users\\MyPC\\OneDrive\\Bureau\\Vote_Securise\\messages\\de\\", 2);
			System.out.println("centre deploiement a recu les deux messages  .");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			sec.decrypteFile("de/B_FromCoToDe", "CentreDe_SECRETKey.asc", "de/B_FromCoToDe2");
				System.out.println("Le message 2 envoyer par Co est dichiffré avec succés .");
				sec.decrypteFile("de/B_FromCoToDe2", "CentreDe_SECRETKey.asc", "de/outputCo.txt");		
				System.out.println("Le message 2 envoyer par Co est dichiffré une autre fois avec succés .");
				sec.decrypteFile("de/B_DE", "CentreDe_SECRETKey.asc", "de/outputVotant.txt");
				System.out.println("Le message 2 envoyer par le votant est dichiffré avec succés .\n");
				ReadFile readfile = new ReadFile();
				String msg1 = readfile.readfile("C:\\Users\\MyPC\\OneDrive\\Bureau\\Vote_Securise\\messages\\de\\outputCo.txt");
				System.out.println(msg1);
				String msg2 = readfile.readfile("C:\\Users\\MyPC\\OneDrive\\Bureau\\Vote_Securise\\messages\\de\\outputVotant.txt");
				System.out.println(msg2);
				String donne1[] = msg1.split(";;");
				String donne2[] = msg2.split(";;");
				if (donne1[0].compareTo(donne2[0]) == 0 && donne1[1].compareTo(donne2[1]) == 0) {
					Vote vote = new Vote(donne1[0], donne1[1]);
					bd.setVote(vote);
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		getServletContext().getRequestDispatcher("/voter.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

