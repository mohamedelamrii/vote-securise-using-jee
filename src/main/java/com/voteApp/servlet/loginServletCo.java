package com.voteApp.servlet;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.voteApp.dao.Gestiondb;
import com.voteApp.entities.CentreCo;








/**
 * Servlet implementation class TraiterAuthoCo
 */
@WebServlet("/loginServletCo")
public class loginServletCo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServletCo() {
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
		CentreCo c = new CentreCo(email, password);
		// Si le CoManger a bien entr� ces informations on le red�rige vers sa page d'accueil
		if(bd.LoginCo(c)) {
			getServletContext().getRequestDispatcher("/displayCo.jsp").forward(request, response);
		}else {
			// Sinon on lui affiche une message d'erreur
			HttpSession session = request.getSession(true);
			String erreur = "Erreur : L&#039;adresse e-mail ou le mot de passe que vous avez saisi(e) n&#039;est pas associ&eacute;(e) &agrave; un compte.";
		    String page = "/FormLoginCo.jsp";
			session.setAttribute("erreur", erreur);
			session.setAttribute("page", page);
			getServletContext().getRequestDispatcher("/erreur.jsp").forward(request, response);
		}
	}

}

