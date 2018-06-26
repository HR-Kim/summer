<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <!-- Slick slider -->
    <link href="./resources/css/slick.css" rel="stylesheet">

    <!-- Main Style -->
    <link href="./resources/css/style.css" rel="stylesheet">

<div class="container">
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
        <img src="./resources/theme/images/main1.jpg" alt="Los Angeles" style="width:100%;">
        <div class="carousel-caption">
          <h3>Los Angeles</h3>
          <p>LA is always so much fun!</p>
        </div>
      </div>

      <div class="item">
        <img src="./resources/theme/images/main2.jpg" alt="Chicago" style="width:100%;">
        <div class="carousel-caption">
          <h3>Chicago</h3>
          <p>Thank you, Chicago!</p>
        </div>
      </div>
    
      <div class="item">
        <img src="./resources/theme/images/main3.jpg" alt="New York" style="width:100%;">
        <div class="carousel-caption">
          <h3>New York</h3>
          <p>We love the Big Apple!</p>
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
</div>

<!-- 	<div id="mu-slider" style="width:1500px; height:1000px;"> -->
<!-- 		<div class="mu-slide" > -->
<!-- 			<!-- Start single slide  --> -->
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
<!-- 			<!-- End single slide  --> -->

<!-- 			<!-- Start single slide  --> -->
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
<!-- 			<!-- End single slide  --> -->

<!-- 			<!-- Start single slide  --> -->
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
<!-- 			<!-- End single slide  --> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<!-- End Slider area -->		 -->
	
	<!-- JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
	<!-- Slick slider -->
    <script type="text/javascript" src="./resources/js/slick.min.js"></script>
    <!-- Progress Bar -->
    <script src="https://unpkg.com/circlebars@1.0.3/dist/circle.js"></script>
	
    <!-- Custom js -->
	<script type="text/javascript" src="./resources/js/custom.js"></script>

	<!-- About us Skills Circle progress  -->
	<script>
		// First circle
	    new Circlebar({
        element : "#circle-1",
        type : "progress",
	      maxValue:  "90"
	    });
		
		// Second circle
	    new Circlebar({
        element : "#circle-2",
        type : "progress",
	      maxValue:  "84"
	    });

	    // Third circle
	    new Circlebar({
        element : "#circle-3",
        type : "progress",
	      maxValue:  "60"
	    });

	    // Fourth circle
	    new Circlebar({
        element : "#circle-4",
        type : "progress",
	      maxValue:  "74"
	    });

	</script>