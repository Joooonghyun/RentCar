package service;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.RentcarDAO;

public class CancelReserveService {

	public int reserveCancel(int cancelNum) {
		RentcarDAO dao = RentcarDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		int cancelResult = dao.cancelReserve(cancelNum);
		if(cancelResult > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return cancelResult;
	}

}
