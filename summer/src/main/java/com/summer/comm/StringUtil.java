package com.summer.comm;

import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class StringUtil {
	static Logger log = LoggerFactory.getLogger(StringUtil.class);
	
	/**
	    * Paging처리 
	    * @param maxNum_i
	    * @param currPageNoIn_i
	    * @param rowsPerPage_i
	    * @param bottomCount_i
	    * @param url_i
	    * @param scriptName_i
	    * @return
	     */
		 public static String renderPaging(int maxNum_i, int currPageNoIn_i, int rowsPerPage_i, int bottomCount_i,
		   String url_i, String scriptName_i) {
		   int maxNum = 0; // 총 갯수
		   int currPageNo = 1; // 현재 페이지 번호 : page_num
		   int rowPerPage = 10; // 한페이지에 보여질 행수 : page_size
		   int bottomCount = 10; // 바닥에 보여질 페이지 수: 10

		   maxNum = maxNum_i;
		   currPageNo = currPageNoIn_i;
		   rowPerPage = rowsPerPage_i;
		   bottomCount = bottomCount_i;

		   String url = url_i; // 호출 URL
		   String scriptName = scriptName_i; // 호출 자바스크립트

		   int maxPageNo = ((maxNum - 1) / rowPerPage) + 1;
		   int startPageNo = ((currPageNo - 1) / bottomCount) * bottomCount + 1;//
		   int endPageNo = ((currPageNo - 1) / bottomCount + 1) * bottomCount;
		   int nowBlockNo = ((currPageNo - 1) / bottomCount) + 1;
		   int maxBlockNo = ((maxNum - 1) / bottomCount) + 1;

		   int inx = 0;
		   StringBuilder html = new StringBuilder();
		   if (currPageNo > maxPageNo) {
		    return "";
		   }

		   html.append("<table border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">   \n");
		   html.append("<tr>                       \n");
		   html.append("<td>                                                                    \n");
		   html.append("<ul class=\"pagination rounded-separated pagination-info mt-3\">                                                  \n");
		   // <<
		   if (nowBlockNo > 1 && nowBlockNo <= maxBlockNo) {
		    html.append("<li class = \"page-item active\"><a href=\"javascript:" + scriptName + "( '" + url+ "', 1 );\">  \n");
		    html.append("&laquo;   \n");
		    html.append("</a></li>      \n");
		   }

		   // <
		   if (startPageNo > bottomCount) {
		    html.append("<li class = \"page-item\"><a href=\"javascript:" + scriptName + "( '" + url + "'," + (startPageNo - 1)+ ");\"> \n");
		    html.append("<        \n");
		    html.append("</a></li>     \n");
		   }



		   // 1 2 3 ... 10 (숫자보여주기)
		   for (inx = startPageNo; inx <= maxPageNo && inx <= endPageNo; inx++) {
		    
		    if (inx == currPageNo) {
		     html.append("<li class=\"page-item\"><a href='#'>" + inx + "</a></li>");
		    } else {
		     html.append("<li class = \"page-item\"><a href=\"javascript:" + scriptName + "('" + url + "'," + inx+ ");\" >" + inx + "</a></li> \n");
		    }
		   }
		   
		   // >
		   if (maxPageNo >= inx) {
		    html.append("<li class=\"page-item\"><a href=\"javascript:" + scriptName + "('" + url + "',"+ ((nowBlockNo * bottomCount) + 1) + ");\"> \n");
		    html.append(">                       \n");
		    html.append("</a></li>              \n");
		   }

		   // >>
		   if (maxPageNo >= inx) {
		    html.append("<li class=\"page-item\"><a href=\"javascript:" + scriptName + "('" + url + "'," + maxPageNo+ ");\">      \n");
		    html.append("&raquo;     \n");
		    html.append("</a></li>    \n");
		   }
		   html.append("</ul>  \n");

		   html.append("</td>   \n");
		   html.append("</tr>   \n");
		   html.append("</table>   \n");

		   return html.toString();
		  }
		 /**
			 * 시작 알파벳/숫자 이면 true
			 * @param strInput
			 * @return boolean
			 */
			public static boolean isAlphabetDigit(String strInput) {
				String pattern = "^[a-zA-Z0-9]{8,20}$";
				log.debug("1=isAlphabetDisit==pattern="+pattern);
				log.debug("1=isAlphabetDisit==strInput="+strInput);
				boolean flag = Pattern.matches(pattern, strInput);
				
				log.debug("1=isAlphabetDisit==flag="+flag);
				return flag;
			}
			
			/**
			 * 숫자이면 true
			 * @param strInput
			 * @return boolean
			 */
			public static boolean isDisit(String strInput) {
				String pattern = "^[0-9]*$";
				log.debug("1=isAlphabetDisit==pattern="+pattern);
				log.debug("1=isAlphabetDisit==strInput="+strInput);
				boolean flag = Pattern.matches(pattern, strInput);
				
				log.debug("1=isAlphabetDisit==flag="+flag);
				return flag;
			}
			
			/**
			 * 알파벳이면 true
			 * @param strInput
			 * @return boolean
			 */
			public static boolean isAlphabet(String strInput) {
				String pattern = "^[a-zA-Z0-9]*$";
				log.debug("1=isAlphabetDisit==pattern="+pattern);
				log.debug("1=isAlphabetDisit==strInput="+strInput);
				boolean flag = Pattern.matches(pattern, strInput);
				
				log.debug("1=isAlphabetDisit==flag="+flag);
				return flag;
			}

		 
		/**
		 *  NVL
		 * @param str
		 * @param defValue
		 * @return String
		 */
		public static String nvl(String str,String defValue){
			String retStr = "";
			if(null == str || str.equals("")){
				retStr = defValue;
			}else{
				retStr = str.trim();
			}
			
			return retStr;
		}
}
