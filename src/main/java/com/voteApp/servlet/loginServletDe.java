package com.voteApp.servlet;


import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.voteApp.dao.Gestiondb;
import com.voteApp.entities.CentreDe;



/**
 * Servlet implementation class TraiterAuthoDe
 */
@WebServlet("/loginServletDe")
public class loginServletDe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServletDe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Gestiondb bd = new Gestiondb();
		CentreDe d = new CentreDe(email, password);
		// Si le DeManger a bien entr� ces informations on le red�rige vers sa page d'accueil
		if(bd.loginDe(d)) {
			getServletContext().getRequestDispatcher("/displayDe.jsp").forward(request, response);
		}else {
			// Sinon on lui affiche une message d'erreur
			HttpSession session = request.getSession(true);
			String msgErreur = "Erreur : L&#039;adresse e-mail ou le mot de passe que vous avez saisi(e) n&#039;est pas associ&eacute;(e) &agrave; un compte.";
		    String pageAuth = "FormLoginDe.jsp";
			session.setAttribute("erreur", msgErreur);
			session.setAttribute("page", pageAuth);
			getServletContext().getRequestDispatcher("/erreur.jsp").forward(request, response);
		}
	}

}
