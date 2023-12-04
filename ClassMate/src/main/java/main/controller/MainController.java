package main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import board.dto.EventBoard;
import lecture.dto.Address;
import lecture.dto.Class;
import main.dto.MainCategory;
import main.dto.SubCategory;
import main.service.face.MainService;
import web.util.Paging;

@Controller
@PropertySource("classpath:/config.properties")
@RequestMapping("/main")
public class MainController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MainService mainService;
	
	@GetMapping("/main")
	public void main( Model model, Class cLass, EventBoard eventBoard, Map<String,Object> map) {
		
		mainService.MainPage(cLass,eventBoard,map);
		
//		logger.info("안에 뭐 있어? : {}",map.get("onClassOrderTopList"));
		
		model.addAttribute("selectByEventFileList",map.get("selectByEventFileList"));
		model.addAttribute("onClassOrderTopList",map.get("onClassOrderTopList"));
		model.addAttribute("onRecommended",map.get("onRecommended"));
		model.addAttribute("offClassOrderTopList",map.get("offClassOrderTopList"));
		model.addAttribute("offRecommended",map.get("offRecommended"));
		
	}
	
	@GetMapping("/site")
	public void siteIntroduction() {
		
	}
	
	@GetMapping("/mainCategory")
	public void mainCategory( HttpSession session, Model model ){
		
		List<MainCategory> list = mainService.mainCategoryList();
//		System.out.println(list);
//		logger.info("mainCategory : {}", list);
		model.addAttribute("list", list);
		
	}
	
	@GetMapping("/subCategory")
	public void subCategory( SubCategory subCategory, Model model ) {
//		System.out.println(subCategory);
		
		List<SubCategory> list = mainService.subCategoryList(subCategory);
		logger.info("list안에 뭐있어? {}",list);
		
			
		model.addAttribute("list", list);
		
//		System.out.println(list);
	}
	
	   @GetMapping("/onClassList")
	   public void onClassList(Class cLass, Model model, Paging paging, String sort) {
//		   logger.info("ONCLASS {}", cLass);
		   
		   Map<String, Object> map = new HashMap<>();
		   mainService.endClass();
		   
	       map = mainService.onClassList(cLass, paging);

	       model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
	       model.addAttribute("onClassList", map.get("list"));
	       model.addAttribute("paging",map.get("paging1"));
	       logger.info("페이징 {}",paging);
	       logger.info("페이징 {}",map.get("paging1"));
	       
	       System.out.println(map.get("list"));
	       if (map.get("list") == null || ((List<?>) map.get("list")).isEmpty()) {
	    	    model.addAttribute("error", 1);
	    	}
	       
	       if (sort != null) {
			   if( sort.equals("expense") ) {
					logger.info("sort {}", sort);
				   map = mainService.onClassList(cLass, paging, sort);
	
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("onClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("expenseNo",1);
				   
			       logger.info("sort 뭔데 {}",sort);
			       logger.info("list 뭔데 {}",map.get("list"));
				   if (map.get("list") == null || ((List<?>) map.get("list")).isEmpty()) {
					    model.addAttribute("error", 1);
					}
				   
			   } else if( sort.equals("class_no desc") ) {
					logger.info("sort {}", sort);
				   map = mainService.onClassList(cLass, paging, sort);
				   
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("onClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("classDescNo",2);
				   
			       logger.info("sort 뭔데 {}",sort);
			       logger.info("list 뭔데 {}",map.get("list"));
				   if (map.get("list") == null || ((List<?>) map.get("list")).isEmpty()) {
					    model.addAttribute("error", 1);
					}
				   
				   
			   } else if( sort.equals("expense desc") ) {
				   logger.info("sort {}", sort);
				   map = mainService.onClassList(cLass, paging, sort);
				   
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("onClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("expenseDescNo",3);
				   
			       logger.info("sort 뭔데 {}",sort);
			       logger.info("list 뭔데 {}",map.get("list"));
				   if (map.get("list") == null || ((List<?>) map.get("list")).isEmpty()) {
					    model.addAttribute("error", 1);
					}
				   
			   } else if(sort.equals("COUNT(C.max_count) desc") ) {
				   logger.info("sort {}", sort);
				   map = mainService.onClassList(cLass, paging, sort);
				   
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("onClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("orderNoDesc",4);
				   
			       logger.info("sort 뭔데 {}",sort);
			       logger.info("list 뭔데 {}",map.get("list"));
				   if (map.get("list") == null || ((List<?>) map.get("list")).isEmpty()) {
					    model.addAttribute("error", 1);
					}
				   
			   }
		   }
	   }
	   

	   @GetMapping("/offClassList")
	   public void offClassList(Class cLass, Model model, Paging paging, String sort) {

	   	   Map<String, Object> map = new HashMap<>();
	   	   mainService.endClass();
	   	   
	   	   map = mainService.offClassList(cLass, paging);
	   	   
	       model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
	       model.addAttribute("offClassList", map.get("list"));
	       model.addAttribute("paging",map.get("paging1"));
	       if (map.get("list") == null || ((List<?>) map.get("list")).isEmpty()) {
	    	    model.addAttribute("error", 1);
	    	}
	       
	       if (sort != null) {
			   if( sort.equals("expense") ) {
					logger.info("sort {}", sort);
				   map = mainService.offClassList(cLass, paging, sort);
				   
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("offClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("expenseNo",1);
				   if (map.get("list") == null || ((List<?>) map.get("list")).isEmpty()) {
					    model.addAttribute("error", 1);
					}
				   
			   } else if( sort.equals("class_no desc") ) {
					logger.info("sort {}", sort);
				   map = mainService.offClassList(cLass, paging, sort);
				   
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("offClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("classDescNo",null);
				   if (map.get("list") == null || ((List<?>) map.get("list")).isEmpty()) {
					    model.addAttribute("error", 1);
					}
				   
				   
			   } else if( sort.equals("expense desc") ) {
				   logger.info("sort {}", sort);
				   map = mainService.offClassList(cLass, paging, sort);
				   
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("offClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("expenseDescNo",3);
				   if (map.get("list") == null || ((List<?>) map.get("list")).isEmpty()) {
					    model.addAttribute("error", 1);
					}
				   
			   } else if(sort.equals("COUNT(C.max_count) desc") ) {
				   logger.info("sort {}", sort);
				   map = mainService.offClassList(cLass, paging, sort);
				   
				   model.addAttribute("subCategoryNo", cLass.getSubCategoryNo());
				   model.addAttribute("offClassList", map.get("list"));
				   model.addAttribute("paging",map.get("paging1"));
				   model.addAttribute("sort",sort);
				   model.addAttribute("orderNoDesc",4);
				   if (map.get("list") == null || ((List<?>) map.get("list")).isEmpty()) {
					    model.addAttribute("error", 1);
					}
				   
			   }
		   }
	       
	   }
	   
	   @GetMapping("/onClassView")
	   public void onClassView( Class cLass, Model model, HttpSession session) {
		   List<Class> list = mainService.ClassViewList(cLass);
//		   logger.info("list : {}", list);
//	       logger.info("로그인안에 뭐가 있어? : {}", session.getAttribute("isLogin"));

		   model.addAttribute("list",list);
		   model.addAttribute("isLogin", session.getAttribute("isLogin"));
		   
	   }
	   
	   @GetMapping("/offClassView")
	   public void offClassView( Class cLass, Model model, HttpSession session, @Value("${spring.datasource.apikey}") String apikey) {
		   List<Class> list = mainService.ClassViewList(cLass);
		   Address address = mainService.getAddress(cLass);
//		   logger.info("address : {}", address);
		   model.addAttribute("apikey", apikey);
		   model.addAttribute("address",address);
		   model.addAttribute("list",list);
		   model.addAttribute("isLogin", session.getAttribute("isLogin"));
		   
	   }
	   
	   @PostMapping("/basket")
	   @ResponseBody
	   public Map<String, String> basket(String buttonType, Class cLass, HttpSession session) {
	       logger.info("버튼타입안에 뭐가 있어? : {}", buttonType);
	       logger.info("클래스안에 뭐가 있어? : {}", cLass);
	       logger.info("유저번호안에 뭐가 있어? : {}", session.getAttribute("userNo"));
	       Map<String, String> response = new HashMap<>();
	       
	     //이미 결제한 경우 장바구니 or 클래스 시작하기를 눌렀을 경우
	       boolean duplicationPayment =  mainService.payment(cLass, session);
	       
	       
	       if( duplicationPayment == true ) {
		       int res = mainService.basket(cLass, session);
	
	
		       // ON클래스인데 장바구니 안에 있는 ON클래스와 중복일 경우
		       if ( cLass.getOnOff() == 1 && res == 1 ) {
		           response.put("redirect", "/main/onClassView?classNo=" + cLass.getClassNo());
		           response.put("error", "장바구니에 같은 ON클래스("+cLass.getClassName()+")가 들어있습니다.");
		       }
	
		       // OFF클래스인데 장바구니 안에 있는 OFF클래스와 중복일 경우
		       else if ( cLass.getOnOff() == 0 && res == 1 ) {
		           response.put("redirect", "/main/offClassView?classNo=" + cLass.getClassNo());
		           response.put("error", "장바구니에 같은 OFF클래스("+cLass.getClassName()+")가 들어있습니다.");
		       }
		       
		       // ON클래스인데 장바구니를 눌렀을 경우
		       else if ( cLass.getOnOff() == 1 && buttonType.equals("basket") ) {
		           response.put("redirect", "/main/onClassView?classNo=" + cLass.getClassNo());
		       }
		       
		       // OFF클래스인데 장바구니를 눌렀을 경우
		       else if ( cLass.getOnOff() == 0 && buttonType.equals("basket") ) {
		           response.put("redirect", "/main/offClassView?classNo=" + cLass.getClassNo());
		       }
		       
		       // ON클래스, OFF클래스인데 장바구니안에 있는 ON클래스, OFF클래스가 중복이 아닐 경우(insert 된 경우)
		       // ON클래스, OFF클래스가 클래스 시작하기를 눌렀을 경우
		       else {
		       response.put("redirect", "/payment/basket");
		       }
		       
	       }
	       if( duplicationPayment == false ) {
	    	   
		       // ON클래스인데 결제한 경우
		       if ( cLass.getOnOff() == 1 ) {
		           response.put("redirect", "/main/onClassView?classNo=" + cLass.getClassNo());
		           response.put("error", "이미 결제한 상품입니다.");
		       }
	
		       // OFF클래스인데 결제한 경우
		       else if ( cLass.getOnOff() == 0 ) {
		           response.put("redirect", "/main/offClassView?classNo=" + cLass.getClassNo());
		           response.put("error", "이미 결제한 상품입니다.");
		       }
		       
	       }
	    	   
	       return response;
	   }
	   
	   @GetMapping("/classInfo")
	   @ResponseBody
	   public List<Class> classInfo(Class cLass) {
		   
//		   logger.info("cLass안에 뭐 있어? {}",cLass);
		   
		   List<Class> list = mainService.ClassViewList(cLass);
		   logger.info("list안에 뭐 있어? {}",list);
		   return list;
		   
	   }

}
