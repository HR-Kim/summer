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
	

	//if (session.getAttribute("id") == null) {
	//	response.sendRedirect("login.jsp");
	//}
	
%>

<%-- CONTEXT --%>
<c:set var ="CONTEXT" value="${pageContext.request.contextPath}" ></c:set>
	<div class="container">
		<!-- Title-------------------------------------------- -->
		 <h3>비밀번호기찾기</h3>
		 
		<!--// Title------------------------------------------ -->
		<!-- TEST -->

		
		<!--// TEST -->


		<!-- Input Form--------------------------------------- -->
		<div class="container">
			<div class="col-lg-12"></div>
			<div class="col-lg-12"></div>
			<div class="panel panel-default"></div>
			<form class="form-horizontal" name="frm" id="frm"
				method="post">				
				<div class="form-group">
					<label class="col-lg-4 control-label">비밀번호</label>
					<div class="col-lg-8">
						<input type="text" disabled="disabled" name="pwd" id="pwd"
							class="form-control input-sm" value="${User.pwd}" maxlength="20" />
									<c:if test="${null == User.pwd}">
		 							일치하는 정보가 없습니다.
									 </c:if>
					</div>
				</div>
			</form>
		</div>
		
		
		<!--// Input Form------------------------------------- -->
		
		<!-- Button-------------------------------------------- -->
		 <div class="form-inline pull-right">
		 	<button class="btn btn-success btn-sm" onclick="location.href='${CONTEXT}/user/login.do'">로그인</button>
		 	<button class="btn btn-success btn-sm" onclick="location.href='${CONTEXT}/user/signUp.do'">회원가입</button>
		 	<button class="btn btn-success btn-sm" onclick="location.href='${CONTEXT}/user/findId.do'">아이디 찾기</button>
		 </div>
		<!--// Button------------------------------------------ -->		
		
		</div>
	<script type="text/javascript">
	
		$(document).ready(function() {			
			
		});//--document.ready
	</script>