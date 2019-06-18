package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class PkMessageController {
	
	@RequestMapping("/add_pk_message")
	public ModelAndView add_pk_message() {
		ModelAndView mView = new ModelAndView("add_pk_message");
		return mView;
	}
}
