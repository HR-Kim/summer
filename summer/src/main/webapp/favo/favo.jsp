<%@page import="com.summer.comm.StringUtil"%>
<%@page import="com.summer.comm.SearchVO"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Logger log = LoggerFactory.getLogger(this.getClass());

	log.debug("==================================");
	log.debug("this.getClass()"+this.getClass());
	log.debug("==================================");
	
	String pageSize = "10";// 페이지 사이즈
	String pageNum = "1";// 현재페이지
	String searchWord = "";// 검색어
	String searchDiv = "";// 검색구분
	
	int totalCnt = 0;
	int bottomCnt = 10; //바닥에 보여줄 숫자
	
	SearchVO searchVO = new SearchVO();
	
	if(null != request.getAttribute("searchVO")) {
		searchVO = (SearchVO)request.getAttribute("searchVO");
	}
	log.debug("==searchVO=="+searchVO.toString());	
	

	pageSize = StringUtil.nvl(searchVO.getPageSize(),"10");
	pageNum = StringUtil.nvl(searchVO.getPageNum(),"1");
	searchWord = StringUtil.nvl(searchVO.getSearchWord(),"");
	searchDiv = StringUtil.nvl(searchVO.getSearchDiv(),"");
	
	int o_pageSize = Integer.parseInt(pageSize);
	int o_pageNum = Integer.parseInt(pageNum);
	
	String o_totalCnt =  (null == request.getAttribute("totalCnt"))?"0":request.getAttribute("totalCnt").toString();
	
	totalCnt = Integer.parseInt(o_totalCnt);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:set var="CONTEXT" value="${pageContext.request.contextPath}"/>
<div class="container">
<br>
<br>
<br>

<h3>장바구니</h3>
<hr/>
	
	<!-- list -->
	<form class="form-inline" name="frmfavo" id="frmfavo" method="get">
	<input type="hidden" name="pageNum" value="${searchVO.pageNum}"/>
	<table class="table table-striped table-bordered table-hover" id="favoTable">
      	<thead class="bg-primary">
      		<th class="text-center">번호</th>
      		<th class="text-center">상품명</th>
      		<th class="text-center">매장명</th>
      		<th class="text-center">수량</th>
      		<th class="text-center">가격</th>
      		<th class="text-center" style="display:none;">goodID</th>
      		<th class="text-center" style="display:none;">entpID</th>
      	</thead>
      	<tbody>
     		<c:choose>
     		<c:when test="${list.size() > 0}">
     			<c:forEach var="favoVO" items="${list}">
        		<tr>
        			<td class="text-center">${favoVO.no}</td>
        			<td class="text-left">${favoVO.goodName}</td>
        			<td class="text-left">${favoVO.entpName}</td>
        			<td class="text-center">${favoVO.goodNum}</td>
        			<td class="text-right">${favoVO.goodPrice} 원</td>
        			<td class="text-left" style="display:none;">${favoVO.goodId}</td>
        			<td class="text-left" style="display:none;">${favoVO.entpId}</td>
        		</tr>
       		</c:forEach>
       	</c:when>
       	<c:otherwise>
       		<tr>
       			<td colspan="99" class="text-center">no data</td>
       		</tr>
       	</c:otherwise>
      		</c:choose>
      	</tbody>
      </table>
    </form>
	<!-- list end -->
	
	<!-- paging -->
  	<div class="form-inline text-center">
  	<%= StringUtil.renderPaging(totalCnt, o_pageNum, o_pageSize, bottomCnt, "doSelectList.do", "search_page") %>
  	</div>
  	<!--// paging -->
</div>

	<script type="text/javascript">
	

	function doSearch(){
		
		var frm = document.frmfavo;
		frm.action = "doSelectList.do";
		frm.submit();
	}
	
	function search_page(url,pageNum){
    	//console.log("=url="+url);
    	var frm = document.frmfavo;
		frm.action = url;
		frm.pageNum.value = pageNum;
		frm.submit();
    }
	
	
	$(document).ready(function(){		
		$("#favoTable>tbody").on("click","tr",function(){
			
			var tr = $(this);
			var tds = tr.children();
			
			var goodid = tds.eq(5).text();
			var entpid = tds.eq(6).text();
			var id = 'aa';
			
			//삭제
			console.log(goodid);
			console.log(entpid);
			console.log(id);
			
		
			if(false==confirm("삭제 하시겠습니까?"))return;
			$.ajax({	
	      	 type:"POST",
            url:"doDelete.do",   
            dataType:"html",// JSON/html
            async: false,
            data:{ 
				"goodId": goodid
				,"entpId": entpid
				,"id": id
                },
            success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
           	 console.log("data="+data); 
            	//json parsing
            	var parseData = $.parseJSON(data); //데이터 들어있음.
            	console.log("parseData"+parseData);
            		
            	if(parseData.msgId == "1"){
            		alert(parseData.message);	
            		doSearch();
            	}else{
            		alert(parseData.message);	
            		}
           		
                },
               complete: function(data){//무조건 수행
                },
               error: function(xhr,status,error){
               console.log("doDelete error: "+error);
                }
   		}); //--ajax
		
		});
	});
	
	
	
	</script>