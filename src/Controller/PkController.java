package Controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import Dao.PkDao;
import Dao.PkMessageDao;
import Model.Fenye;
import Model.Pk;
import Model.PkMessage;
import Model.ResultMsg;
import Model.Voteshow;
import Service.PkService;

@Controller
public class PkController {
	@Autowired
	private PkService pkService;
	@Autowired
	private PkDao dao;
	@Autowired
	private PkMessageDao pmdao;
	
	@RequestMapping("/create_pk")
	public ModelAndView create_vote(Integer pages) {
		if(pages==null) {
			pages=0;
		}
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
	public ResultMsg create_vote1(String pkName,String pkType,Integer pkTurn,Integer pkId) {
		ResultMsg reMsg=null;
		if(pkId==null) {
			
			Pk pk=new Pk();
			pk.setPkName(pkName);
			pk.setPkTurn(pkTurn);
			pk.setPkStatus("等待");
			pk.setPkType(pkType);
			int i=pkService.CreatePk(pk);
		
			if(i>0) {

				List<PkMessage> list=dao.adddturn2(pkId);
				Integer pkId2=dao.adddturn1();
				
				for(PkMessage pm:list) {
					pm.setMessPkid(pkId2);
					pmdao.CreatePkmess(pm);	
					
				}
				reMsg=new ResultMsg(0,"添加成功");
				
				 
			}
			
		}else {
			

			Integer ii=dao.yesnopkmess(pkId);
			if(ii>1) {
				System.out.println(pkId+pkName+pkType+pkTurn);
				
				Pk pk=new Pk();
				pk.setPkName(pkName);
				pk.setPkTurn(pkTurn);
				pk.setPkStatus("等待");
				pk.setPkType(pkType);
				int i=pkService.CreatePk(pk);
			
				if(i>0) {

					List<PkMessage> list=dao.adddturn2(pkId);
					Integer pkId2=dao.adddturn1();
					
					for(PkMessage pm:list) {
						pm.setMessPkid(pkId2);
						pmdao.CreatePkmess(pm);	
						
					}
					reMsg=new ResultMsg(0,"添加成功");
					
					 
				}else {
					 reMsg=new ResultMsg(1,"添加失败");
				}
			}
			else {
				reMsg=new ResultMsg(0,"参与人数不足，至少两人");
			}
			
			
			
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
		ResultMsg reMsg=null;
		Integer ii=dao.yesnopkmess(pkId);
		if(ii>1) {
			System.out.println(pkStatus+pkId);
			
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
		}else {
			reMsg=new ResultMsg(0,"参与人数不足，至少两人");
		}
		
		
		return reMsg;
		
	}
	
	
	@RequestMapping("/voteshow")
	public ModelAndView voteshow(Integer pkId) {
		List<Voteshow> list=dao.voteshow(pkId);
		
		ModelAndView mView=new ModelAndView("voteshow");
		mView.addObject("Voteshowlist", list) ;
		return mView;
	}
	
	

}
