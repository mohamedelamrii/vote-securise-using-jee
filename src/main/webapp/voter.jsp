<%@page import="java.util.ArrayList"%>
<%@page import="com.voteApp.entities.Votant"%>
<%@page import="java.util.Collection"%>
<%@page import="com.voteApp.dao.Gestiondb"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Page de Vote</title>

		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up Form</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/main.css">
<!-- ------------------------------------- -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<style>
.register {
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
    margin-top: 3%;
    padding: 3%;
}

.register-left {
    text-align: center;
    color: #fff;
    margin-top: 4%;
}

.register-left input {
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    width: 60%;
    background: #f8f9fa;
    font-weight: bold;
    color: #383d41;
    margin-top: 30%;
    margin-bottom: 3%;
    cursor: pointer;
}

.register-right {
    background: #f8f9fa;
    border-top-left-radius: 10% 50%;
    border-bottom-left-radius: 10% 50%;
}

.register-left img {
    margin-top: 15%;
    margin-bottom: 5%;
    width: 25%;
    -webkit-animation: mover 2s infinite alternate;
    animation: mover 1s infinite alternate;
}

@-webkit-keyframes mover {
    0% {
        transform: translateY(0);
    }

    100% {
        transform: translateY(-20px);
    }
}

@keyframes mover {
    0% {
        transform: translateY(0);
    }

    100% {
        transform: translateY(-20px);
    }
}

.register-left p {
    font-weight: lighter;
    padding: 12%;
    margin-top: -9%;
}

.register .register-form {
    padding: 10%;
    margin-top: 10%;
}

.btnRegister {
    float: right;
    margin-top: 10%;
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    background: #0062cc;
    color: #fff;
    font-weight: 600;
    width: 50%;
    cursor: pointer;
}

.register .nav-tabs {
    margin-top: 3%;
    border: none;
    background: #0062cc;
    border-radius: 1.5rem;
    width: 28%;
    float: right;
}

.register .nav-tabs .nav-link {
    padding: 2%;
    height: 34px;
    font-weight: 600;
    color: #fff;
    border-top-right-radius: 1.5rem;
    border-bottom-right-radius: 1.5rem;
}

.register .nav-tabs .nav-link:hover {
    border: none;
}

.register .nav-tabs .nav-link.active {
    width: 100px;
    color: #0062cc;
    border: 2px solid #0062cc;
    border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
}

.register-heading {
    text-align: center;
    margin-top: 8%;
    margin-bottom: -15%;
    color: #495057;
}
</style>
<!-- Custom styles for this template -->
</head>
<body>

       	
       	<nav class="navbar navbar-dark bg-dark">
	       <div class="col-sm-4">
	         <img class="logo" src="img/logo.png">
	        </div>
	        <div class="col-sm-4 text-center">
	 			<img class="logo" src="img/mgl.png">
	 		</div>
<!-- 	        <div class="col-sm-4"> -->
<!-- 				<br><h2 class="text-center text-white" style="margin-bottom: 10%">MGL Vote</h2> -->
<!-- 	        </div> -->
	        <div class="col-sm-4">
	        	<div class="text-center">
	         	<a class="active" href="index.jsp"><button class="btn btn-secondary btn-sm float-right">Retour</button></a>
<!-- 				<img class="rounded" src="img/titre.png"> -->
				</div>
			</div>
       
	     </nav>
<!-- ----------------------------------------------------------- -->
<div class="container register">
    <div class="row">
        <div class="col-md-3 register-left">
            <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
            <h3>Bienvenue sur MGL Vote</h3>
<!--             <p>Bienvenue sur MGL Vote</p> -->
            <input type="submit" name="" value="----->" /><br />
        </div>
        <div class="col-md-9 register-right">
          <form class="" method="post" action="VotantServlet">
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <h3 class="register-heading">Vote</h3>
                    <div class="row register-form">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" id="inputEmail" class="form-control" placeholder="Enter nom" value="" name="nom" required autofocus/>
                            </div>
                            <div class="form-group">
                                <input type="text" id="inputEmail" class="form-control" placeholder="Enter prénom" value="" name="prenom" required autofocus/>
                            </div>
                            <div class="form-group">
								<input type="date" id="inputEmail" class="form-control" name="datenaissance" placeholder="Enter date naissance" required autofocus> 
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
								<input type="text" name="identificateur" id="inputEmail" class="form-control" placeholder="Enter identification" required autofocus> 
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="bulltinvote">
                                    <option class="hidden" selected disabled>Choix Condidate</option>
									<% Gestiondb bd = new Gestiondb();
				    					int nbrVotes;
				    					ArrayList<String> list = bd.getCandidats();
				    					for(String candidat : list){
									%>
										<option value="<%=candidat%>"><%=candidat%></option>
									<%    					
									}
									%>
                                </select>
                            </div>
                            <input type="submit" class="btnRegister" value="Envoyer" name="env"/>
                        </div>
                       
                    </div>
                </div>

            </div>
            </form>
        </div>
    </div>

</div>

<br>
<br>
<hr>
<br>
<!-- 					<h5 class="h3 mb-3 font-weight-normal">footer</h5> -->

<!-- ------------------------------------------------------- -->



	
</body>
</html>