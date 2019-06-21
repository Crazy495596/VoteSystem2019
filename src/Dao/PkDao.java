package Dao;

import java.util.List;

import Model.Pk;
import Model.PkMessage;
import Model.Voteshow;

public interface PkDao {
	Integer CreatePk(Pk pk);
	List<Pk> GetPklist(Integer limit);
	Pk repeat();
	Integer updateStatus(Pk pk);
	Integer GetTotalPage();
	List<Voteshow> voteshow(Integer pkId);
	
	Integer adddturn1();
	List<PkMessage> adddturn2(Integer pkId);
	Integer yesnopkmess(Integer pkId);
}
