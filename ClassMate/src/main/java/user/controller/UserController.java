package user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import teacher.dto.Teacher;
import user.dto.UserInfo;
import user.service.face.UserService;
@Controller
@RequestMapping("/user")
public class UserController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired UserService userService;
	
	@RequestMapping("/main")
	public void main() {}
	
	@GetMapping("/searchIdPw")
	public void searchIdPw() {}
	
	@GetMapping("/join")
	public void join() {}
	
	@GetMapping("joinOk")
	public void joinOk() {}
	
	@PostMapping("/join")
	public String joinPost(UserInfo userInfo) {
		logger.info("param : {}", userInfo);
		
		userService.join( userInfo );
		
		return "redirect:./main";
	}
	
	@GetMapping("/login")
	public void login() {
		logger.info("test");
	}
	
	@PostMapping("/login")
	public String loginPost( UserInfo userInfo, Model model, HttpSession session, Teacher teacher ) {
		logger.info("param : {}", userInfo);
		
		UserInfo loginInfo = userService.loginPost( userInfo );
		logger.info("loginInfo : {}", loginInfo);
		
		//강사 번호
		teacher.setUserNo(loginInfo.getUserNo()); //강사 번호
		Teacher teacherNo = userService.getTeacherNo(teacher); //강사 번호
		
		if( loginInfo != null ) {
			//일반회원 로그인
			if( loginInfo.getUserNo() != 0 ) {
				boolean isLogin = true;
				session.setAttribute("isLogin", isLogin);
				session.setAttribute("userId", loginInfo.getUserId());
				session.setAttribute("teacherNo", teacherNo.getTeacherNo()); //강사 번호
				
			} else if( loginInfo.getUserNo() == 0 ) { //관리자 로그인
				boolean isLogin = true;
				session.setAttribute("isLogin", isLogin);
				session.setAttribute("ADMIN", "ADMIN");
				session.setAttribute("userId", loginInfo.getUserId());
				
				return "redirect:/admin/main";
			}
			
		} else { //로그인 실패
			session.invalidate();
		}
		
		return "redirect:/main/main";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/main/main";
	}
}
