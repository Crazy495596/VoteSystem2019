package Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import Dao.PkMessageDao;
import Model.Fenye;
import Model.Pk;
import Model.PkMessage;
import Model.ResultMsg;
import Model.Singer;
import Model.VoteMessage;
import Service.PkMessageService;
@Controller
public class PkMessageController {
	@Autowired
	private PkMessageService pkmservice;
	@Autowired
	private PkMessageDao pmdao;
	
	@RequestMapping("/add_pk_message")
	public ModelAndView add_pk_message(Integer pages) {
		if(pages==null) {
			pages=0;
		}
		
		ModelAndView mView = new ModelAndView("add_pk_message");
		List<Pk> pklist=pkmservice.getPkList();
		List<Singer> singerlist=pkmservice.getSingerList();
		List<VoteMessage> pkmessagelist=pkmservice.getVoteMessageList(pages*6);
		
		Integer total= pmdao.Getsunpm();
		Integer totalPage=(int) Math.floor(total/6);
		
		Fenye fenye=new Fenye();
		fenye.setPage(pages);
		fenye.setTotalpage(totalPage);
		
		
		mView.addObject("pklist", pklist);
		mView.addObject("singerlist", singerlist);
		mView.addObject("pkmessagelist", pkmessagelist);
		mView.addObject("fenye", fenye);
		return mView;
	}
	
	@ResponseBody
	@RequestMapping("/create_pkmessae")
	public ResultMsg create_pkmessae(Integer messPkid,Integer messSingerid,String messMusic) {
		ResultMsg resultMsg=null;
		System.out.println(messPkid+messSingerid+messMusic);
		PkMessage pkmess=new PkMessage();
		pkmess.setMessPkid(messPkid);
		pkmess.setMessSingerid(messSingerid);
		pkmess.setMessMusic(messMusic);
		
		Integer i=pkmservice.CreatePkmess(pkmess);
		if(i>0) {
			resultMsg=new ResultMsg(1,"添加成功");
		}else{
			resultMsg=new ResultMsg(1,"添加失败");
		}
		return resultMsg;
	}
	
}
