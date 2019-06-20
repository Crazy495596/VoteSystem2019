package Controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import Model.Admin;
import Model.ResultMsg;
import Service.AdminService;

@Controller
public class LoginController {
	@Autowired
	private AdminService adminService;
	
		@RequestMapping("/login")
		public ModelAndView Login() {
			ModelAndView mView=new ModelAndView("login");
			return mView;
		}
		////dsadkjlfkjladsf
		@RequestMapping("/login_submit")
		public ModelAndView Login_submit() {
			ModelAndView mView=new ModelAndView("login_submit");
			return mView;    
		}
		
		
			@RequestMapping("/vote")
		public ModelAndView vote() {
			ModelAndView mView=new ModelAndView("/vote");
			return mView;
		}
		
			
			@RequestMapping("/index")
		public ModelAndView index() {
			ModelAndView mView=new ModelAndView("index");
			return mView;
		}
		
		@RequestMapping("/welcome")
		public ModelAndView welcome() {
			ModelAndView mView=new ModelAndView("welcome");
			return mView;
		}
		
		@RequestMapping("/role_list")
		public ModelAndView role_list() {
			ModelAndView mView=new ModelAndView("role_list");
			return mView;
		}
			
		
	
}
