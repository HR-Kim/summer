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
		 <h3>로그인</h3>
		<!--// Title------------------------------------------ -->
		<!-- Button-------------------------------------------- -->
		<div class="form-inline pull-right">
			<button class="btn btn-default btn-sm" onclick="location.href='${CONTEXT}/user/findId.do'">ID찾기</button>
			<button class="btn btn-default btn-sm" onclick="location.href='${CONTEXT}/user/findPw.do'">PW찾기</button>
		</div>
		<!--// Button------------------------------------------ -->
		<!-- Input Form--------------------------------------- -->
	<form name="frm" method="post">
        <table class="table table-bordered table-hover" border="1" style="width: 400px;">
            <tr>
                <td style="width: 50px;">아이디</td>
                <td style="width: 30px;"><input name="id" id="id"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="pwd" id="pwd"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="button"  class="btn btn-default btn-sm" id="do_login">로그인</button>
                <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                </c:if>
                <c:if test="${msg == 'logout'}">
                    <div style="color: red">
                        로그아웃되었습니다.
                    </div>
                </c:if>
                </td>
            </tr>
        </table>
    </form>
		<!--// Input Form------------------------------------- -->
		</div>

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
		//Null check
		function isEmpty(value) {
			if (!value) {
				alert("값을 입력하세요.");
				return true;
			}
		}
		
		$(document).ready(function(){
	        $("#do_login").click(function(){
	            // 태크.val() : 태그에 입력된 값
	            // 태크.val("값") : 태그의 값을 변경 
	            var id = $("#id").val();
	            var pwd = $("#pwd").val();
	            if(id == ""){
	                alert("아이디를 입력하세요.");
	                $("#id").focus(); // 입력포커스 이동
	                return; // 함수 종료
	            }
	            if(pwd == ""){
	                alert("비밀번호를 입력하세요.");
	                $("#pwd").focus();
	                return;
	            }
	            
	         	var frm = document.frm;
	         	frm.action = '${CONTEXT}'+"/user/do_loginCheck.do";
	         	frm.submit();		
	            // 폼 내부의 데이터를 전송할 주소
	        });			
		});//--document.ready
	</script>