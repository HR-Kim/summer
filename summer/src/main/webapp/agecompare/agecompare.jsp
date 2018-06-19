<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="java.util.List"%>
<%@page import="com.summer.comm.StringUtil"%>
<%@page import="com.summer.comm.SearchVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.summer.agecompare.dao.AgecompareDao"%>
<%@page import="com.summer.agecompare.domain.Agecompare"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Logger log = LoggerFactory.getLogger(this.getClass());
	log.debug("===========================");
	log.debug("this.getClass()="+this.getClass());
	log.debug("===========================");
	
	String searchWord = ""; //검색어
	String searchDiv = ""; //검색구분
	
	SearchVO searchVO = new SearchVO();
	if(null != request.getAttribute("searchVO")){
		searchVO = (SearchVO)request.getAttribute("searchVO");
	}
	log.debug("=searchVO="+searchVO.toString());
	
	searchWord = StringUtil.nvl(searchVO.getSearchWord(),"");
	searchDiv = StringUtil.nvl(searchVO.getSearchDiv(),"");
		
	String allLine = 
	(null == request.getAttribute("list")) ? "0":request.getAttribute("list").toString();	
	String allLinea = 
	(null == request.getAttribute("dataList")) ? "0":request.getAttribute("dataList").toString();	
	String listsize = 
	(null == request.getAttribute("listsize")) ? "0":request.getAttribute("listsize").toString();	
	/* 달력
	http://blog.munilive.com/jquery-datepicker-%EB%8B%AC%EB%A0%A5%EC%97%90%EC%84%9C-%EB%85%84%EB%8F%84%EC%99%80-%EC%9B%94%EB%A7%8C-%EC%84%A0%ED%83%9D-%EA%B0%80%EB%8A%A5%ED%95%98%EA%B2%8C-%ED%95%98%EA%B8%B0/
	*/
%>

<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>:::연령대별 차트:::</title>
	<!-- 부트스트랩 -->
	<link href="${CONTEXT}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	
	<input type="hidden"  name="searchDiv" id="searchDiv" />

	연령대 선택 <br>
	<input type="checkbox" id="chk_age1" name="chk_age" value="10대">10대
	<input type="checkbox" id="chk_age2" name="chk_age" value="20대">20대
	<input type="checkbox" id="chk_age3" name="chk_age" value="30대">30대
	<input type="checkbox" id="chk_age4" name="chk_age" value="40대">40대
	<input type="checkbox" id="chk_age5" name="chk_age" value="50대">50대
	<input type="checkbox" id="chk_age6" name="chk_age" value="60대">60대
	<input type="checkbox" id="chk_age7" name="chk_age" value="70대">70대
	<input type="checkbox" id="chk_age8" name="chk_age" value="80대">80대
	<input type="checkbox" id="chk_age9" name="chk_age" value="90대">90대
	<input type="button" id="btnUnchk" value="전체 체크 해제" /><br/>
	
	기간: <input type="text" id="startmonth" value="" />
	~ <input type="text" id="endmonth"  value="${pageSize}"/>
	<!-- id=testDatepicker -->
	<input type="button" id="btnSearch" onclick="doSearch();" value="조회" /><br><br>
	
	<input type="text" class="form-control input-sm" name="searchWord" 
		id="searchWord" value="30"/>
			
	
	
	<input type="text" id="allLine" value="<%=allLine%>"/>
	<input type="text" id="allLine" value="<%=allLinea%>"/>
		
	<!-- <button class="btn btn-success btn-sm" id="btn20">20대</button> 
	<button class="btn btn-success btn-sm" id="btn30">30대</button>  -->
		
	<div id="curve_chart" style="width: 900px; height: 500px"></div>
		
	<table>
	<tr>
			<td>total</td>
			<td>date</td>
			<td>tradeid</td>
			<td>age</td>
			<td>tradetotal</td>
		</tr>
	 <c:choose>
		 
         	<c:when test="${listsize>0}">
         		<c:forEach var="ageVO" items="${list}">
   <!-- id,adate,accountid,tradeid,amount,age,tradetotal,idtradetotal,idtotal -->
					<tr>
					<td>${ageVO.total}</td>
					<td>${ageVO.aDate}</td>
					<td>${ageVO.tradeId}</td>
					<td>${ageVO.age}</td>
					<td>${ageVO.tradeTotal}</td>
					</tr>
         		</c:forEach>
         	</c:when>
         	
         	<c:otherwise>
         		<tr><td>등록된 게시글이 없습니다.</td></tr>
         	</c:otherwise>
      </c:choose>
	</table>
	
	<link rel='stylesheet' type='text/css' href='/jquery-ui.css'/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script> 
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
	<script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
    	  
	//조회
	/*function doSearch(){
		var frm = document.frm;
		frm.action = "do_selectAgeList.do";
		frm.submit();
	}*/
		
	 $(document).ready(function(){
		 $.datepicker.regional['ko'] = {
			        closeText: '닫기',
			        prevText: '이전달',
			        nextText: '다음달',
			        currentText: '오늘',
			        monthNames: ['01','02','03','04','05','06','07','08','09','10','11','12'],
			        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
			        '7월','8월','9월','10월','11월','12월'],
			        dayNames: ['일','월','화','수','목','금','토'],
			        dayNamesShort: ['일','월','화','수','목','금','토'],
			        dayNamesMin: ['일','월','화','수','목','금','토'],
			        weekHeader: 'Wk',
			        dateFormat: 'yy-mm-dd',
			        firstDay: 0,
			        isRTL: false,
			        showMonthAfterYear: true,
			        yearSuffix: '',
			        showOn: 'both',
			        buttonText: "달력",
			        changeMonth: true,
			        changeYear: true,
			        showButtonPanel: true,
			        yearRange: 'c-99:c+99'
			    };
			    $.datepicker.setDefaults($.datepicker.regional['ko']);
			 
			    var datepicker_default = {
			        showOn: 'both',
			        buttonText: "달력",
			        currentText: "이번달",
			        changeMonth: true,
			        changeYear: true,
			        showButtonPanel: true,
			        yearRange: 'c-99:c+99',
			        showOtherMonths: true,
			        selectOtherMonths: true
			    }
			 
			    datepicker_default.closeText = "선택";
			    datepicker_default.dateFormat = "yy-mm";
			    datepicker_default.onClose = function (dateText, inst) {
			        var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
			        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
			        $(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
			        $(this).datepicker('setDate', new Date(year, month, 1));
			    }
			 
			    datepicker_default.beforeShow = function () {
			        var selectDate = $("#sdate").val().split("-");
			        var year = Number(selectDate[0]);
			        var month = Number(selectDate[1]) - 1;
			        $(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
			    }
			 
			    $("#sdate").datepicker(datepicker_default);

		 //시작 날짜
		    $("#startmonth").focus(function () {
		        $(".ui-datepicker-calendar").hide();
		        $("#ui-datepicker-div").position({
		            my: "center top",
		            at: "center bottom",
		            of: $(this)
		        });
		    });
		    $("#startmonth").datepicker({
		        dateFormat: 'MM yy',
		        changeMonth: true,
		        changeYear: true,
		        showButtonPanel: true,

		        onClose: function(dateText, inst) {
		            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		            $(this).val($.datepicker.formatDate('yy/MM', new Date(year, month, 1)));
		        }
		    });
		 //끝 날짜
		 $("#endmonth").focus(function () {
		        $(".ui-datepicker-calendar").hide();
		        $("#ui-datepicker-div").position({
		            my: "center top",
		            at: "center bottom",
		            of: $(this)
		        });
		    });
		 $( "#endmonth" ).datepicker({
			 dateFormat: 'MM yy',
		        changeMonth: true,
		        changeYear: true,
		        showButtonPanel: true,

		        onClose: function(dateText, inst) {
		            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		            $(this).val($.datepicker.formatDate('yy/MM', new Date(year, month, 1)));
		        }
		 });
		 
		 //전체 체크 해제
		 $("#btnUnchk").on("click",function(){
			 for(var i=1; i<=9; i++){
			 	$("#chk_age"+i).prop('checked', false);
			 } 
		});
		 
		 //체크해서 조회
		 $("#btnSearch").on("click",function(){			 
			 var count=0;
			 for(var i=1; i<=9; i++){
				 if($("#chk_age"+i).is(":checked")==true){
					 count++;
				 }
			 }
			 if(count==0){
				 alert("연령대를 체크해주세요.");
			 }else if($("#startmonth").val()==null || $("#endmonth").val()==null){
				 alert("기간을 입력해주세요.");
			 }else{
				 alert("count: "+count);

				 
				 for(var j=1; j<=9; j++){
					 $('#chk_age'+j+':checked').each(function() { 
					        alert($(this).val());
					 });
				 }
				 $.ajax({
						type:"GET",
						url:"do_selectAgeList1.do",
						dataType:"html",
						async:false,
						data:{
							"searchWord":$("#searchWord").val(),
							"searchDiv":$("#searchDiv").val(),
							"pageNum":$("#startmonth").val(),
							"pageSize":$("#endmonth").val()
						},
						error:function(){
							alert("do_selectAgeList1.do error error");
						},
						complete:function(data){
							//alert($("#startmonth").val());
						},
						success:function(data){
							alert("success: "+data);
							
							var parseData = $.parseJSON(data);
							
						}
					 });
			 }
		 });
	 });
	 
	
	 // 구글 차트
	 google.charts.load('current', {'packages':['line']});
     google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
	   var data = new google.visualization.arrayToDataTable([
	  	 <%=allLinea%>
	   ]);
	
	   var options = {
	     chart: {
	       title: '연령대별 차트',
	       subtitle: 'in millions of dollars (USD)'
	     },
	     width: 900,
	     height: 500
	   };
	
	   var chart = new google.charts.Line(document.getElementById('curve_chart'));
	
	   chart.draw(data, google.charts.Line.convertOptions(options));
	  }
    
    </script>
</body>
</html>