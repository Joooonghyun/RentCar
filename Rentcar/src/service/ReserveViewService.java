package service;

import dao.RentcarDAO;
import dto.RentcarDTO;

import static db.JdbcUtil.*;
import java.sql.*;

public class ReserveViewService {

	public RentcarDTO reserveView(int renum) {
		RentcarDAO dao = RentcarDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		RentcarDTO reserveView = dao.reserveView(renum);
		close(con);
		return reserveView;
	}

}
