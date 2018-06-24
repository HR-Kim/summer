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
	
	//로그인 세션 처리
	String id = null;
	if(null == session.getAttribute("id")){
		response.sendRedirect("http://localhost:8080/summer/user/login.jsp");	
	}else {
		id = session.getAttribute("id").toString();
		//response.sendRedirect("http://localhost:8080/summer/finfavs/doSelectList.do?searchWord=" + id);
	}
	
	String searchWord = ""; //검색어
	String searchDiv = ""; //검색구분
	
	SearchVO searchVO = new SearchVO();
	if(null != request.getAttribute("searchVO")){
		searchVO = (SearchVO)request.getAttribute("searchVO");
	}
	log.debug("=searchVO="+searchVO.toString());
	
	searchWord = StringUtil.nvl(searchVO.getSearchWord(),"");
	searchDiv = StringUtil.nvl(searchVO.getSearchDiv(),"");
		
	String allLinea = "";	
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
	
	<input type="hidden"  name="id" id="id" value="${id}"/>
	<input type="hidden"  name="searchDiv" id="searchDiv" />
	<div class="form-group col-lg6 col-sm6">
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
		<input type="button" id="btnUnchk" class="btn btn-sm btn-success" value="전체 체크 해제" /><br/>
		
		기간: <input type="text" id="startmonth" value="" />
		~ <input type="text" id="endmonth"  value=""/>
		
		<input type="button" id="btnSearch" class="btn btn-sm btn-success" value="조회" /><br><br>
	</div>
	<div id="curve_chart" style="width: 650px; height: 300px"></div>
		
	
	
	
	<link rel='stylesheet' type='text/css' href='/jquery-ui.css'/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script> 
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
	<script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
	 $(document).ready(function(){
		 //------------------- 기 간 ---------------------------//
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
		 //------------------- 기 간 ---------------------------//
		 
		//전체 체크 해제
		 $("#btnUnchk").on("click",function(){
			 for(var i=1; i<=9; i++){
			 	$("#chk_age"+i).prop('checked', false);
			 } 
		});
		 
		 var ajaxObject="";
		 var ajaxObjectLen="";
		 
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
			 }else if($("#startmonth").val()==null || $("#endmonth").val()==null
					 || $("#startmonth").val()>=$("#endmonth").val()){
				 alert("기간을 알맞게 입력해주세요.");
			 }
			 else{
				 var searchList = count;
				 
				 for(var j=1; j<=9; j++){
					 $('#chk_age'+j+':checked').each(function() { 
						 searchList += "," + $(this).val().substring(0,2);
					 });
				 }				 
				 
				 $.ajax({
						type:"GET",
						url:"do_selectMeList.do",
						dataType:"html",
						async:false,
						data:{
							"searchDiv":$("#id").val(),
							"pageNum":$("#startmonth").val(),
							"pageSize":$("#endmonth").val()
						},
						error:function(){
							alert("do_selectMeList.do error error");
							
							$.ajax({
								type:"GET",
								url:"do_selectAgeList.do",
								dataType:"html",
								async:false,
								data:{
									"searchWord":searchList,
									"pageNum":$("#startmonth").val(),
									"pageSize":$("#endmonth").val()
								},
								error:function(){
									alert("do_selectAgeList.do error error");
								},
								complete:function(data){
									//alert($("#startmonth").val());
								},
								success:function(data){
									//alert("data="+data);
									data = data.substring(1,data.length-1);
									
									count = (data.match(/aDate/g) || []).length - count;
																
									var tmpArray = new Array();
									var i = 0;
									tmpArray[i] = "Date";
									for(var j=1; j<=9; j++){
										 $('#chk_age'+j+':checked').each(function() { 
											i++;
											tmpArray[i] = $(this).val().substring(0,2) + "대";
										 });
									 }
									tmpArray[++i] = "나";
									var arrList = [tmpArray];

									//============================//
									//alert("data="+data);
									var oobj = new Array();
									var adatetmp = new Array();
									var agetmp = new Array();
									var agetmp1 = new Array();
									var agetmp2 = new Array();
									var agetmp3 = new Array();
									var tmp = new Array();
									var datatmp;
									var tmpsize=0;
									for(var i=0; i<count; i++){
										if(i==0){
											datatmp = data.substring(0,data.indexOf(",["));
											var dayDataSub = $.parseJSON(datatmp);
											$.each(dayDataSub,function(key,value){
												adatetmp[key]=value.aDate;	
												//agetmp[key]=value.total;
												agetmp[key]=(value.total/value.ageTotal).toFixed(2);
											});
											//alert("adate="+adatetmp.toString());
										}else if(i==1){
											datatmp = data.substring(datatmp.length+1);
											var dayDataSub = $.parseJSON(datatmp);
											$.each(dayDataSub,function(key,value){
												//agetmp1[key]=value.total;
												agetmp1[key]=(value.total/value.ageTotal).toFixed(2);
											});
										}
									}
									for(var i=0; i<adatetmp.length; i++){
										arrList.push([adatetmp[i],agetmp[i]*1,agetmp1[i]*1,0*1]);
									}
								    drawChart(arrList);
								}
							 });
						},
						complete:function(data){
							//alert(id);
						},
						success:function(medata){
							//alert("Medata="+medata);
							var idData = $.parseJSON(medata);
							var idtotal = new Array();
							$.each(idData,function(key,value){//(value.idTotal/value.ageTotal).toFixed(2);
								idtotal[key] = (value.idTotal/value.ageTotal).toFixed(2);
							});
							$.ajax({
								type:"GET",
								url:"do_selectAgeList.do",
								dataType:"html",
								async:false,
								data:{
									"searchWord":searchList,
									"pageNum":$("#startmonth").val(),
									"pageSize":$("#endmonth").val()
								},
								error:function(){
									alert("do_selectAgeList.do error error");
								},
								complete:function(data){
									//alert($("#startmonth").val());
								},
								success:function(data){
									//alert("data="+data);
									data = data.substring(1,data.length-1);
									
									count = (data.match(/aDate/g) || []).length - count;
																
									var tmpArray = new Array();
									var i = 0;
									tmpArray[i] = "Date";
									for(var j=1; j<=9; j++){
										 $('#chk_age'+j+':checked').each(function() { 
											i++;
											tmpArray[i] = $(this).val().substring(0,2) + "대";
										 });
									 }
									tmpArray[++i] = "나";
									var arrList = [tmpArray];

									//============================//
								//	alert("data="+data);
									var oobj = new Array();
									var adatetmp = new Array();
									var agetmp = new Array();
									var agetmp1 = new Array();
									var agetmp2 = new Array();
									var agetmp3 = new Array();
									var tmp = new Array();
									var datatmp;
									var tmpsize=0;
									for(var i=0; i<count; i++){
										if(i==0){
											datatmp = data.substring(0,data.indexOf(",["));
											var dayDataSub = $.parseJSON(datatmp);
											$.each(dayDataSub,function(key,value){
												adatetmp[key]=value.aDate;	
												//agetmp[key]=value.total;
												agetmp[key]=(value.total/value.ageTotal).toFixed(2);
											});
											//alert("adate="+adatetmp.toString());
										}else if(i==1){
											datatmp = data.substring(datatmp.length+1);
											var dayDataSub = $.parseJSON(datatmp);
											$.each(dayDataSub,function(key,value){
												//agetmp1[key]=value.total;
												agetmp1[key]=(value.total/value.ageTotal).toFixed(2);
											});
										}
									}
									for(var i=0; i<adatetmp.length; i++){
										arrList.push([adatetmp[i],agetmp[i]*1,agetmp1[i]*1,idtotal[i]*1]);
									}
								    drawChart(arrList);
								}
							 });
						}
				 }); 
			 }
		 });
	 });
	 google.charts.load('current', {'packages':['line']});
	    google.charts.setOnLoadCallback(drawChart);
	    
		 function drawChart(arr){
			//alert("나중에 시작해야할 것"+arr);
			var data = new google.visualization.arrayToDataTable(arr);
			
			var options = {
			     chart: {
			       title: '연령대별 차트'
			       //,subtitle: 'in millions of dollars (WON)'
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
