<%@page import="com.summer.comm.StringUtil"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%
	Logger log = LoggerFactory.getLogger(this.getClass());
	log.debug("===================================");
	log.debug("this.getClass()="+this.getClass());
	log.debug("===================================");
%>

<%-- CONTEXT --%>
<c:set var ="CONTEXT" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>:::회원가입:::</title>

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
	<div class="container">
		<!-- Title-------------------------------------------- -->
		 <h3>회원가입</h3>
		<!--// Title------------------------------------------ -->
		
		<!-- Input Form--------------------------------------- -->
		<div class="container">
			<div class="col-lg-12"></div>
			<div class="col-lg-12"></div>
			<div class="panel panel-default"></div>
			<form class="form-horizontal" name="frm" id="frm" method="post">	
				<div class="form-group">
					<div class="col-lg-8">
							<input type="text" name="id" id="id" size="40" onkeyup="idCheckFunction();" 
								placeholder="아이디" maxlength="20" />
					</div>
				</div>
				<tr>
					<td style="text-align: Left" colspan="3"><h5 style ="color : red;" id="idCheckMessage"></h5>					
				</tr>
				<div class="form-group">
					<div class="col-lg-8">
						<input type="password" name="pwd1" id="pwd1" size="40" onkeyup="passwordCheckFunction();"
							placeholder="비밀번호" maxlength="20" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-8">
						<input type="password" name="pwd2" id="pwd2" size="40" onkeyup="passwordCheckFunction();"
							placeholder="비밀번호확인" maxlength="20" />
					</div>
				</div>
				<tr>
					<td style="text-align: Left" colspan="3"><h5 style ="color : red;" id="passwordCheckMessage"></h5>					
				</tr>
				<div class="form-group">
					<div class="col-lg-8">
						<input type="text" name="name" id="name" size="40" onkeyup="nameCheckFunction();"
							placeholder="이름" maxlength="20" />
					</div>
				</div>
				<tr>
					<td style="text-align: Left" colspan="3"><h5 style ="color : red;" id="nameCheckMessage"></h5>					
				</tr>				
				
				<div class="form-group">
					<div class="col-lg-8">
						<input type="text" name="nickname" id="nickname" size="40" onkeyup="nickCheckFunction();"
							placeholder="별명" maxlength="20" />
					</div>
				</div>
				<tr>
					<td style="text-align: Left" colspan="3"><h5 style ="color : red;" id="nickCheckMessage"></h5>					
				</tr>
				
				<div class="form-group">
					<div class="col-lg-8">
										<!-- <input type="text" name="datepicker" id="datepicker" placeholder="날짜선택"> -->
						<input type="text" name="datepicker" id="datepicker" size="40"
							placeholder="생년월일" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-lg-8">
						<input type="email" name="email" id="email" size="40" onkeyup="emailCheckFunction();"
							placeholder="이메일 ( ex) abc@abc.com )" maxlength="20" />
					</div>
				</div>
				<tr>
					<td style="text-align: Left" colspan="3"><h5 style ="color : red;" id="emailCheckMessage"></h5>					
				</tr>	
				<div class="form-group" style="text-align : Left;">
					<div class="col-lg-8">
						<input type="text" name="phone" id="phone" size="40" onkeyup = "phoneCheckFunction();"
							placeholder="연락처 ( - 없이 번호만 입력하세요. )" maxlength="20" />
					</div>
				</div>
				<tr>
					<td style="text-align: Left" colspan="3"><h5 style ="color : red;" id="phoneCheckMessage"></h5>					
				</tr>
					
				<div class="form-group" style="text-align : Left; margin: 0 auto;">
					<label class="btn btn-primaty active">
						<input type="radio" name="gender" value="남" autocomplete="off" checked>남자
					</label>
					<label class="btn btn-primaty active">
						<input type="radio" name="gender" value="여" autocomplete="off">여자
					</label>
				</div>
			</form>
		</div>
		<!--// Input Form------------------------------------- -->
		
		<!-- Button-------------------------------------------- -->
		 <div class="clearfix">
		 	<button type="submit" id="signupbtn" class="signupbtn" disabled="disabled">등록</button>
		 	<button type="button" class="cancelbtn" onclick="location.href='${CONTEXT}/user/login.jsp'">취소</button>
		 </div>
		 
		 
		<!--// Button------------------------------------------ -->
		
		
		</div>
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<script src="//code.jquery.com/jquery.min.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		<script>
	
			$('#datepicker').datepicker({
			    altField : '#getdate',
			    dateFormat : 'yymmdd',	
			    changeMonth: true, 
			    changeYear: true,
			    yearRange : '-100:+0',
			    dayNames: ['일요일','월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		        dayNamesMin: ['일','월', '화', '수', '목', '금', '토'], 
		        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],	
			});	
			
		</script>
		
		
		<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		
		var idCheckFlag = 0;
		var pwdCheckFlag = 0;
		var emailCheckFlag = 0;
		var nickCheckFlag = 0;
		var phoneCheckFlag = 0;
		
		function idCheckFunction(){
			var id = $('#id').val();
			console.log("id="+id)
			var idPattern = /^[a-z]{1}[a-z0-9]{7,15}$/;
			var OK = idPattern.exec(id);
			console.log("OK="+OK)
			if(OK == null){
				$("#idCheckMessage").css("color","red");						
				$('#idCheckMessage').html('영소문자로 시작해야 합니다.(8~16글자)');
				$('#signupbtn').prop("disabled", true);
				return;
			}
				$.ajax({
					url : "do_idCheck.do",
					dataType : "html",// JSON/Html
					async : false,
					data : {
						"id" : $('#id').val()
					},
					success : function(data){
						data = $.trim(data)
						console.log(data)
						if(data == '0') {
							$("#idCheckMessage").css("color","green");						
							$('#idCheckMessage').html('사용할 수 있습니다.');
							idCheckFlag = 1;
							if(idCheckFlag ==1 && pwdCheckFlag ==1 && emailCheckFlag ==1 && nickCheckFlag ==1 && phoneCheckFlag == 1){
								$('#signupbtn').prop("disabled", false);
								$('#signupbtn').prop("background-color", "green");
							}
						}else if(data == '1') {
							$("#idCheckMessage").css("color","red");
							$('#idCheckMessage').html('사용할 수 없는 아이디입니다.');
							$('#signupbtn').prop("disabled", true);
							idCheckFlag = 0;
						}
					}
				});
			}
		
		function passwordCheckFunction(){
			var pwd1 = $('#pwd1').val();
			var pwd2 = $('#pwd2').val();
			if(pwd1 != pwd2){
				$("#passwordCheckMessage").css("color","red");
				$('#passwordCheckMessage').html('비밀번호가 일치하지 않습니다.');
				$('#signupbtn').prop("disabled", true);
				pwdCheckFlag = 0;
			}else{
				$("#passwordCheckMessage").css("color","green");
				$('#passwordCheckMessage').html('비밀번호가 일치합니다');
				pwdCheckFlag = 1;
				if(idCheckFlag ==1 && pwdCheckFlag ==1 && emailCheckFlag ==1 && nickCheckFlag ==1 && phoneCheckFlag == 1){
					$('#signupbtn').prop("disabled", false);
					$('#signupbtn').prop("background-color", "green");
				}
			}			
		}
		
		function nameCheckFunction(){
			var name = $('#name').val();
			var namePattern = /^[가-힣]{1,5}$/;
			var OK = namePattern.exec(name);
			if(!OK){
				$('#nameCheckMessage').css("color","red");						
				$('#nameCheckMessage').html('한글로 입력해주세요.');
			}else{
				$('#nameCheckMessage').css("color","green");						
				$('#nameCheckMessage').html('사용할 수 있습니다.');
				return;
			}
		}
		
		function nickCheckFunction(){
			var nickname = $('#nickname').val();
			$.ajax({
				url : "do_nickCheck.do",
				dataType : "html",// JSON/Html
				async : false,
				data : {
					nickname : $('#nickname').val()
				},
				success : function(data){
					data = $.trim(data)
					console.log("data="+data)
					console.log("nickname="+nickname)
					if((nickname == "") || (data == '1')){
						$('#signupbtn').prop("disabled", true);
						$("#nickCheckMessage").css("color","red");
						$('#nickCheckMessage').html('사용할 수 없습니다.');
						nickCheckFlag = 0;
					}else if(data =='0'){
						$("#nickCheckMessage").css("color","green");
						$('#nickCheckMessage').html('사용할 수 있습니다.');
						nickCheckFlag = 1;
						if(idCheckFlag ==1 && pwdCheckFlag ==1 && emailCheckFlag ==1 && nickCheckFlag ==1 && phoneCheckFlag == 1){
							$('#signupbtn').prop("disabled", false);
							$('#signupbtn').prop("background-color", "green");
						}
					}
				}
			});
		}
		
		function emailCheckFunction(){
			var email = $('#email').val();
			var emailPattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			var OK = emailPattern.exec(email);
			if(!OK){
				emailCheckFlag = 0;
				$('#emailCheckMessage').css("color","red");						
				$('#emailCheckMessage').html('옳바르게 입력하세요.');
				console.log("emailCheckFlag="+emailCheckFlag)
				$('#signupbtn').prop("disabled", true);
			}else{
				$('#emailCheckMessage').css("color","green");						
				$('#emailCheckMessage').html('사용할 수 있습니다.');
				emailCheckFlag = 1;
				console.log("emailCheckFlag2="+emailCheckFlag)
				if(idCheckFlag ==1 && pwdCheckFlag ==1 && emailCheckFlag ==1 && nickCheckFlag ==1 && phoneCheckFlag == 1){
					$('#signupbtn').prop("disabled", false);
					$('#signupbtn').prop("background-color", "green");
				}
			}
		}
		
		function phoneCheckFunction(){
			var phone = $('#phone').val();
			var phonePattern = /^01(?:[0|1|6-9])([0-9]{7,8})$/;
			var OK = phonePattern.exec(phone);
			if(!OK){
				$("#phoneCheckMessage").css("color","red");						
				$('#phoneCheckMessage').html('옳바르게 입력하세요.');
				$('#signupbtn').prop("disabled", true);
				return;
			}
			$.ajax({
				url : "do_phoneCheck.do",
				dataType : "html",// JSON/Html
				async : false,
				data : {
					phone : $('#phone').val()
				},
				success : function(data){
					data = $.trim(data)
					if(data == '1'){
						$('#signupbtn').prop("disabled", true);
						$("#phoneCheckMessage").css("color","red");
						$('#phoneCheckMessage').html('중복되었습니다.');
						phoneCheckFlag = 0;
					}else if(data =='0'){
						$('#signupbtn').prop("disabled", false);
						$("#phoneCheckMessage").css("color","green");
						$('#phoneCheckMessage').html('사용할 수 있습니다.');
						phoneCheckFlag = 1;
						if(idCheckFlag ==1 && pwdCheckFlag ==1 && emailCheckFlag ==1 && nickCheckFlag ==1 && phoneCheckFlag == 1){
							$('#signupbtn').prop("disabled", false);
							$('#signupbtn').prop("background-color", "green");
						}
					}
				}
			});
		}		

		$(document).ready(function() {
			//등록
			$("#signupbtn").on("click", function() {
				console.log("do_add")
				if (false == confirm("등록 하시겠습니까?"))
					return;
				
				$.ajax({
					type : "POST",
					url : "do_add.do",
					dataType : "html",// JSON/Html
					async : false,
					data : {
						"id" : $("#id").val(),
						"pwd" : $("#pwd1").val(),
						"name" : $("#name").val(),
						"nickname" : $("#nickname").val(),
						"gender" : $(":input:radio[name=gender]:checked").val(),
						"birth" : $("#datepicker").val(),
						"email" : $("#email").val(),
						"phone" : $("#phone").val(),
						"grade" : 1
					},
					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						console.log("data=" + data);
						//json parsing
						var parseData = $.parseJSON(data);
						console.log("parseData=" + parseData);
						console.log("data=" + data);
						
						if (parseData.msgId == "1") {
							alert(parseData.message);
							
							var frm = document.frm;
							frm.action = '${CONTEXT}'+"/user/login.jsp";
							frm.submit();							
						} else {
							alert(parseData.message);
						}
					},
					complete : function(data) {//무조건 수행
					},
					error : function(xhr, status, error) {
						console.log("do_add error: " + error);
					}
				});//--그리드 click -> ajax
			});//--등록
		});//--document.ready
	</script>
</body>
</html>