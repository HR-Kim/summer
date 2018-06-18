package com.summer.finrec.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

			for(int i = 10 ; i < 20 ; i++) {

//			for(int i = 0 ; i < baseList.size() ; i++) {
				FinSavingVO outVo = new FinSavingVO();
				JsonObject baseInfo = baseList.get(i).getAsJsonObject();
				outVo.setKorCoNm(baseInfo.get("kor_co_nm").getAsString());
				outVo.setFinPrdtNm(baseInfo.get("fin_prdt_nm").getAsString());
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
