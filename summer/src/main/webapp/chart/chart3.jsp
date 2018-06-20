<!-- 일 별 화면 => 카테고리 별 파이 차트 + 카테고리 별 지출 리스트 -->
<%@page import="com.summer.chart.dao.ChartDao"%>
<%@page import="com.summer.chart.domain.Chart"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Logger log = LoggerFactory.getLogger(this.getClass());
	log.debug("===========================");
	log.debug("this.getClass()="+this.getClass());
	log.debug("===========================");
%>
<%-- CONTEXT --%>
<c:set var="CONTEXT" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html lang="ko">
 	<head>
		<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    	<title>:::(일)차트 테스트:::</title>

    	<!-- 부트스트랩 -->
    	<link href="${CONTEXT}/resources/css/bootstrap.min.css" rel="stylesheet">
 
    	<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    	<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    	<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    	<![endif]-->
    	<script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
    	
	</head>
	<body>
		<h3>**(월) 별 화면**</h3>

		<table class="table">
			<tr>
				<td class="text-left">
					<!-- Button -->
					<div class ="form-inline pull-left">
						<button class="btn btn-sm" id="doMonthPie">차트월간(파이)</button>
						<!-- <button class="btn btn-sm" id="doMonthBar">차트월간(컬럼)</button> -->
					</div>
					<!-- //Button -->
				</td>
			</tr>
		</table>
		
		<div id="monthPieChart" style="width: 900px; height: 500px;"></div>
		
		<!-- <div id="monthBarChart" style="width: 800px; height: 600px;"></div> -->
	
		<!-- barList -->
		<div class="table-responsive">
			<form name="frmEd" id="frmEd" method="get">
				<input type="hidden"  name="chartUserId"  id="chartUserId" />
			
			<table id="pieListTable" class="table table-striped table-bordered table-hover">
				<thead>
    				<tr class = " danger">
    					<th>분류</th>
    					<th>총액</th>
    					<th>퍼센트</th>
    				</tr>
    			</thead>
    			
				<tbody id = "monthPieChart">
				</table>
				
				<!-- <table id="barListTable" class="table table-striped table-bordered table-hover">
					<thead class="bg-primary">
						<tr class = " danger">
    						<th>월</th>
    						<th>총 액</th>
    					</tr>
					</thead>
					
					<tbody id = "monthBarChart">
				</table> -->
		</form>
	</div>
	<!-- //barList -->
	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);

	var monthPieData;
	//var monthBarData;
	
	/* function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['Category_Nm', 'Total per category'],	
			['식비', 10000]
		]);

		var options = {
			title: '나의 월 간 지출 패턴',
			is3D: true,
		};
 
		var chart = new google.visualization.PieChart(document.getElementById('monthPieChart'));
		chart.draw(data, options);
	}
	
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(drawStuff);
 */
	/* function drawStuff() {
		var data = new google.visualization.arrayToDataTable([
			['월 별 지출', 'Total per Month'],
          	['1월', 100000],
          	['2월', 20000],
          	['3월', 80000],
          	['4월', 5000]
		]);
		
		var options = {
			width: 800,
			legend: { position: 'none' },
        	chart: {
				title: '',
          		subtitle: '' },
        	axes: {
				x: {
            		0: { side: 'top'} // Top x-axis.
          		}
			},
			bar: { groupWidth: "90%" }
		};
	     
		var chart = new google.charts.Bar(document.getElementById('monthBarChart'));
		// Convert the Classic options to Material options.
		chart.draw(data, google.charts.Bar.convertOptions(options));
	};  */
		
	$(document).ready(function(){
		$("#doMonthPie").on("click",function(){
			$.ajax({	
				type:"GET",
	          	url:"doMonthPie.do",   
	          	dataType:"html",// JSON/html
	          	async: false,
	          	data:{ 
	          		"chartUserId":'a',
					"year":2018,
					"month":06
	           	},
	          	success: function(data){		//통신이 성공적으로 이루어 졌을 때 받을 함수	
	          		//json parsing
	           	monthPieData = $.parseJSON(data);
		          	var monthPieDataLen = monthPieData.length;
						
		          	console.log("monthPieData=" + monthPieData);
		          	console.log("monthPieDataLen=" + monthPieDataLen);
						
		          	if(monthPieDataLen == 0){
		          		alert("데이터가 없습니다");
	            	}else{
	            		$.each(monthPieData,function(key,value){
	            			$("#monthPieChart").append(
	            					"<tr>"
										+"<td>"+value.cdDtlNm+"</td>"
										+"<td>"+value.ctgTotal+"</td>"
										+"<td>"+value.percent+"%"+"</td>"
										+"</tr>"
	            			);//append
	            		});//each
	            	}//ifelse
	          	},
	          	complete: function(data){//무조건 수행
	          	},
	          	error: function(xhr,status,error){
	          		console.log("doWeek error: "+error);
	          	}
			}); //--ajax
		});
	});	
		
		/* $("#doMonthBar").on("click",function(){
			$.ajax({	
				type:"GET",
            	url:"doMonthBar.do",   
            	dataType:"html",// JSON/html
            	async: false,
            	data:{ 
            		"chartUserId":'a',
					"year":2018         
            	},
            	success: function(data){		//통신이 성공적으로 이루어 졌을 때 받을 함수	
            		//json parsing
            		monthBarData = $.parseJSON(data);
	            	var monthBarDataLen = monthBarData.length;
					
	            	console.log("monthBarData=" + monthBarData);
	            	console.log("monthBarDataLen=" + monthBarDataLen);
					
	            	if(monthBarDataLen == 0){
	            		alert("데이터가 없습니다");
	            	}else{
	            		$.each(monthBarData,function(key,value){
	            			$("#monthBarChart").append(
									 "<tr>"
									 +"<td>"+value.month+"</td>"
									 +"<td>"+value.monthTotal+"</td>"
									 +"</tr>"
	            			);//append
	            		});//each
	            	}//ifelse
				},
				complete: function(data){//무조건 수행
				},
				error: function(xhr,status,error){
					console.log("doMonthBar error: "+error);
				}
			}); //--ajax
		}); */
	</script>
</body>
</html>