<%@page import="com.voteApp.entities.Votant"%>
<%@page import="java.util.Collection"%>
<%@page import="com.voteApp.dao.Gestiondb"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Centre de comptage</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	
<style>
h1{
  font-size: 30px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 300;
  text-align: center;
  margin-bottom: 15px;
}
table{
  width:100%;
  table-layout: fixed;
}
.tbl-header{
  background-color: rgba(255,255,255,0.3);
 }
.tbl-content{
  height:300px;
  overflow-x:auto;
  margin-top: 0px;
  border: 1px solid rgba(255,255,255,0.3);
}
th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 12px;
  color: #fff;
  text-transform: uppercase;
}
td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-weight: 300;
  font-size: 12px;
  color: #fff;
  border-bottom: solid 1px rgba(255,255,255,0.1);
}


/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body{
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;
}
section{
  margin: 50px;
}


/* follow me template */
.made-with-love {
  margin-top: 40px;
  padding: 10px;
  clear: left;
  text-align: center;
  font-size: 10px;
  font-family: arial;
  color: #fff;
}
.made-with-love i {
  font-style: normal;
  color: #F50057;
  font-size: 14px;
  position: relative;
  top: 2px;
}
.made-with-love a {
  color: #fff;
  text-decoration: none;
}
.made-with-love a:hover {
  text-decoration: underline;
}


/* for custom scrollbar for webkit browser*/

::-webkit-scrollbar {
    width: 6px;
} 
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
} 
::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
}

</style>

</head>


<body>


<!-- ---------------------scripte---------------------------- -->
	<script>
	// '.tbl-content' consumed little space for vertical scrollbar, scrollbar width depend on browser/os/platfrom. Here calculate the scollbar width .
	$(window).on("load resize ", function() {
	  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
	  $('.tbl-header').css({'padding-right':scrollWidth});
	}).resize();
	</script>
<!-- -------------------------------------------- -->


<!-- --------------------------------navbar------------------- -->
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
	         	<a class="active" href="index.jsp"><button class="btn btn-secondary btn-sm float-right">Déconnexion</button></a>
<!-- 				<img class="rounded" src="img/titre.png"> -->
			</div>
       
	     </nav>

<!-- -------------------------------------------------------- -->	
	
	
<section>
  <!--for demo wrap-->
  <h1>Centre de Comptage</h1><br>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
         	<th>id</th>
			<th>Nom</th>
			<th>Prenom</th>
			<th>Date Naissance</th>
			<th>Identificateur</th>
			<th>Bulltin Vote</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table class="table" cellpadding="0" cellspacing="0" border="0">
			<%
				Gestiondb bd = new Gestiondb();
				Collection<Votant> votants = bd.getAllVotant();
					for (Votant votant : votants) {
			%>

			<tr>
				<td><%=votant.getId()%></td>
				<td><%=votant.getNom()%></td>
				<td><%=votant.getPrenom()%></td>
				<td><%=votant.getDatenaissance()%></td>
				<td><%=votant.getIdentificateur()%></td>
				<td><%=votant.getBulltinvote()%></td>
			</tr>
			<%
				}
			%>
    </table>
  </div>
</section>
	
	
<!-- ----------------------------------------------------------- -->
<br>
<br>
<hr>
<br>	

</body>
</html>