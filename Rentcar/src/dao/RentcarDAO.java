package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.RentcarDTO;

import static db.JdbcUtil.*;

public class RentcarDAO {
	private static RentcarDAO dao;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public static RentcarDAO getInstance() {
		if(dao==null) {
			dao = new RentcarDAO();
		} 
		return dao;
	}
	public void setConnection(Connection con) {
		this.con = con;
	}
	public int reserve(RentcarDTO rcDTO) {
		String sql = "INSERT INTO KWH.RENTCAR VALUES(?,?,?,?,?,?,?,?,?)";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rcDTO.getLocations());
			pstmt.setDate(2, rcDTO.getStarts());
			pstmt.setString(3, rcDTO.getStarttime());
			pstmt.setDate(4, rcDTO.getEnds());
			pstmt.setString(5, rcDTO.getEndtime());
			pstmt.setString(6, rcDTO.getVariety());
			pstmt.setString(7, rcDTO.getReid());
			pstmt.setString(8, rcDTO.getInsurance());
			pstmt.setInt(9, rcDTO.getRenum());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public ArrayList<RentcarDTO> myReserve(String reid) {
		String sql = "SELECT * FROM KWH.RENTCAR WHERE REID = ?";
		ArrayList<RentcarDTO> myReserve = new ArrayList<RentcarDTO>();
		RentcarDTO rcDTO = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rcDTO = new RentcarDTO();
				rcDTO.setLocations(rs.getString("LOCATIONS"));
				rcDTO.setStarts(rs.getDate("STARTS"));
				rcDTO.setStarttime(rs.getString("STARTTIME"));
				rcDTO.setEnds(rs.getDate("ENDS"));
				rcDTO.setEndtime(rs.getString("ENDTIME"));
				rcDTO.setVariety(rs.getString("VARIETY"));
				rcDTO.setReid(rs.getString("REID"));
				rcDTO.setInsurance(rs.getString("INSURANCE"));
				rcDTO.setRenum(rs.getInt("RENUM"));
				myReserve.add(rcDTO);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return myReserve;
	}
	public int getrenum() {
		String sql = "SELECT MAX(RENUM) FROM KWH.RENTCAR";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public int cancelReserve(int cancelNum) {
		String sql = "DELETE FROM KWH.RENTCAR WHERE RENUM = ?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cancelNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public RentcarDTO reserveView(int modifyNumber) {
		String sql = "SELECT * FROM KWH.RENTCAR WHERE RENUM = ?";
		RentcarDTO rcDTO = new RentcarDTO();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, modifyNumber);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rcDTO.setLocations(rs.getString("LOCATIONS"));
				rcDTO.setStarts(rs.getDate("STARTS"));
				rcDTO.setStarttime(rs.getString("STARTTIME"));
				rcDTO.setEnds(rs.getDate("ENDS"));
				rcDTO.setEndtime(rs.getString("ENDTIME"));
				rcDTO.setVariety(rs.getString("VARIETY"));
				rcDTO.setReid(rs.getString("REID"));
				rcDTO.setInsurance(rs.getString("INSURANCE"));
				rcDTO.setRenum(rs.getInt("RENUM"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return rcDTO;
	}
	public int reserveModify(RentcarDTO reserveModify) {
		String sql = "UPDATE KWH.RENTCAR SET LOCATIONS=?,STARTS=?,"
				+ "STARTTIME=?,ENDS=?,ENDTIME=?,VARIETY=?,INSURANCE=? "
				+ "WHERE RENUM=?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reserveModify.getLocations());
			pstmt.setDate(2, reserveModify.getStarts());
			pstmt.setString(3, reserveModify.getStarttime());
			pstmt.setDate(4, reserveModify.getEnds());
			pstmt.setString(5, reserveModify.getEndtime());
			pstmt.setString(6, reserveModify.getVariety());
			pstmt.setString(7, reserveModify.getInsurance());
			pstmt.setInt(8, reserveModify.getRenum());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public ArrayList<RentcarDTO> reserveList(String userid) {
		String sql = "SELECT * FROM KWH.RENTCAR WHERE REID = ?";
		ArrayList<RentcarDTO> reserveList = new ArrayList<RentcarDTO>();
		RentcarDTO rcDTO = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rcDTO = new RentcarDTO();
				rcDTO.setLocations(rs.getString("LOCATIONS"));
				rcDTO.setStarts(rs.getDate("STARTS"));
				rcDTO.setStarttime(rs.getString("STARTTIME"));
				rcDTO.setEnds(rs.getDate("ENDS"));
				rcDTO.setEndtime(rs.getString("ENDTIME"));
				rcDTO.setVariety(rs.getString("VARIETY"));
				rcDTO.setReid(rs.getString("REID"));
				rcDTO.setInsurance(rs.getString("INSURANCE"));
				rcDTO.setRenum(rs.getInt("RENUM"));
				reserveList.add(rcDTO);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reserveList;
	}

}
