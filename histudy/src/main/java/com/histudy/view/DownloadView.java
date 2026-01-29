package com.histudy.view;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {

	public DownloadView() {
		setContentType("application/download; charset=utf-8"); //1. utf-8로 설정후, 서버로부터 다운로드
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		File file = (File) model.get("downloadFile"); // 2. 모델로부터 파일 정보 읽어오기 
		//mav.addObject("downloadFile", f); 이름이 같아야함.

		response.setContentType(getContentType());
		response.setContentLength((int) file.length());

		String userAgent = request.getHeader("User-Agent");
		boolean ie = userAgent.indexOf("MSIE") > -1;
		String fileName = null;
		if (ie) {
			fileName = URLEncoder.encode(file.getName(), "utf-8");
		} else {
			fileName = new String(file.getName().getBytes("utf-8"),
					"iso-8859-1");
		}
		response.setHeader("Content-Disposition", 
				"attachment; filename=\"" + fileName + "\";"); // 3. 저장되는 파일 이름 변경
		response.setHeader("Content-Transfer-Encoding", "binary");
		OutputStream out = response.getOutputStream(); // OutputStream을 이용해서 내보내기
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		} finally {
			if (fis != null)
				try {
					fis.close();
				} catch (IOException ex) {
				}
		}
		out.flush();
	}

}
