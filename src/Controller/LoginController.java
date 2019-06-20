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
		
		 @RequestMapping("/login_submit")
		 @ResponseBody
		    public ResultMsg login_content(@RequestParam String username, @RequestParam String password) {
		        //ÒµÎñÂß¼­
		        Admin admin=new Admin();
		        admin.setAdminName(username);
		        admin.setPassword(password);
		       
		        Admin admin2 = adminService.getAdmin(admin);
		        if(admin2!=null){
		   		 	return new ResultMsg(1,"µÇÂ½³É¹¦£¡"); 
		   		 }else{
		   			return new ResultMsg(0,"µÇÂ½Ê§°Ü£¡");
		   		 }
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
