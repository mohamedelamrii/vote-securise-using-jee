<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Centre de Dépouillement</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<style>
html {
  height: 100%;
}
body {
  margin:0;
  padding:0;
  font-family: sans-serif;
  background: linear-gradient(#141e30, #243b55);
}

.login-box {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 400px;
  padding: 40px;
  transform: translate(-50%, -50%);
  background: rgba(0,0,0,.5);
  box-sizing: border-box;
  box-shadow: 0 15px 25px rgba(0,0,0,.6);
  border-radius: 10px;
}

.login-box h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
}

.login-box .user-box {
  position: relative;
}

.login-box .user-box input {
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  margin-bottom: 30px;
  border: none;
  border-bottom: 1px solid #fff;
  outline: none;
  background: transparent;
}
.login-box .user-box label {
  position: absolute;
  top:0;
  left: 0;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  pointer-events: none;
  transition: .5s;
}

.login-box .user-box input:focus ~ label,
.login-box .user-box input:valid ~ label {
  top: -20px;
  left: 0;
  color: #03e9f4;
  font-size: 12px;
}

.login-box form a {
  position: relative;
  display: inline-block;
  padding: 10px 20px;
  color: #03e9f4;
  font-size: 16px;
  text-decoration: none;
  text-transform: uppercase;
  overflow: hidden;
  transition: .5s;
  margin-top: 40px;
  letter-spacing: 4px
}

.login-box a:hover {
  background: #03e9f4;
  color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 5px #03e9f4,
              0 0 25px #03e9f4,
              0 0 50px #03e9f4,
              0 0 100px #03e9f4;
}

.login-box a span {
  position: absolute;
  display: block;
}

.login-box a span:nth-child(1) {
  top: 0;
  left: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(90deg, transparent, #03e9f4);
  animation: btn-anim1 1s linear infinite;
}

@keyframes btn-anim1 {
  0% {
    left: -100%;
  }
  50%,100% {
    left: 100%;
  }
}

.login-box a span:nth-child(2) {
  top: -100%;
  right: 0;
  width: 2px;
  height: 100%;
  background: linear-gradient(180deg, transparent, #03e9f4);
  animation: btn-anim2 1s linear infinite;
  animation-delay: .25s
}

@keyframes btn-anim2 {
  0% {
    top: -100%;
  }
  50%,100% {
    top: 100%;
  }
}

.login-box a span:nth-child(3) {
  bottom: 0;
  right: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(270deg, transparent, #03e9f4);
  animation: btn-anim3 1s linear infinite;
  animation-delay: .5s
}

@keyframes btn-anim3 {
  0% {
    right: -100%;
  }
  50%,100% {
    right: 100%;
  }
}

.login-box a span:nth-child(4) {
  bottom: -100%;
  left: 0;
  width: 2px;
  height: 100%;
  background: linear-gradient(360deg, transparent, #03e9f4);
  animation: btn-anim4 1s linear infinite;
  animation-delay: .75s
}

@keyframes btn-anim4 {
  0% {
    bottom: -100%;
  }
  50%,100% {
    bottom: 100%;
  }
}

</style>
<!-- Custom styles for this template -->
</head>
<body>
	
     	<nav class="navbar navbar-dark bg-dark">
	       <div class="col-sm-4">
	         <img class="logo" src="img/logo3.png">
	        </div>
	 		<div class="col-sm-4 text-center">
	 			<img class="logo" src="img/De.png">
	 		</div>
<!-- 	        <div class="col-sm-4"> -->
<!-- 				<br><h2 class="text-center text-white" style="margin-bottom: 10%">Centre de Dépouillement</h2> -->
<!-- 	        </div> -->
	        <div class="col-sm-4">
	        	<div class="text-center">
	         	<a class="active" href="index.jsp"><button class="btn btn-secondary btn-sm float-right">Déconnexion</button></a>
<!-- 				<img class="rounded" src="img/titre.png"> -->
				</div>
			</div>
	     </nav>

<!-- 		<nav class="navbar navbar-dark bg-dark"> -->
<!-- 	 		<div class="col-sm-12"> -->
<!-- 	 			<img class="logo" src="img/logo2.png"> -->
<!-- 	       		<a class="active" href="index.jsp"><button class="btn btn-secondary btn-sm float-right">Retour</button></a> -->
<!-- 	       	</div> -->
<!--        	</nav> -->

	<div class="row">
        <div class="col-sm-12">
<!--              <br><h2 class="text-center text-white" style="margin-bottom: 10%">Centre de Dépouillement</h2> -->
        </div>
    

	<div class="login-box">
	  <h2>Connexion</h2>
	  <form class="form-signin" method="post" action="loginServletDe">
	    <div class="user-box">
	      <input type="text" id="inputEmail"class="form-control" name="email" placeholder="" required autofocus>
	      <label>Email</label>
	    </div>
	    <div class="user-box">
	      <input type="password" id="inputEmail" class="form-control" name="password" placeholder="" required autofocus>
	      <label>Mot de Passe</label>
	    </div>
	    <a href="#">
	      <span></span>
	      <span></span>
	      <span></span>
	      <span></span>
	      <button class="btn btn-outline-light" type="submit" name="env">Connexion</button>
	    </a>
	  </form>
	</div>
	</div>
<br>
<br>
<hr>
<br>	
</body>
</html>
