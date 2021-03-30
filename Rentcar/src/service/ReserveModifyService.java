package service;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.RentcarDAO;
import dto.RentcarDTO;

public class ReserveModifyService {

	public RentcarDTO reserveModify(int modifyNumber) {
		RentcarDAO dao = RentcarDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		RentcarDTO reserveModify = dao.reserveView(modifyNumber);
		close(con);
		return reserveModify;
	}

}
