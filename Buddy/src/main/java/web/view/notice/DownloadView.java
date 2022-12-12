package web.view.notice;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import web.dto.notice.Nfile;

public class DownloadView extends AbstractView {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(DownloadView.class);

	//서블릿 컨텍스트 객체
	@Autowired ServletContext context;
	
	@Override
	protected void renderMergedOutputModel(
			Map<String, Object> model,
			HttpServletRequest request,
			HttpServletResponse response ) throws Exception {

		logger.info("BeanName View 테스트");
//		response.getWriter().println("HTML 테스트");
		
		model.size();
		
		//모델값 가져오기
		Nfile file = (Nfile) model.get("downFile");
		logger.info("downFile {}", file);
		
		//저장된 파일의 폴더 (upload)
		String path = context.getRealPath("upload");
		
		//저장된 파일의 이름
		String filename = file.getStoredName();
		
		//실제 업로드된 파일에 대한 객체
		File src = new File(path, filename);
		
		logger.info("서버에 업로드된 파일 {}", src);
		logger.info("파일 존재 여부 {}", src.exists());
	
		//----------------------------------------------------------------------------
		
		//HTTP응답 직접 구성하여 처리한다
		//	-> HTTP Response HEADER 정보 작성 필요
		//	-> HTTP Response BODY 정보 작성 필요
		
		
		// - - - 응답 메시지의 HEADER영역 설정 - - -
		
		//파일을 전송하는 콘텐트타입으로 설정 ( 이진데이터 형식 - 파일 )
		response.setContentType("application/octet-stream");
	
		//응답 데이터의 크기 설정
		response.setContentLength((int)src.length());
		
		//응답 데이터의 인코딩 설정
		response.setCharacterEncoding("UTF-8");
		
		//브라우저가 다운로드에 사용할 이름 지정하기
		String outputName = URLEncoder.encode(file.getOriginName(), "UTF-8"); //인코딩 설정
		response.setHeader("Content-Disposition", "attachment; filename=\"" + outputName + "\"");
		
		
		// - - - 응답 메시지의 BODY영역 설정 - - -
		
		//	서버의 File -> FileInputStream 입력 -> HTTP Response OutputStream으로 출력
		
		
		//서버의 파일 입력 스트림
		FileInputStream fis = new FileInputStream(src);
		
		//클라이언트 응답 출력 스트림
		OutputStream out = response.getOutputStream();
		
		
		//서버->클라이언트 파일 복사
		FileCopyUtils.copy(fis, out);
		
	}
	
}