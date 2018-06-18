<%@page import="com.summer.comm.StringUtil"%>
<%@page import="com.summer.comm.SearchVO"%>
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
	
	String pageSize = "10";//페이지 사이즈
	String pageNum  = "1";//현재 페이지
	String searchWord ="";//검색어
	String searchDiv ="";//검색구분
	
	int totalCnt = 0;
	int bottomCount = 10;
	
	SearchVO searchVO = new SearchVO();
	
	if(null != request.getAttribute("searchVO")){
		searchVO = (SearchVO)request.getAttribute("searchVO");
	}
	log.debug("searchVO:"+searchVO.toString());
	
	pageSize = StringUtil.nvl(searchVO.getPageSize(),"10");
	pageNum = StringUtil.nvl(searchVO.getPageNum(),"1");
	searchWord = StringUtil.nvl(searchVO.getSearchWord(),"");
	searchDiv = StringUtil.nvl(searchVO.getSearchDiv(),"");
	
	int o_pageSize = Integer.parseInt(pageSize);
	int o_pageNum = Integer.parseInt(pageNum);
	
	String o_TotalCnt = (null == request.getAttribute("totalCnt"))?"0":request.getAttribute("totalCnt").toString();
	totalCnt = Integer.parseInt(o_TotalCnt);
	
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
    <title>:::자유게시판:::</title>

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
		 <h3>자유게시판</h3>
		<!--// Title------------------------------------------ -->
		<div class="clearfix pull-rigth">
		 	<button type="button" class="cancelbtn" onclick="location.href='${CONTEXT}/board/boardWrite.jsp'">글쓰기</button>
		</div>
		 
		<!-- List--------------------------------------------  -->
		<div class="table-responsive">
			<table id="listTable" class="table  table-striped table-bordered table-hover">
				<thead class="bg-primary">
					<tr>
						<th class="text-center">글번호</th>
						<th class="text-center">구분</th>
						<th class="text-center">제목</th>
						<th class="text-center">작성자</th>
						<th class="text-center">등록일</th>
						<th class="text-center">조회수</th>
						<th class="text-center">좋아용</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${list.size()>0 }">
							<c:forEach var="board" items="${list}">
								<tr>
									<td class="text-center">${board.num}</td>
									<td class="text-left">${board.category}</td>
									<td class="text-left">${board.title}</td>
									<td class="text-left">${board.id}</td>
									<td class="text-right">${board.dateReg}</td>
									<td class="text-left">${board.clickCnt}</td>
									<td class="text-right">${board.likeCnt}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="99" class="text-center">등록된 게시글이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<!--// List------------------------------------------  -->
		
		<!-- Paging-------------------------------------------- -->
		<div class="form-inline text-center">
			<%=StringUtil.renderPaging(totalCnt, o_pageNum, o_pageSize, bottomCount, "do_selectList.do", "search_page")%>
		</div>
		<!--// Paging------------------------------------------ -->
		
		<!-- Search------------------------------------------- -->
		<form class="form-inline" name="frm" id="frm" method="get">
			<input type="hidden" name="pageNum" id="pageNum"
				value="${searchVO.pageNum}" />
			<table class="table">
				<tr>
					<td class="text-center">구분
						<div class="form-group col-lg6 col-sm6">
							<select name="searchDiv" id="searchDiv" class="form-control input-sm">
								<option value="">전체</option>
								<option value="10"
									<c:if test="${searchVO.searchDiv == '10'}">selected='selected'</c:if>>ID</option>
								<option value="20"
									<c:if test="${searchVO.searchDiv == '20'}">selected='selected'</c:if>>이름</option>
							</select> 
							<input type="text" class="form-control input-sm" name="searchWord" id="searchWord" value="${searchVO.searchWord}" />
						 	<button class="btn btn-success btn-sm" id="do_search" onclick="doSearch();">검색</button>
						</div>
					</td>
				</tr>
			</table>
		</form>
		<!--// Search----------------------------------------- -->

		<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="${CONTEXT}/resources/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${CONTEXT}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		
		//조회
		function doSearch() {
			var frm = document.frm;
			frm.action = "do_selectList.do";
			frm.submit();
		}

		//Paging 이동 : StringUtil.renderPaging
		function search_page(url, pageNum) {
			//console.log(url+"|"+pageNum)
			var frm = document.frm;
			frm.pageNum.value = pageNum;
			frm.action = url;
			frm.submit();
		}

		
		$(document).ready(function() {
			//그리드 click
			$("#listTable>tbody").on("dblclick", "tr", function() {
				//console.log("listTable")

				var tr = $(this);
				var tds = tr.children();
				
				var sessionId = "<%= session.getAttribute("id") %>";
				var num = tds.eq(0).text();
				var title = tds.eq(2).text();
				//console.log("listTable id=" + id);
				if (num == "")
					return;
				if (false == confirm("(" + title + ")조회 하시겠습니까?"))
					return;
				
				location.href="/summer/board/do_selectOne.do?num="+num+"&id="+sessionId;
			});
		});

/* 				$.ajax({
					type : "GET",
					url : "do_selectOne.do",
					dataType : "html",// JSON/Html
					async : false,
					data : {
						"num" : num
					},
					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						console.log("data=" + data);
						//json parsing
						var parseData = $.parseJSON(data);
						console.log("parseData=" + parseData);
						
						var frm = document.frm;
						frm.category.value = category;
						frm.title.value = title;
						frm.content.value = content;
						frm.action = '${CONTEXT}'+"/board/boardView.jsp";						
						frm.submit();	
					},
					complete : function(data) {//무조건 수행

					},
					error : function(xhr, status, error) {
						console.log("do_searchOne error: " + error);
					}

				});//--그리드 click -> ajax

			});//--#listTable>tbody

		});//--document.ready */
	</script>
</body>
</html>