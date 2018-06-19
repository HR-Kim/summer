<!-- 월 별 화면 => 카테고리 별 파이 차트 + 월 별 컬럼 차트 -->
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
    	<title>:::(월)차트 테스트:::</title>

    	<!-- 부트스트랩 -->
    	<link href="${CONTEXT}/resources/css/bootstrap.min.css" rel="stylesheet">
 
    	<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    	<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    	<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    	<![endif]-->
	</head>

	<body>
		<h3>**월 별 화면**</h3>

		<table class="table">
			<tr>
				<td class="text-left">
					<!-- Button -->
					<div class ="form-inline pull-left">
						<button class="btn btn-sm" onclick="javascript:doMonth();">차트월간</button>
					</div>
					<!-- //Button -->
				</td>
			</tr>
		</table>
		
		<div id="monthPieChart" style="width: 900px; height: 500px;"></div>
		<div id="monthBarChart" style="width: 800px; height: 600px;"></div>
	
		<!-- barList -->
		<div class="table-responsive">
			<form name="frmEd" id="frmEd" method="get">
				<input type="hidden"  name="chartUserId"  id="chartUserId" />
			
				<table style="display:none" id="pieListTable" class="table table-striped table-bordered table-hover">
				<thead class="bg-primary">
					<th class="text-center">분류</th>
					<th class="text-center">총액</th>
					<th class="text-center">퍼센트</th>
				</thead>
			
				<tbody>
					<c:choose>
						<c:when test="${pieList.size()>0}">
							<c:forEach var="Chart" items="${pieList}">
								<tr>
									<td class="text-left">${Chart.cdDtlNm}</td>
									<td class="text-center">${Chart.ctgTotal}</td>
									<td class="text-right">${Chart.percent}%</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
				</table>
				
				<table style="display:none" id="barListTable" class="table table-striped table-bordered table-hover">
					<thead class="bg-primary">
						<th class="text-center">월</th>
						<th class="text-center">총액</th>
					</thead>
					
					<tbody>
						<c:choose>
							<c:when test="${barList.size()>0}">
							
							<c:forEach var="Chart" items="${barList}">
								<tr>
									<td class="text-center">${Chart.month}</td>
									<td class="text-right">${Chart.monthTotal}</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</form>
	</div>
	<!-- //barList -->
	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['Category_Nm', 'Total per category'],
          	['${pieList.get(0).cdDtlNm}', ${pieList.get(0).ctgTotal}],
          	['${pieList.get(1).cdDtlNm}', ${pieList.get(1).ctgTotal}],
          	['${pieList.get(2).cdDtlNm}', ${pieList.get(2).ctgTotal}],
          	['${pieList.get(3).cdDtlNm}', ${pieList.get(3).ctgTotal}],
          	['${pieList.get(4).cdDtlNm}', ${pieList.get(4).ctgTotal}],
			['${pieList.get(5).cdDtlNm}', ${pieList.get(5).ctgTotal}],
			['${pieList.get(6).cdDtlNm}', ${pieList.get(6).ctgTotal}],
			['${pieList.get(7).cdDtlNm}', ${pieList.get(7).ctgTotal}],
			['${pieList.get(8).cdDtlNm}', ${pieList.get(8).ctgTotal}],
			['${pieList.get(9).cdDtlNm}', ${pieList.get(9).ctgTotal}],
			['${pieList.get(10).cdDtlNm}', ${pieList.get(10).ctgTotal}],
			['${pieList.get(11).cdDtlNm}', ${pieList.get(11).ctgTotal}],
			['${pieList.get(12).cdDtlNm}', ${pieList.get(12).ctgTotal}],
			['${pieList.get(13).cdDtlNm}', ${pieList.get(13).ctgTotal}],
			['${pieList.get(14).cdDtlNm}', ${pieList.get(14).ctgTotal}]
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

	function drawStuff() {
		var data = new google.visualization.arrayToDataTable([
			['월 별 지출', 'Total per Month'],
          	['${barList.get(0).month}', ${barList.get(0).monthTotal}],
          	['${barList.get(1).month}', ${barList.get(1).monthTotal}],
          	['${barList.get(2).month}', ${barList.get(2).monthTotal}],
          	['${barList.get(3).month}', ${barList.get(3).monthTotal}],
          	['${barList.get(4).month}', ${barList.get(4).monthTotal}],
			['${barList.get(5).month}', ${barList.get(5).monthTotal}],
			['${barList.get(6).month}', ${barList.get(6).monthTotal}],
			['${barList.get(7).month}', ${barList.get(7).monthTotal}],
			['${barList.get(8).month}', ${barList.get(8).monthTotal}],
			['${barList.get(9).month}', ${barList.get(9).monthTotal}],
			['${barList.get(10).month}', ${barList.get(10).monthTotal}],
			['${barList.get(11).month}', ${barList.get(11).monthTotal}]
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
	}; 
		
	function doMonth(){
		var frmEd = document.frmEd;
		frmEd.action = "doMonth.do";
		frmEd.submit();
	}	
	</script>
</body>
</html>