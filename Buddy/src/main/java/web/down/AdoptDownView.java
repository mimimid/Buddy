package web.down;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import web.dto.AdoptFile;

public class AdoptDownView extends AbstractView {
	
	@Autowired ServletContext context;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		AdoptFile adoptFile = (AdoptFile) model.get("downFile");
		
		File src = new File( context.getRealPath("upload"), adoptFile.getAnifileStored() );
		
		
		response.setContentType("application//octet-stream");
		response.setContentLength((int) src.length());
		response.setCharacterEncoding("UTF-8");
		
		String outputName = URLEncoder.encode(adoptFile.getAnifileOrigin(), "UTF-8");
		response.setHeader("content-Disposition", "attchment; filename=\"" + outputName + "\"");
		
		
		FileInputStream in = new FileInputStream(src);
		
		OutputStream out = response.getOutputStream();
		
		FileCopyUtils.copy(in, out);
		
	}

}
