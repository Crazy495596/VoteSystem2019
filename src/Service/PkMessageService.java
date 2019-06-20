package Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.PkMessageDao;
import Model.Pk;
import Model.PkMessage;
import Model.Singer;
import Model.VoteMessage;

@Service
public class PkMessageService {
	@Autowired
	private PkMessageDao pkMessageDao;
	
	public List<Pk> getPkList(){
		List<Pk> list=pkMessageDao.getPkList();
		return list;
	}
	
	public List<Singer> getSingerList(){
		List<Singer> list=pkMessageDao.getSingerList();
		return list;
	}
	

	public List<VoteMessage> getVoteMessageList(){
		List<VoteMessage> list=pkMessageDao.getVoteMessageList();
		return list;
	}
	
	
	
	public Integer CreatePkmess(PkMessage pkmess) {
		Integer i=pkMessageDao.CreatePkmess(pkmess);
		return i;
	}

}
