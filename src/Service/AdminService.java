package Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.AdminDao;
import Model.Admin;
@Service
public class AdminService {
	@Autowired
	private AdminDao adminDao;
	
    public Admin getAdmin(Admin admin) {
		return adminDao.getAdmin(admin);
	}
}
