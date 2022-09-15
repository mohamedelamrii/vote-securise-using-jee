<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Page d'erreur</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Ruda:400,700');
  #header, #outer-wrapper, #post-wrapper, #sidebar-wrapper, #content-wrapper, #footer-wrapper, #wrapper, .ignielToTop {display:none}
  body,html {overflow:hidden; margin:0; padding:0; width:100%; min-height:100vh}
  body {background:#fff; color:#1d2129}
  #igniel404 {background:#eceeee; text-align:center; margin:auto; font-weight:700; font-size:45px; font-family:'Ruda',sans-serif; position:fixed; width:100%; height:100%; line-height:1.25em; z-index:9999;}
  #igniel404 #error-text {position:relative; font-size:40px; color:#666; top:50%; right:50%; transform:translate(50%,-50%);}
  #igniel404 #error-text a {color:#888; text-decoration:none}
  #igniel404 #error-text p {margin:0!important; letter-spacing:.5px;}
  #igniel404 #error-text span {color:#008c5f;font-size:100px;}
  #igniel404 #error-text a.back {background:#008c5f;color:#fff;padding:10px 20px;font-size:20px;border:double #fff;-webkit-transform:scale(1);-moz-transform:scale(1);transform:scale(1);transition:all 0.5s ease-out;}
  #igniel404 #error-text a.back:hover {background:#444;color:#fff;border:double #eceeee;}
  #igniel404 #error-text a.back:active {-webkit-transform:scale(0.9);-moz-transform:scale(0.9);transform:scale(0.9);background:#333;color:#fff;border:double #eceeee;}
  #igniel404 #error-text #copyright {font-size:16px}
  #igniel404 #error-text #copyright a {color:#008c5f}

  @media only screen and (max-width:640px){
    #igniel404 #error-text {font-size:20px;}
    #igniel404 #error-text span {font-size:60px;}
    #igniel404 #error-text a.back {padding:5px 10px;font-size:15px;}
    #igniel404 #error-text a.back:hover, #igniel404 #error-text a.back:active {border:0;}
  }
</style>


<style>
h2{
width: 100%;
background-color: #962121;
color: white;
}
</style>
</head>
<body>
<% String msg = (String)session.getAttribute("erreur");
String pageAuth = (String)session.getAttribute("page");
System.out.println(msg);
System.out.println(request.getContextPath());
%>
<div id='igniel404'>
    <div id='error-text'>
      <span>404</span>
      <p><%=msg %></p>
      <a class='back' title='Igniel' href='<%=request.getContextPath()  + pageAuth%>'>Essayez une autre fois ...</a>
      <div id='copyright'>
        <a href='index.jsp' title='MGL Vote'>MGL Vote</a> &#169; 2022 - <script>document.write(new Date().getFullYear())</script>. Tous les droits sont r�serv�s
        </div>
    </div>
  </div>



</body>
</html>