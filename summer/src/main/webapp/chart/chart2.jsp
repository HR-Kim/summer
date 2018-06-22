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
			<div>
				<select name="sh_year" id="sh_year" onchange="makeWeekSelectOptions();">
				<option value='2013'>2013년</option>
				<option value='2014'>2014년</option>
				<option value='2015'>2015년</option>
				<option value='2016'>2016년</option>
				<option value='2017'>2017년</option>
				<option value='2018' selected='selected'>2018년</option>
			</select>

			<select name="sh_month" id="sh_month" onchange="makeWeekSelectOptions();">
				<option value='01'>01월</option>
				<option value='02'>02월</option>
				<option value='03'>03월</option>
				<option value='04'>04월</option>
				<option value='05'>05월</option>
				<option value='06' selected='selected'>06월</option>
				<option value='07'>07월</option>
				<option value='08'>08월</option>
				<option value='09'>09월</option>
				<option value='10'>10월</option>
				<option value='11'>11월</option>
				<option value='12'>12월</option>
			</select>

			<select name="sh_week" id="sh_week" onchange="javascript:changeWeekSelectOptions();"></select>
			
			<button class="btn btn-sm" id="doMonth" onclick="javascript:loadWeekData();">보기</button>
		</div>
		
			
		
		<div id="weekPieChart" style="width: 400px; height: 300px;"></div>
	
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
	
	function drawChart(arr) {
		var data = google.visualization.arrayToDataTable(arr);

		var options = {
			title: '나의 주 간 지출 패턴',
			is3D: true,
		};

		var chart = new google.visualization.PieChart(document.getElementById('weekPieChart'));
		chart.draw(data, options);
	}
	
	function makeWeekSelectOptions() {
		var year = document.getElementById("sh_year").value;
		var month = document.getElementById("sh_month").value;
		var today = new Date();

		var sdate = new Date(year, month-1, 01);
		var lastDay = (new Date(sdate.getFullYear(), sdate.getMonth()+1, 0)).getDate();
		var endDate = new Date(sdate.getFullYear(), sdate.getMonth(), lastDay);

		var week = sdate.getDay();
		sdate.setDate(sdate.getDate() - week);
		var edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());

		var obj = document.getElementById("sh_week");
		obj.options.length = 0;
		var seled = "";
		while(endDate.getTime() >= edate.getTime()) {
			var sYear = sdate.getFullYear();
			var sMonth = (sdate.getMonth()+1);
			var sDay = sdate.getDate();

			sMonth = (sMonth < 10) ? "0"+sMonth : sMonth;
			sDay = (sDay < 10) ? "0"+sDay : sDay;

			var stxt = sYear + sMonth + sDay;

			edate.setDate(sdate.getDate() + 6);

			var eYear = edate.getFullYear();
			var eMonth = (edate.getMonth()+1);
			var eDay = edate.getDate();

			eMonth = (eMonth < 10) ? "0"+eMonth : eMonth;
			eDay = (eDay < 10) ? "0"+eDay : eDay;

			var etxt = eYear + eMonth + eDay;

			if(today.getTime() >= sdate.getTime() && today.getTime() <= edate.getTime()) {
				seled = stxt+"|"+etxt;
			}

			obj.options[obj.options.length] = new Option(stxt+"~"+etxt, stxt+"|"+etxt);

			sdate = new Date(edate.getFullYear(), edate.getMonth(), edate.getDate() + 1);
			edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());
		}	
		if(seled) obj.value = seled;
		changeWeekSelectOptions();
	}
	
	function loadWeekData(){
		$.ajax({	
			type:"GET",
           	url:"doWeek.do",   
           	dataType:"html",// JSON/html
           	async: false,
           	data:{ 
           		"chartUserId":'a',
					"weekStart":$("#sh_week").val().substr(0,8),
					"weekEnd":$("#sh_week").val().substr(9,17)
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
            		$("#weekChart").empty();
            		
            		var arrList = [['Category_Nm', 'Total per category']];
            		
            		$.each(weekData,function(key,value){
            			
            			arrList.push([value.cdDtlNm, value.ctgTotal]);
            			
            			$("#weekChart").append(
								 "<tr>"
								 +"<td>"+value.cdDtlNm+"</td>"
								 +"<td>"+value.ctgTotal+"</td>"
								 +"<td>"+value.percent+"%"+"</td>"
								 +"</tr>"
            			);//append
            		});//each
            		
            		drawChart(arrList);
            	}//ifelse
			},
			complete: function(data){//무조건 수행
			},
			error: function(xhr,status,error){
				console.log("doWeek error: "+error);
			}
		}); //--ajax
	};
		
	window.onload = function(){ loadWeekData(); }
	</script>
</body>
</html>