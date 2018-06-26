<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!--     <meta charset="utf-8"> -->
<!--     Slick slider -->
<!--     <link href="./resources/css/slick.css" rel="stylesheet"> -->

<!--     Main Style -->
<!--     <link href="./resources/css/style.css" rel="stylesheet"> -->
<!-- <div class="col-sn-9 col-sm-offset-2 col-md-10 col-md offset-1 main"> -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="./resources/theme/images/main1.jpg" alt="Los Angeles" style="width:100%; height: 800px;">
        <div class="carousel-caption">
          <h3>MONEY MADE</h3>
          <p>최저가 검색이 가능한 웹 가계부</p>
        </div>
      </div>

      <div class="item">
        <img src="./resources/theme/images/main2.jpg" alt="Chicago" style="width:100%; height: 800px;">
        <div class="carousel-caption">
          <h3>MONEY MADE</h3>
          <p>금융 상품을 추천해주는 가계부</p>
        </div>
      </div>
    
      <div class="item">
        <img src="./resources/theme/images/main3.jpg" alt="New York" style="width:100%; height: 800px;">
        <div class="carousel-caption">
          <h3>MONEY MADE</h3>
          <p>다른 사람들의 소비성향을 파악할 수 있는 가계부</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
<!--   </div> -->
<!-- 	<div id="mu-slider" style="width:1500px; height:1000px;"> -->
<!-- 		<div class="mu-slide" > -->
<!-- 			<!-- Start single slide  -->
<!-- 			<div class="mu-single-slide"> -->
<!-- 				<img src="./resources/theme/images/main1.jpg" alt="slider img" style="width:1500px; height:800px;"> -->
<!-- 				<div class="mu-single-slide-content-area"> -->
<!-- 					<div class = "col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">  -->
<!-- 						<div class="row"> -->
<!-- 							<div class="col-md-12"> -->
<!-- 								<div class="mu-single-slide-content"> -->
<!-- 									<h1>MONEY MADE</h1> -->
<!-- 									<p>최저가 검색이 가능한 웹 가계부</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<!-- End single slide  --> 

<!-- 			<!-- Start single slide  --> 
<!-- 			<div class="mu-single-slide"> -->
<!-- 				<img src="./resources/theme/images/main2.jpg" alt="slider img" style="width:1500px; height:800px;"> -->
<!-- 				<div class="mu-single-slide-content-area"> -->
<!-- 					<div class = "col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">  -->
<!-- 						<div class="row"> -->
<!-- 							<div class="col-md-12"> -->
<!-- 								<div class="mu-single-slide-content"> -->
<!-- 									<h1>MONEY MADE</h1> -->
<!-- 									<p>금융 상품을 추천해주는 가계부</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<!-- End single slide  --> 

<!-- 			<!-- Start single slide  --> 
<!-- 			<div class="mu-single-slide"> -->
<!-- 				<img src="./resources/theme/images/main3.jpg" alt="slider img" style="width:1500px; height:800px;"> -->
<!-- 				<div class="mu-single-slide-content-area"> -->
<!-- 					<div class = "col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">  -->
<!-- 						<div class="row"> -->
<!-- 							<div class="col-md-12"> -->
<!-- 								<div class="mu-single-slide-content"> -->
<!-- 									<h1>MONEY MADE</h1> -->
<!-- 									<p>다른 사람들의 소비성향을 파악할 수 있는 가계부</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<!-- End single slide  -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<!-- End Slider area -->		