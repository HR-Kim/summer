package com.summer.finrec.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.summer.finrec.comm.FinSavingSearchVO;
import com.summer.finrec.comm.JsonUtil;
import com.summer.finrec.domain.FinSavingVO;

public class SavingServiceImple implements SavingService {

	public JsonObject readJsonFromOpenApi() {
		
		JsonObject jsonObject = null;
		
		try {
			jsonObject = JsonUtil.readJsonFromUrl("http://finlife.fss.or.kr/finlifeapi/savingProductsSearch.json?auth=14d1134a0ead0dd589a54359e7fa62ff&topFinGrpNo=020000&pageNo=1");
			JsonObject result = jsonObject.get("result").getAsJsonObject();
			int maxPageNo = result.get("max_page_no").getAsInt();
			
			JsonArray baseList = result.get("baseList").getAsJsonArray();
			JsonArray optionList = result.get("optionList").getAsJsonArray();
					
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return jsonObject;
	}
	
	@Override
	public FinSavingVO getSelectOne(String finPrdtCd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FinSavingVO> getSelectList(FinSavingSearchVO vo) {
		
		List<FinSavingVO> list = new ArrayList<FinSavingVO>();
		
		//JsonObject 받아서 
		SavingServiceImple savingServiceImple = new SavingServiceImple();
		JsonObject jsonObject = savingServiceImple.readJsonFromOpenApi();
		
		//if jsonobject null = 오류 발생
		
		if(null != jsonObject) {
			JsonObject result = jsonObject.get("result").getAsJsonObject();
			JsonArray baseList = result.get("baseList").getAsJsonArray();
			JsonArray optionList = result.get("optionList").getAsJsonArray();

			//paging할 갯수만큼만 가져와!
			int pageSize = vo.getPageSize();
			int pageNum = vo.getPageNum();
			
			int startNo = pageSize * (pageNum - 1);
			
			for(int i = startNo ; i < startNo + pageSize ; i++) {

//			for(int i = 0 ; i < baseList.size() ; i++) {
				FinSavingVO outVo = new FinSavingVO();
				JsonObject baseInfo = baseList.get(i).getAsJsonObject();
				
				//baseList
				outVo.setFinCoNo(baseInfo.get("fin_co_no").getAsString());
				outVo.setFinPrdtCd(baseInfo.get("fin_prdt_cd").getAsString());

				outVo.setKorCoNm(baseInfo.get("kor_co_nm").getAsString());
				outVo.setFinPrdtNm(baseInfo.get("fin_prdt_nm").getAsString());
				
				outVo.setJoinWay(baseInfo.get("join_way").getAsString());
				outVo.setMtrtInt(baseInfo.get("mtrt_int").getAsString());
				outVo.setSpclCnd(baseInfo.get("spcl_cnd").getAsString());
				outVo.setEtcNote(baseInfo.get("etc_note").getAsString());
				outVo.setMaxLimit(baseInfo.get("max_limit").getAsInt());
				
				//fin_prdt_cd와 일치하는 것만 optionList에서 찾기
				JsonArray optionWithFinPrdtCd = new JsonArray();
				for(int j = 0 ; j < optionList.size() ; j++) {
					JsonObject optionInfo = optionList.get(j).getAsJsonObject();
					if(optionInfo.get("fin_prdt_cd").getAsString().equals(outVo.getFinPrdtCd())) {
						optionWithFinPrdtCd.add(optionInfo.getAsJsonObject());
					}
				}//--for
				
				List<Float> intrRates = new ArrayList<Float>(); 
								
				for(int j = 0 ; j < optionWithFinPrdtCd.size() ; j++) {
					JsonObject optionWithFinPrdtCdInfo = optionWithFinPrdtCd.get(j).getAsJsonObject();
					float intrRate = optionWithFinPrdtCdInfo.get("intr_rate").getAsFloat();
					intrRates.add(intrRate);
					float intrRate2 = optionWithFinPrdtCdInfo.get("intr_rate2").getAsFloat();
					intrRates.add(intrRate2);
				}
				
				outVo.setIntrRateMin(Collections.min(intrRates));
				outVo.setIntrRateMax(Collections.max(intrRates));
				
				JsonObject optionWithFinPrdtCdInfo = optionWithFinPrdtCd.get(0).getAsJsonObject();
				outVo.setIntrRateType(optionWithFinPrdtCdInfo.get("intr_rate_type").getAsString());
				outVo.setRsrvType(optionWithFinPrdtCdInfo.get("rsrv_type").getAsString());
				outVo.setIntrRateTypeNm(optionWithFinPrdtCdInfo.get("intr_rate_type_nm").getAsString());
				outVo.setRsrvTypeNm(optionWithFinPrdtCdInfo.get("rsrv_type_nm").getAsString());

				
				list.add(outVo);
			}
			
		}
		System.out.print(list);
		return list;
	}

	public static void main(String args[]) {
		new SavingServiceImple().getSelectList(new FinSavingSearchVO());
	}

}
