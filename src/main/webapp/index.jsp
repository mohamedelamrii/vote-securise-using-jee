<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="static/css/bootstrap.min.css" rel="stylesheet" />

<style>
.bg-gradient {
background: #C9D6FF;
background: -webkit-linear-gradient(to right, #E2E2E2, #C9D6FF); 
background: linear-gradient(to right, #E2E2E2, #C9D6FF);
} 
ul li {
  margin-bottom:1.4rem;
}
.pricing-divider {
border-radius: 20px;
background: #C64545;
padding: 1em 0 4em;
position: relative;
}
.blue .pricing-divider{
background: #2D5772; 
}
.green .pricing-divider {
background: #1AA85C; 
}
.red b {
  color:#C64545
}
.blue b {
  color:#2D5772
}
.green b {
  color:#1AA85C
}
.pricing-divider-img {
	position: absolute;
	bottom: -2px;
	left: 0;
	width: 100%;
	height: 80px;
}
.deco-layer {
	-webkit-transition: -webkit-transform 0.5s;
	transition: transform 0.5s;
}
.btn-custom  {
  background:#C64545; color:#fff; border-radius:20px
}

.img-float {
  width:50px; position:absolute;top:-3.5rem;right:1rem
}

.princing-item {
  transition: all 150ms ease-out;
}
.princing-item:hover {
  transform: scale(1.05);
}
.princing-item:hover .deco-layer--1 {
  -webkit-transform: translate3d(15px, 0, 0);
  transform: translate3d(15px, 0, 0);
}
.princing-item:hover .deco-layer--2 {
  -webkit-transform: translate3d(-15px, 0, 0);
  transform: translate3d(-15px, 0, 0);
}
</style>

<style>

.demo2{background:#f2f2f2;padding:30px 0}
.pricingTable2{padding-bottom:30px;margin:0 15px;background:#fff;text-align:center;border-radius:15px;overflow:hidden}
.pricingTable2:hover{box-shadow:0 0 10px rgba(195,67,67,.3) inset,0 0 20px -5px rgba(0,0,0,.8)}
.pricingTable2 .pricingTable-header{padding:20px 15px 45px;background:#66ce04;-webkit-clip-path:polygon(50% 100%,100% 60%,100% 0,0 0,0 60%);clip-path:polygon(50% 100%,100% 60%,100% 0,0 0,0 60%);position:relative}
.pricingTable2 .pricingTable-header:before{content:"";width:400px;height:400px;border-radius:50%;position:absolute;right:-50%;top:-130%;background:repeating-radial-gradient(rgba(255,255,255,.05),rgba(255,255,255,.2) 20%);transition:all .5s ease 0s}
.pricingTable2:hover .pricingTable-header:before{right:50%}
.pricingTable2 .title{font-size:40px;color:#fff;margin:0}
.pricingTable2 .price-value{display:block;font-size:25px;color:#000;margin:0 0 20px;transition:all .3s ease 0s}
.pricingTable2 .pricing-content{padding:30px 25px 0;margin:0;list-style:none}
.pricingTable2 .pricing-content li{font-size:18px;color:#909090;line-height:40px;letter-spacing:1px;text-transform:capitalize;border-bottom:2px solid rgba(0,0,0,.15);margin-bottom:10px;position:relative}
.pricingTable2 .pricing-content li:last-child{border-bottom:none}
.pricingTable2 .pricing-content li i{color:#66ce04}
.pricingTable2 .pricingTable-signup{display:block;padding:18px 0;margin:0 25px;border-radius:10px;background:#66ce04;font-size:20px;color:#fff;letter-spacing:1px;text-transform:uppercase;overflow:hidden;position:relative;transition:all .3s ease 0s}
.pricingTable2 .pricingTable-signup:hover{letter-spacing:2px;box-shadow:0 0 10px rgba(0,0,0,.7),0 0 0 7px rgba(255,255,255,.5) inset}
.pricingTable2 .pricingTable-signup:before{content:"";width:230px;height:230px;border-radius:50%;background:repeating-radial-gradient(rgba(255,255,255,.05),rgba(255,255,255,.2) 20%);position:absolute;top:-180%;right:-40%;transition:all .8s ease 0s}
.pricingTable2 .pricingTable-signup:hover:before{right:40%}
.pricingTable2.blue .pricingTable-header,.pricingTable2.blue .pricingTable-signup{background:#15b8f3}
.pricingTable2.blue .pricing-content li i{color:#15b8f3}
.pricingTable2.pink .pricingTable-header,.pricingTable2.pink .pricingTable-signup{background:#f03c79}
.pricingTable2.pink .pricing-content li i{color:#f03c79}
@media only screen and (max-width:990px){.pricingTable2{margin-bottom:30px}
}
@media only screen and (max-width:479px){.pricingTable2{margin:0}
.pricingTable2 .pricing-content li{font-size:15px}
}

</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- ------------------------------------------ -->
<title>Bienvenue sur MGL Vote</title>
</head>
<body>

		<nav class="navbar navbar-dark bg-dark">
	 		<div class="col-sm-4">
	 			<img class="logo" src="img/logo.png">
	 		</div>
	 		<div class="col-sm-4 text-center">
	 			<img class="logo" src="img/mgl.png">
	 		</div>
	 		<div class="col-sm-4">
	       		<a class="active" href="index.jsp"><button class="btn btn-secondary btn-sm float-right">Accueil</button></a>
	       	</div>
       	</nav>



	<div class="text-center">
		<img class="rounded" src="img/titre.png">
	</div>
	
	<div class="row">
        <div class="col-sm-12">
        	 		        
<!--              <br><h2 class="text-center text-black" style="margin-bottom: 10%">Bienvenue sur MGL Vote</h2> -->
        </div>
    </div>


<div class="container-fluid bg-gradient p-5">
      <div class="row m-auto text-center w-75">
        
        <div class="col-4 princing-item border-primary blue">
          <div class="pricing-divider ">
              <h3 class="text-light">Votant</h3>
<!--             <h4 class="my-0 display-4 text-light font-weight-normal mb-3"><span class="h3">$</span> 120 <span class="h5">/mo</span></h4> -->
             <svg class='pricing-divider-img' enable-background='new 0 0 300 100' height='100px' id='Layer_1' preserveAspectRatio='none' version='1.1' viewBox='0 0 300 100' width='300px' x='0px' xml:space='preserve' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns='http://www.w3.org/2000/svg' y='0px'>
          <path class='deco-layer deco-layer--1' d='M30.913,43.944c0,0,42.911-34.464,87.51-14.191c77.31,35.14,113.304-1.952,146.638-4.729
	c48.654-4.056,69.94,16.218,69.94,16.218v54.396H30.913V43.944z' fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--2' d='M-35.667,44.628c0,0,42.91-34.463,87.51-14.191c77.31,35.141,113.304-1.952,146.639-4.729
	c48.653-4.055,69.939,16.218,69.939,16.218v54.396H-35.667V44.628z' fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--3' d='M43.415,98.342c0,0,48.283-68.927,109.133-68.927c65.886,0,97.983,67.914,97.983,67.914v3.716
	H42.401L43.415,98.342z' fill='#FFFFFF' opacity='0.7'></path>
          <path class='deco-layer deco-layer--4' d='M-34.667,62.998c0,0,56-45.667,120.316-27.839C167.484,57.842,197,41.332,232.286,30.428
	c53.07-16.399,104.047,36.903,104.047,36.903l1.333,36.667l-372-2.954L-34.667,62.998z' fill='#FFFFFF'></path>
        </svg>
          </div>
          <div class="card-body bg-white mt-0 shadow">
            <ul class="list-unstyled mb-5 position-relative">
              <li><img src="img/vote.png"></li>
            </ul>
          </div>

          <div class="card-body bg-white mt-0 shadow">
            <a href="voter.jsp"><button class="btn btn btn-info btn-lg btn-block  btn-custom ">Votant</button></a>
          </div>
        </div>
       
        
        <div class="col-4 princing-item green">
          <div class="pricing-divider ">
              <h3 class="text-light">Centre de Comptage</h3>
<!--             <h4 class="my-0 display-4 text-light font-weight-normal mb-3"><span class="h3">$</span> 250 <span class="h5">/mo</span></h4> -->
             <svg class='pricing-divider-img' enable-background='new 0 0 300 100' height='100px' id='Layer_1' preserveAspectRatio='none' version='1.1' viewBox='0 0 300 100' width='300px' x='0px' xml:space='preserve' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns='http://www.w3.org/2000/svg' y='0px'>
          <path class='deco-layer deco-layer--1' d='M30.913,43.944c0,0,42.911-34.464,87.51-14.191c77.31,35.14,113.304-1.952,146.638-4.729
	c48.654-4.056,69.94,16.218,69.94,16.218v54.396H30.913V43.944z' fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--2' d='M-35.667,44.628c0,0,42.91-34.463,87.51-14.191c77.31,35.141,113.304-1.952,146.639-4.729
	c48.653-4.055,69.939,16.218,69.939,16.218v54.396H-35.667V44.628z' fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--3' d='M43.415,98.342c0,0,48.283-68.927,109.133-68.927c65.886,0,97.983,67.914,97.983,67.914v3.716
	H42.401L43.415,98.342z' fill='#FFFFFF' opacity='0.7'></path>
          <path class='deco-layer deco-layer--4' d='M-34.667,62.998c0,0,56-45.667,120.316-27.839C167.484,57.842,197,41.332,232.286,30.428
	c53.07-16.399,104.047,36.903,104.047,36.903l1.333,36.667l-372-2.954L-34.667,62.998z' fill='#FFFFFF'></path>
        </svg>
          </div>

          <div class="card-body bg-white mt-0 shadow">
            <ul class="list-unstyled mb-5 position-relative">
              <li><img src="img/account.png"></li>
            </ul>
          </div>

          <div class="card-body bg-white mt-0 shadow">
            <a href="formLoginCo.jsp"><button class="btn btn btn-success btn-lg btn-block  btn-custom ">Centre de Comptage</button></a>
          </div>
        </div>
               

         
        <div class="col-4 princing-item green">
          <div class="pricing-divider ">
              <h3 class="text-light">Centre de Dépoui.</h3>
<!--             <h4 class="my-0 display-4 text-light font-weight-normal mb-3"><span class="h3">$</span> 450 <span class="h5">/mo</span></h4> -->
             <svg class='pricing-divider-img' enable-background='new 0 0 300 100' height='100px' id='Layer_1' preserveAspectRatio='none' version='1.1' viewBox='0 0 300 100' width='300px' x='0px' xml:space='preserve' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns='http://www.w3.org/2000/svg' y='0px'>
          <path class='deco-layer deco-layer--1' d='M30.913,43.944c0,0,42.911-34.464,87.51-14.191c77.31,35.14,113.304-1.952,146.638-4.729
	c48.654-4.056,69.94,16.218,69.94,16.218v54.396H30.913V43.944z' fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--2' d='M-35.667,44.628c0,0,42.91-34.463,87.51-14.191c77.31,35.141,113.304-1.952,146.639-4.729
	c48.653-4.055,69.939,16.218,69.939,16.218v54.396H-35.667V44.628z' fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--3' d='M43.415,98.342c0,0,48.283-68.927,109.133-68.927c65.886,0,97.983,67.914,97.983,67.914v3.716
	H42.401L43.415,98.342z' fill='#FFFFFF' opacity='0.7'></path>
          <path class='deco-layer deco-layer--4' d='M-34.667,62.998c0,0,56-45.667,120.316-27.839C167.484,57.842,197,41.332,232.286,30.428
	c53.07-16.399,104.047,36.903,104.047,36.903l1.333,36.667l-372-2.954L-34.667,62.998z' fill='#FFFFFF'></path>
        </svg>
          </div>

          <div class="card-body bg-white mt-0 shadow">
            <ul class="list-unstyled mb-5 position-relative">
              <li><img src="img/counting.png"></li>
            </ul>
          </div>

          <div class="card-body bg-white mt-0 shadow">

            <a href="formLoginDe.jsp"><button class="btn btn btn-success btn-lg btn-block  btn-custom ">Centre de Dépouillement</button></a>
          </div>
        </div>
               
 
      </div>
    </div>

<br>
<br>
<hr>
<br>

</body>
</html>