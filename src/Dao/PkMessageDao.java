package Dao;

import java.util.List;

import Model.Pk;
import Model.PkMessage;
import Model.Singer;
import Model.VoteMessage;

public interface PkMessageDao {
	List<Pk> getPkList();
	List<Singer> getSingerList();
	List<VoteMessage> getVoteMessageList();
	
	Integer CreatePkmess(PkMessage pkmess);

}
