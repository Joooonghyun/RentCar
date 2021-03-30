package service;

import java.sql.Connection;
import static db.JdbcUtil.*;

import dao.RentcarDAO;
import dto.RentcarDTO;

public class ReserveService {

	public int reserve(RentcarDTO rcDTO) {
		RentcarDAO dao = RentcarDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		int renum = dao.getrenum() + 1;
		rcDTO.setRenum(renum);
		
		int reserveResult = dao.reserve(rcDTO);
		if(reserveResult > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return reserveResult;
	}

}
