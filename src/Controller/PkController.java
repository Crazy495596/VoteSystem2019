package Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import Model.Pk;
import Model.ResultMsg;
import Service.PkService;

@Controller
public class PkController {
	@Autowired
	private PkService pkService;
	
	@RequestMapping("/create_pk")
	public ModelAndView create_vote() {
		List<Pk> pk=pkService.GetPklist(0);
		ModelAndView ModelAndView = new ModelAndView("create_pk");
		ModelAndView.addObject("Pklist", pk);
		return ModelAndView;	
	}

	@ResponseBody
	@RequestMapping(value = "/Create_pk2",method = {RequestMethod.POST })
	public ResultMsg create_vote1(String pkName,String pkType) {
		Pk pk=new Pk();
		pk.setPkName(pkName);
		pk.setPkTurn(1);
		pk.setPkStatus("等待");
		pk.setPkType(pkType);
		int i=pkService.CreatePk(pk);
		ResultMsg reMsg=null;
		if(i>0) {
			 reMsg=new ResultMsg(1,"添加成功");
		}else {
			 reMsg=new ResultMsg(1,"添加失败");
		}
		return reMsg;
		
	}
	
	
	
	@RequestMapping(value = "/GetPklist",method = {RequestMethod.POST })
	public ModelAndView GetPklist(Integer limit) {
		List<Pk> pk=pkService.GetPklist(limit);
		ModelAndView ModelAndView = new ModelAndView("create_pk");
		ModelAndView.addObject("Pklist", pk);
		return ModelAndView;		
	}

}
