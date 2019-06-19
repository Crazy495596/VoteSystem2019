package Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.PkDao;
import Model.Pk;

@Service
public class PkService {
	@Autowired
	private PkDao pkdao;
	
	public  Integer CreatePk(Pk pk) {
		int i=0;
		i=pkdao.CreatePk(pk);
		return i;
		
	}
	
	public List<Pk> GetPklist(Integer limit){
		List<Pk> pk=pkdao.GetPklist(limit);
		return pk;
	};

}
