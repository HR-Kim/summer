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
	<h3>**일 별 화면**</h3>
	
	<div>
			<select id="year" name="year">
				<c:forEach begin="0" end="10" var="result" step="1">
					<option value="${2018 - result}"
					<c:if test="${(2018 - result) == searchVO.searchDiv}"> selected="selected"</c:if>><c:out value="${2018 - result}" />
					</option>
				</c:forEach>                          
			</select>
			
			 
			<select id="month" name="month">
				<c:forEach begin="1" end="12" var="result" step="1">
					<option value=<fmt:formatNumber value="${result}" pattern="00"/>
					<c:if test="${result == 6}"> selected="selected"</c:if>>
					<fmt:formatNumber value="${result}" pattern="00"/>
					</option>
				</c:forEach>  
			</select>
			
			<select id="day" name="day">
				<c:forEach begin="1" end="31" var="result" step="1">
					<option value=<fmt:formatNumber value="${result}" pattern="00"/>
					<c:if test="${result == 15}"> selected="selected"</c:if>>
					<fmt:formatNumber value="${result}" pattern="00"/>
					</option>
				</c:forEach>  
			</select>
		
			<button class="btn btn-sm" id="doDay" onclick="javascript:loadDayData();">보기</button>
		</div>
	
	<div id="dayPieChart" style="width: 400px; height: 300px;"></div>

	<!-- dayList -->
	<div class="table-responsive">
		<form name="frm" id="frm" method="get">
			<input type="hidden"  name="chartUserId"  id="chartUserId" />
		
			<table id="dayListTable" class="table table-striped table-bordered table-hover">
				<thead>
    				<tr class = " danger">
    					<th>분류</th>
    					<th>총액</th>
    					<th>퍼센트</th>
    				</tr>
    			</thead>
    			
				<tbody id = "dayChart">
			</table>
		</form>
	</div>
	<!-- //dayList -->
	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);

	var dayData;
	
	function drawChart(arr) {
		var data = google.visualization.arrayToDataTable(arr);

		var options = {
			title: '나의 일 별 지출 패턴',
			is3D: true,
		};

		var chart = new google.visualization.PieChart(document.getElementById('dayPieChart'));
		chart.draw(data, options);
	}
	
	function loadDayData(){
		$.ajax({	
			type:"GET",
           	url:"doDay.do",   
           	dataType:"html",// JSON/html
           	async: false,
           	data:{ 
           		"chartUserId":'a',
					"year":$("#year").val(),
					"month":$("#month").val(),
					"day":$("#day").val()    
           	},
           	success: function(data){		//통신이 성공적으로 이루어 졌을 때 받을 함수	
           		//json parsing
           		dayData = $.parseJSON(data);
            	var dayDataLen = dayData.length;
				
            	console.log("dayData=" + dayData);
            	console.log("dayDataLen=" + dayDataLen);
				
            	if(dayDataLen == 0){
            		alert("데이터가 없습니다");
            	}else{
            		// 차트 초기화
            		$("#dayChart").empty();
            		
            		// 차트에 넘겨줄 배열 초기화
            		var arrList = [['Category_Nm', 'Total per category']];
            		
            		// 데이터 개수만큼 반복
            		$.each(dayData,function(key,value){
            			// 배열 추가
            			arrList.push([value.cdDtlNm, value.ctgTotal]);
            			
            			// 테이블 데이터 추가
            			$("#dayChart").append(
								 "<tr>"
								 +"<td>"+value.cdDtlNm+"</td>"
								 +"<td>"+value.ctgTotal+"</td>"
								 +"<td>"+value.percent+"%"+"</td>"
								 +"</tr>"
            			);//append
            		});//each
            		
            		// 파이차트 데이터 셋팅
            		drawChart(arrList);
            	}//ifelse
			},
			complete: function(data){//무조건 수행
			},
			error: function(xhr,status,error){
				console.log("doDay error: "+error);
			}
		}); //--ajax
	};
	
	window.onload = function(){ loadDayData(); }

	</script>
</body>
</html>