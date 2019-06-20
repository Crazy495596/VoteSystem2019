package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
		@RequestMapping("/login")
		public ModelAndView Login() {
			ModelAndView mView=new ModelAndView("login");
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
		
		@RequestMapping("/pkshow")
		public ModelAndView pkshow() {
			ModelAndView mView=new ModelAndView("pkshow");
			return mView;
		}
			
		
	
}
