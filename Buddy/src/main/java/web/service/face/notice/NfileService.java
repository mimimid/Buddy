package web.service.face.notice;

import org.springframework.web.multipart.MultipartFile;

public interface NfileService {
	
	public void write(int boardno, MultipartFile bfile);

}
