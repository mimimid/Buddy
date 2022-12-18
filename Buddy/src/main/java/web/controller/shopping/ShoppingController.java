package web.controller.shopping;

import java.io.BufferedReader;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.dto.AniOrder;
import web.dto.AniProduct;
import web.dto.AniReview;
import web.service.face.shopping.ShoppingService;
import web.util.Paging;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	
	@Autowired private ShoppingService shoppingService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/list")
	public void list(
			@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		Paging paging = shoppingService.getPaging(curPage);
//		logger.debug("페이징 계산 : {}", paging);
		model.addAttribute("paging",paging);
		
		List<AniProduct> list = shoppingService.getList(paging);
//		logger.debug("리스트 계산 : {}", list);
		model.addAttribute("list",list);
		
		
	}
	
	@GetMapping("/input")
	public void input() {
		
	}
	
	@PostMapping("/input")
	public String inputProc(AniProduct product, MultipartFile img) {
//		logger.debug("입력받은 내용 : {}", product);
//		logger.debug("입력받은 이미지 : {}", img);
		
		shoppingService.input(product, img);
		
		return "redirect:/shopping/list";
	}
	
	@GetMapping("/view")
	public void view(int productno, Model model) {
//		logger.debug("보여질 상품 번호 : {}", productno);
		
		//상품 상세 정보
		AniProduct product = shoppingService.view(productno);
//		logger.debug("상품 상세정보 : {}", product);
		
		
		model.addAttribute("product", product);
		
	
	}
	
	@GetMapping("/review")
	public void review(int productno, Model model) {
		List<AniReview> review = shoppingService.viewReview(productno);
		
//		logger.debug("리뷰 내역 : {}", review);
		model.addAttribute("review", review);
		
	}
	
	@ResponseBody
	@PostMapping("/review")
	public String reviewProc(AniReview review) {
		
		logger.debug("ajax 입력값 테스트 {}", review);
		
		shoppingService.inputReview(review);
		
		return "";
			
	}
	
	@GetMapping("/deleteReview")
	public String reviewDelte(AniReview review) {
		
		logger.debug("삭제 리뷰 정보 : {}", review);
		shoppingService.deleteReview(review);
		
		
		return "redirect:/shopping/view?productno="+review.getProductno();
		
	}
	
	@GetMapping("/delete")
	public String delete(int productno) {
		
		shoppingService.deleteProduct(productno);
//		logger.debug("삭제할 상품번호 : {} ", productno);
		return "redirect:/shopping/list";
	}
	
	@GetMapping("order")
	public void order(AniOrder order, Model model) {
		
		
		AniProduct product = shoppingService.getProduct(order);
		logger.debug("상품정보 확인 : {}", product);
		
		model.addAttribute("product", product);
	}
	@ResponseBody
	@RequestMapping("kakao")
	public String kakaopay() {
		
		try {
			URL add = new URL("https://kapi.kakao.com/v1/payment/ready");
			
			HttpURLConnection conn = (HttpURLConnection)add.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 7e64369997a318b483b424bda8b8e504");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true);
			
			String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=item_name&quantity=1&total_amount=1&tax_free_amount=1&approval_url=http://localhost:8888/shopping/success.jsp&cancel_url=http://localhost:8888/shopping/cancel.jsp&fail_url=http://localhost:8888/shopping/fail.jsp";
			
			OutputStream out = conn.getOutputStream();
			DataOutputStream data = new DataOutputStream(out);
			
			data.writeBytes(param);
			data.close();
			
			int result = conn.getResponseCode();
			
			InputStream input;
			if(result==200) {
				input=conn.getInputStream();
			}else {
				input=conn.getErrorStream();
			}
			
			InputStreamReader inputreader = new InputStreamReader(input);
			BufferedReader breader = new BufferedReader(inputreader);
			return breader.readLine();
			
		} catch (MalformedURLException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
	}
	
	
	
	

}
