<%@page import="com.summer.accounts.domain.Accounts"%>
<%@page import="com.summer.comm.DTO"%>
<%@page import="java.util.List"%>
<%@page import="com.summer.codes.dao.CodeDao"%>
<%@page import="com.summer.codes.domain.CodeVO"%>
<%@page import="com.summer.comm.StringUtil"%>
<%@page import="com.summer.comm.SearchVO"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	Logger log = LoggerFactory.getLogger(this.getClass());

	log.debug("===============================");
	log.debug("=this.getClass()="+this.getClass());
	log.debug("===============================");

	String searchWord = ""; 	//검색어
	String searchDiv = ""; 	//검색구분
	
	SearchVO searchVO = new SearchVO();
	if(null != request.getAttribute("searchVO")){
		searchVO = (SearchVO)request.getAttribute("searchVO");
	}
	log.debug("=searchVO="+searchVO.toString());
	
	searchWord = StringUtil.nvl(searchVO.getSearchWord(),"");
	searchDiv = StringUtil.nvl(searchVO.getSearchDiv(),"2018");
	
	log.debug("searchDiv"+searchDiv);
	
%>

<%-- CONTEXT --%>
<c:set var="CONTEXT" value="${pageContext.request.contextPath}"/>  
	<div class="container">
	<br/><br/>
		<!-- Search ----------------------------------------------------------->
		<form class="form-inline" name="frm" id="frm" method="get">
	   		<input type="hidden" name="pageNum" id="pageNum" value="${searchVO.pageNum}"/>
			<input type="hidden" name="searchWord" id="searchWord" value="<%=session.getAttribute("id")%>"/>
	
	
	   		<table class="table">
	   			<tr>
	   				<td style="padding-left:0; padding-right:0;">
	   					<div class="form-group col-xs-12" style="padding:0">
							<select id="searchDiv" name="searchDiv" class="form-control input-sm">
					          <c:forEach begin="0" end="10" var="result" step="1">
					           <option value="${2018 - result}"
					           	<c:if test="${(2018 - result) == searchVO.searchDiv}"> selected="selected"</c:if>><c:out value="${2018 - result}" />
					           </option>
					          </c:forEach>                          
					        </select>
	    						
	    						<button class="btn btn-sm btn-default" onclick="javascript:doSelectListMonth();">검색</button>
	    						<input style="float:right;" type="button" class="btn btn-sm btn-default" value="차트보기" onclick="showMonthPopup();"/>
	    						<input style="float:right;" type="button" class="btn btn-sm btn-default" value="연령대 별 차트보기" onclick="showAgeMonthPopup();"/>
	   					</div>
	   				</td>
	   			</tr>
	   		</table>
	   	</form> 
		<!--// Search --------------------------------------------------------->
		
			<!-- List ------------------------------------------------------------->
			     <div class="table-responsive">
			       <table id="listTable" class="table  table-striped table-bordered table-hover">
			        	<thead class="bg-primary">
			        		<tr>
			        			<th class="text-center">달</th>
				         		<th class="text-center">지출</th>
				         		<th class="text-center">수입</th>
				         		<th class="text-center">총합</th>
			         		</tr>
			        	</thead>
			        	<tbody>
			        		
			        	<c:choose>
			        		<c:when test="${list.size()>0 }">
			        			<c:forEach var="AccountsVO" items="${list }">
					        		<tr>
					        		<td class="text-center">${AccountsVO.aDate }</td>
					        		 <td class="text-right" style="color: red;">
								          <fmt:formatNumber value="${AccountsVO.sumExp}" pattern="#,###"/>원
								    </td>
					        		<td class="text-right" style="color: blue;">
										<fmt:formatNumber value="${AccountsVO.sumInc}" pattern="#,###"/>원
									</td>
					        		<td class="text-right">
										<fmt:formatNumber value="${AccountsVO.sumTotal}" pattern="#,###"/>원
									</td>
					         		</tr>
				         		</c:forEach>
			         		</c:when>
			         		<c:otherwise>
			         			<tr>
				          		<td colspan="99" class="text-center">데이터가 없습니다.</td>
				         		</tr>
			         		</c:otherwise>
			         	</c:choose>
			        	</tbody>
			        </table>
			      </div>
			<!--// List ----------------------------------------------------------->

	</div>
   
	<script type="text/javascript">

	//리스트 조회
	function doSelectListMonth(){
		var frm = document.frm;
		frm.action = "${CONTEXT}/accounts/doSelectListMonth.do";
		frm.submit();
	}
	
	 function showMonthPopup() { window.open("${CONTEXT}/chart/chart3.jsp", "월 간 차트", "width=350, height=700, left=100, top=50"); }
	 function showAgeMonthPopup() { window.open("${CONTEXT}/agecompare/agecompare.jsp", "연령대 별 월 간 차트", "width=950, height=650, left=100, top=50"); }
	</script>
  </body>
</html>