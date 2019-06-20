package Controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import Dao.PkDao;
import Model.Fenye;
import Model.Pk;
import Model.ResultMsg;
import Service.PkService;

@Controller
public class PkController {
	@Autowired
	private PkService pkService;
	@Autowired
	private PkDao dao;
	
	@RequestMapping("/create_pk")
	public ModelAndView create_vote(Integer pages) {
		System.out.println("当前页"+pages);
		List<Pk> pklist=pkService.GetPklist(pages*6);
		
		Integer total= dao.GetTotalPage();
		System.out.println(total);
		
	
		Integer totalPage=(int) Math.floor(total/6);
		System.out.println(totalPage);
		
		Fenye fenye=new Fenye();
		fenye.setPage(pages);
		fenye.setTotalpage(totalPage);
		
	
		ModelAndView ModelAndView = new ModelAndView("create_pk");
		ModelAndView.addObject("Pklist", pklist);
		ModelAndView.addObject("fenye", fenye);
		
		
		return ModelAndView;	
	}
	
	

	@ResponseBody
	@RequestMapping(value = "/Create_pk2",method = {RequestMethod.POST })
	public ResultMsg create_vote1(String pkName,String pkType,Integer pkTurn) {
		Pk pk=new Pk();
		pk.setPkName(pkName);
		pk.setPkTurn(pkTurn);
		pk.setPkStatus("等待");
		pk.setPkType(pkType);
		
		int i=pkService.CreatePk(pk);
		ResultMsg reMsg=null;
		if(i>0) {
			 reMsg=new ResultMsg(0,"添加成功");
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
	
	@ResponseBody
	@RequestMapping(value = "/updatsStatus",method = {RequestMethod.GET })
	public ResultMsg updatsStatus(String pkStatus,Integer pkId) {
		System.out.println(pkStatus+pkId);
		ResultMsg reMsg=null;
		Pk pk=pkService.repeat();
		if(pk!=null) {
			if(pk.getPkId()==pkId) {
				Pk pk1=new Pk();
				pk1.setPkId(pkId);
				pk1.setPkStatus(pkStatus);
				Integer i=pkService.updateStatus(pk1);
				if(i>0) {
					reMsg=new ResultMsg(1,"添加成功");
				}else {
					reMsg=new ResultMsg(1,"添加成功");
				}
							
			}else {
				reMsg=new ResultMsg(0,pk.getPkName()+"投票还未结束");
			}	
		}
		else {
			Pk pk1=new Pk();
			pk1.setPkId(pkId);
			pk1.setPkStatus(pkStatus);
			Integer i=pkService.updateStatus(pk1);
			if(i>0) {
				reMsg=new ResultMsg(1,"添加成功");
			}else {
				reMsg=new ResultMsg(1,"添加成功");
			}
		}
		return reMsg;
		
	}
	
	

}
