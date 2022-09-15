<%@page import="java.util.ArrayList"%>
<%@page import="com.voteApp.entities.Vote"%>
<%@page import="java.util.Collection"%>
<%@page import="com.voteApp.dao.Gestiondb"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Résultats Des Votes</title>
	<link rel="stylesheet" type="text/css" href="../css/home.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- ---------------------------------- -->
<style>

#contenitore{
position: relative;
width: 800px;
margin: 20px auto;
text-align:center;
overflow:hidden;
font: 14px 'Trebuchet MS', sans serif;
}
.left{
float:left;
width:48%;
}
#grafico{
position:relative;
height:300px;
border-left:2px solid #000000;
border-bottom: 2px solid #000000;
width:100%;
margin-top:20px;
}
.riga{
position:absolute;
left:0;
height: 1px;
background-color:gray;
width: 100%;
}
.riga div{
float:left;
margin: -8px 0 0 -40px;
}
.canc{
clear:both;
}
table{
width:60%;
background-color: white;
color: #000;
margin: 1em auto;
}
table caption{
background-color: #D8EED8;
color: #004156;
text-align: left;
}
table tr:nth-child(2n){
background-color: #D8EED8;
}
table tr:nth-child(2n+1){
background-color: #BFDFFF;
}
table td{
text-align:center;
border-bottom: 1px solid #CDCDCD;
padding: 6px;
}
.column{
position:absolute;
width: 16%;
bottom: 0;
background-color: #003366;
margin-left:5%;
}
div.button {
    margin: 0 auto;
    text-align: center;
    width: 100px;
    background-color:#003366;
    border: 1px solid #003366;
    border-radius: 5px;
    padding: 8px;
    color: #E1E2CF;
    cursor: pointer;
}
.column div{
margin-top:-20px;
height:20px;
}


</style>
<!-- ---------------------------------- -->
</head>
<body>
<!-- ---------------------------------------------------- -->
<script>
	function viewGraph() {
		  $(".column").css("height", "0");
		  $("table tr").each(function (index) {
		    var ha = $(this).children("td").eq(1).text();
		    $("#col" + index)
		      .animate({ height: ha }, 1500)
		      .html("<div>" + ha + "</div>");
		  });
		}
		$(document).ready(function () {
		  viewGraph();
		});
</script>

<!-- -------------------------------------------------------- -->

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
	         	<a class="active" href="index.jsp"><button class="btn btn-secondary btn-sm float-right">Déconnexion</button></a>
<!-- 				<img class="rounded" src="img/titre.png"> -->
				</div>
			</div>
       
	     </nav>
    <br>
 <h1 style="color:green; text-align:center;">
        Résultats Des Votes
    </h1>
	
	<div class="container">
			<table class="table">
				<tr>
				<% Gestiondb bd = new Gestiondb();
				   int nbrVotes;
				   ArrayList<String> list = bd.getCandidats();
				   for(String candidat : list){
				%>
					   <th><%=candidat%></th>
				<%
				   }
				%>
				</tr>
				<tr>
				<%
				   for(String candidat : list){
					   nbrVotes = bd.getNbrVotes(candidat);
				%>
					   <td><%=nbrVotes%></td>
				<%
				   }
				%>
				</tr>
			</table>
	</div>
<!-- --------------------------------------------- -->


<!-- --------------------------- -->
   

    <div class="container">
                 <% Gestiondb bd2 = new Gestiondb();
				   int nbrVotes2;
				   ArrayList<String> list2 = bd.getCandidats();
				   for(String candidat : list){
					   nbrVotes = bd.getNbrVotes(candidat);
				%>
        <div class="progress">
            <div class="progress-bar bg-success"
                style="width:<%=nbrVotes%>;">
                <%=nbrVotes%>
            </div>
        </div><br>
                <%
				   }
				%>
<!--         <div class="progress"> -->
<!--             <div class="progress-bar bg-success" -->
<!--                 style="width:90%;"> -->
<!--                 90% -->
<!--             </div> -->
<!--         </div><br> -->
<!--         <div class="progress"> -->
<!--             <div class="progress-bar bg-warning" -->
<!--                 style="width:30%;"> -->
<!--                 30% -->
<!--             </div> -->
<!--         </div><br> -->
<!--         <div class="progress"> -->
<!--             <div class="progress-bar bg-danger" -->
<!--                 style="width:1%;"> -->
<!--                 1% -->
<!--             </div> -->
<!--         </div><br> -->
    </div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<hr>

</body>
</html>