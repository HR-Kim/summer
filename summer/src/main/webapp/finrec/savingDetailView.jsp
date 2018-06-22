<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">

<div class = "container">
                  <h2>적금 상세</h2>
   
                  <div class="table-responsive" id = "searchResult">
                    <table class="table table-striped table-bordered table-hover">
                    <tbody>
                    <tr>
                    <th  colspan="2">
                    	${outVO.korCoNm}<br/>
                    	<h3>${outVO.finPrdtNm}</h3>
                    </th>
                    </tr>
                    
                    <tr>
                    <th> 가입 방법</th><th> ${outVO.joinWay}</th>
                    </tr>
                    <tr>
                    <th>만기 후 이자율</th><th>  ${outVO.mtrtInt}</th>
                    </tr>
                    <tr>
                    <th>우대조건</th><th>  ${outVO.spclCnd}</th>
                    </tr>
                    
                    <tr>
                     <th>저축금리유형</th><th> ${outVO.intrRateTypeNm}</th>
                     </tr>
                     <tr>
                     <th>유형 </th><th> ${outVO.rsrvTypeNm}</th>
                     </tr>
                     <tr>
                     <th>최저금리 </th><th> ${outVO.intrRateMin}</th>
                     </tr>
                     <tr>
                     <th>최고우대금리</th><th>  ${outVO.intrRateMax}</th>
                    </tr>
                    
                    <tr >
                    <th colspan="2">
					기타 : ${outVO.etcNote}
                    </th>
                    </tr>
                    
                    <tr>
                    <th colspan="2">
                     	 <button type="submit" class="btn btn-primary btn-fw" >즐겨찾기에 추가</button>
                     	 </th>
                      </tr>
                    
                    </tbody>
                    </table>
                    </div>


                  
</div>
