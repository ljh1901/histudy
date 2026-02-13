package com.histudy.page;

import java.net.URLEncoder;

public class PagingModule {
	
	public static String makePage(int cp, int listSize, int pageSize, int totalCnt, String pagename, Integer sc_idx, String studyFind) {
		// 카테고리 유효성 검사
		if(sc_idx == null) {
			sc_idx = 0;
		}
		
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
			sb.append("&sc_idx=");
			sb.append(sc_idx);
			sb.append("&studyFind=");
			sb.append(studyFind);
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
			sb.append("&sc_idx=");
			sb.append(sc_idx);
			sb.append("&studyFind=");
			sb.append(studyFind);
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
			sb.append("&sc_idx=");
			sb.append(sc_idx);
			sb.append("&studyFind=");
			sb.append(studyFind);
			sb.append("'>");
			sb.append("<img src='");
			sb.append("/histudy/main-img/next.png'>");
			sb.append("</a>");
		}
		
		return sb.toString();
		
	}

	public static String makePage(int cp, int listSize, int pageSize, int totalCnt,
            String pagename, Integer sc_idx) {
return makePage(cp, listSize, pageSize, totalCnt, pagename, sc_idx, "");
}

public static String makePage(int cp, int listSize, int pageSize, int totalCnt,
            String pagename) {
return makePage(cp, listSize, pageSize, totalCnt, pagename, 0, "");
}
	
public static String makePageWithKw(int cp, int listSize, int pageSize, int totalCnt,
        String pagename, Integer sc_idx, String kw) {

if (sc_idx == null) sc_idx = 0;
if (kw == null) kw = "";

String safeKw = kw;
try {
safeKw = URLEncoder.encode(kw, "UTF-8");
} catch (Exception e) {

}

int userGroup = cp / pageSize;
if (cp % pageSize == 0) userGroup--;

int totalPage = totalCnt / listSize + 1;
if (totalCnt % listSize == 0) totalPage--;

int startPage = userGroup * pageSize + 1;
int endPage = startPage + pageSize - 1;

StringBuffer sb = new StringBuffer();

if (userGroup != 0) {
sb.append("<a href='").append(pagename)
.append("?cp=").append(startPage - 1)
.append("&sc_idx=").append(sc_idx)
.append("&kw=").append(safeKw)
.append("'>")
.append("<img src='/histudy/main-img/prev.png'>")
.append("</a>");
}

for (int i = startPage; i <= endPage; i++) {
if (totalPage < i) break;

sb.append("<a href='").append(pagename)
.append("?cp=").append(i)
.append("&sc_idx=").append(sc_idx)
.append("&kw=").append(safeKw)
.append("'>")
.append(i)
.append("</a>");
}

if (endPage < totalPage) {
sb.append("<a href='").append(pagename)
.append("?cp=").append(endPage + 1)
.append("&sc_idx=").append(sc_idx)
.append("&kw=").append(safeKw)
.append("'>")
.append("<img src='/histudy/main-img/next.png'>")
.append("</a>");
}

return sb.toString();
}

}
