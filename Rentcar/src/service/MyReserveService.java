package service;

import java.sql.Connection;
import java.util.ArrayList;
import static db.JdbcUtil.*;

import dao.RentcarDAO;
import dto.RentcarDTO;

public class MyReserveService {

	public ArrayList<RentcarDTO> myReserve(String reid) {
		RentcarDAO dao = RentcarDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		ArrayList<RentcarDTO> myReserve = new ArrayList<RentcarDTO>();
		myReserve = dao.myReserve(reid);
		close(con);
		return myReserve;
	}

}
