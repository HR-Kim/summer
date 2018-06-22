<!-- 월 별 화면 => 카테고리 별 파이 차트 + 카테고리 별 지출 리스트 -->
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
		<form name="frmEd" id="frmEd" method="get">
			<input type="hidden"  name="chartUserId"  id="chartUserId" />
		</form>
	
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
		
			<button class="btn btn-sm" id="doMonth" onclick="javascript:loadMonthData();">보기</button>
		</div>

		
		<div id="monthPieChart" style="width: 400px; height: 300px;"></div>
		
		<div id="monthBarChart" style="width: 400px; height: 300px;"></div>
	
	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);

	var monthPieData;
	
	function drawChart(arr) {
		var data = google.visualization.arrayToDataTable(arr);
		
		var options = {
			title: '나의 월 간 지출 패턴',
			is3D: true,
		};
 
		var chart = new google.visualization.PieChart(document.getElementById('monthPieChart'));
		chart.draw(data, options);
	}
	
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(drawStuff);
 
	var monthBarData;
	
	function drawStuff(arrList) {
		var data = new google.visualization.arrayToDataTable(arrList);
		
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
		chart.draw(data, google.charts.Bar.convertOptions(options));
	};

	
	function loadMonthData(){
		$.ajax({	
			type:"GET",
          	url:"${CONTEXT}/chart/doMonthPie.do",   
          	dataType:"html",// JSON/html
          	async: false,
          	data:{ 
           		"chartUserId":'a',
				"year":$("#year").val(),
				"month":$("#month").val()
           	},
          	success: function(data){		//통신이 성공적으로 이루어 졌을 때 받을 함수	
           		monthPieData = $.parseJSON(data);
	          	var monthPieDataLen = monthPieData.length;
	          	
	          	if(monthPieDataLen == 0){
	          		alert("데이터가 없습니다");
            	}else{
            		$("#monthPieList").empty();
            		
            		var arr = [['Category_Nm', 'Total per category']];
            		
            		$.each(monthPieData, function(key,value){
            			
            			arr.push([value.cdDtlNm, value.ctgTotal]);
            			
            		});//each
            		
            		drawChart(arr);
            	}//ifelse
            	
            	$.ajax({	
        			type:"GET",
            		url:"${CONTEXT}/chart/doMonthBar.do",   
            		dataType:"html",// JSON/html
            		async: false,
            		data:{ 
            			"chartUserId":'a',
        				"year":$("#year").val()
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
                			$("#monthBarList").empty();
                			
                			var arrList = [['월 별 지출', 'Total per Month']];
                			
                			$.each(monthBarData,function(key,value){
                				arrList.push([value.month, value.monthTotal]);
                			});//each
                			
                			drawStuff(arrList);
                		}//ifelse
        			},
        			complete: function(data){//무조건 수행
        			},
        			error: function(xhr,status,error){
        				console.log("doMonthBar error: "+error);
        			}
        		}); //--ajax
          	},
          	complete: function(data){//무조건 수행
          	},
          	error: function(xhr,status,error){
          		console.log("doMonthPie error: "+error);
          	}
		}); //--ajax
	};
	
	window.onload = function(){ loadMonthData(); }
	
	</script>
</body>
</html>