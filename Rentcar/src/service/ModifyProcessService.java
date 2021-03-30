package service;

import dao.RentcarDAO;
import dto.RentcarDTO;

import static db.JdbcUtil.*;
import java.sql.Connection;

public class ModifyProcessService {

	public int reserveModify(RentcarDTO reserveModify) {
		RentcarDAO dao = RentcarDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		int modifyResult = dao.reserveModify(reserveModify);
		if(modifyResult > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return modifyResult;
	}

}
