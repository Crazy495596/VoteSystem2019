package Dao;

import java.util.List;

import Model.Pk;

public interface PkDao {
	Integer CreatePk(Pk pk);
	List<Pk> GetPklist(Integer limit);

}
