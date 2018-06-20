<!-- 주 별 화면 => 카테고리 별 파이 차트 + 카테고리 별 지출 리스트 -->
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
    	<title>:::(주)차트 테스트:::</title>

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
		<h3>**주 별 화면**</h3>

		<table class="table">
			<tr>
				<td class="text-left">
					<!-- Button -->
					<div class ="form-inline pull-left">
						<button class="btn btn-sm" id="doWeek">차트주간</button>
					</div>
					<!-- //Button -->
				</td>
			</tr>
		</table>
		
		<div id="weekPieChart" style="width: 900px; height: 500px;"></div>
	
		<!-- List -->
		<div class="table-responsive">
			<form name="frmEdit" id="frmEdit" method="get">
				<input type="hidden"  name="chartUserId"  id="chartUserId" />
			
			<table id="weekListTable" class="table table-striped table-bordered table-hover">
				<thead>
    				<tr class = " danger">
    					<th>분류</th>
    					<th>총액</th>
    					<th>퍼센트</th>
    				</tr>
    			</thead>
    			
				<tbody id = "weekChart">
			</table>
			</form>
		</div>
		<!-- //List -->

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);

	var weekData;
	
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['Category_Nm', 'Total per category'],	
			['식비', 10000]
		]);

		var options = {
			title: '나의 주 간 지출 패턴',
			is3D: true,
		};

		var chart = new google.visualization.PieChart(document.getElementById('weekPieChart'));
		chart.draw(data, options);
	}
	
	$(document).ready(function(){
		$("#doWeek").on("click",function(){
			$.ajax({	
				type:"GET",
            	url:"doWeek.do",   
            	dataType:"html",// JSON/html
            	async: false,
            	data:{ 
            		"chartUserId":'a',
					"weekStart":20180605,
					"weekEnd":20180615
            	},
            	success: function(data){		//통신이 성공적으로 이루어 졌을 때 받을 함수	
            		//json parsing
            		weekData = $.parseJSON(data);
	            	var weekDataLen = weekData.length;
					
	            	console.log("weekData=" + weekData);
	            	console.log("weekDataLen=" + weekDataLen);
					
	            	if(weekDataLen == 0){
	            		alert("데이터가 없습니다");
	            	}else{
	            		$.each(weekData,function(key,value){
	            			$("#weekChart").append(
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
	</script>
</body>
</html>