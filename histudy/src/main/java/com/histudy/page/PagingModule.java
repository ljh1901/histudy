package com.histudy.page;

public class PagingModule {
	
	public static String makePage(int cp, int listSize, int pageSize, int totalCnt, String pagename) {

		int userGroup = cp/pageSize;
		if(cp%pageSize==0) {
			userGroup--;
		}
		
		int totalPage = totalCnt/listSize+1;
		if(totalCnt%listSize==0) {
			totalPage--;
		}
		
		int startPage = userGroup*pageSize+1;
		int endPage = startPage+pageSize-1;
		
		StringBuffer sb = new StringBuffer();
		/** 이전 버튼 */
		if(userGroup!=0) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(startPage-1);
			sb.append("'>");
			sb.append("<img src='");
			sb.append("/histudy/main-img/prev.png'>");
			sb.append("</a>");
		}
		/** 페이징 */
		for(int i=startPage; i<=endPage; i++) {
			if(totalPage<i) {
				break;
			}
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>");
		}
		/** 다음 버튼 */
		if(endPage<totalPage) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(endPage+1);
			sb.append("'>");
			sb.append("<img src='");
			sb.append("/histudy/main-img/next.png'>");
			sb.append("</a>");
		}
		
		return sb.toString();
		
	}

}
