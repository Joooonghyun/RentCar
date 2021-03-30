package service;

import java.util.ArrayList;
import static db.JdbcUtil.*;

import dao.RentcarDAO;
import dto.RentcarDTO;

import java.sql.*;

public class ReserveListService {

	public ArrayList<RentcarDTO> reserveList(String userid) {
		RentcarDAO dao = RentcarDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		ArrayList<RentcarDTO> reserveList = dao.reserveList(userid);
		close(con);
		return reserveList;
	}

}
