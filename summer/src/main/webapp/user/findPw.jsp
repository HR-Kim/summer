<%@page import="com.summer.comm.StringUtil"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Logger log = LoggerFactory.getLogger(this.getClass());
	log.debug("===================================");
	log.debug("this.getClass()="+this.getClass());
	log.debug("===================================");
%>

<%-- CONTEXT --%>
<c:set var ="CONTEXT" value="${pageContext.request.contextPath}" ></c:set>
<br>
<br>
<br>
	<div class="container">
		<!-- Title-------------------------------------------- -->
		 <h3>비밀번호 찾기</h3>
		 
		<!--// Title------------------------------------------ -->
		


		<!-- Input Form--------------------------------------- -->
		<div class="container">
			<div class="col-lg-12"></div>
			<div class="col-lg-12"></div>
			<div class="panel panel-default"></div>
			<form class="form-horizontal" name="frmEdit" id="frmEdit"
				method="post">				
				<div class="form-group">
					<div class="col-lg-8">
						<input type="text"  name="id" id="id"
							class="form-control input-sm" placeholder="아이디" maxlength="20" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-lg-8">
						<input type="text" name="phone" id="phone"
							class="form-control input-sm" placeholder="연락처" maxlength="20" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-8">
						<input type="text" name="email" id="email"
							class="form-control input-sm" placeholder="이메일" maxlength="20" />
					</div>
				</div>
				
			</form>
		</div>
		<!--// Input Form------------------------------------- -->
		
		<!-- Button-------------------------------------------- -->
		 <div class="form-inline pull-right">
		 	<button class="btn btn-default btn-sm" id="do_findPw">확인</button>
		 	<button class="btn btn-default btn-sm" onclick="location.href='${CONTEXT}/user/login.do'">취소</button>
		 </div>
		<!--// Button------------------------------------------ -->		
		
		</div>
	<script type="text/javascript">
	
		//Null check
		function isEmpty(value) {
			if (!value) {
				alert("값을 입력하세요.");
				return true;
			}
		}

		$(document).ready(function() {			
			//비밀번호 찾기
			$("#do_findPw").on("click", function() {
				console.log("do_findPw")
				var id = $("#id").val();
				var phone = $("#phone").val();
				var email = $("#email").val();

				location.href="/summer/user/do_findPw.do?id="+id+"&phone="+phone+"&email="+email;						
			});//--그리드 click -> ajax
		});//--document.ready
	</script>