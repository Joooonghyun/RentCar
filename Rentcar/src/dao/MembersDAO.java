package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import dto.MembersDTO;
import static db.JdbcUtil.*;

public class MembersDAO {
   private static MembersDAO dao;
   Connection con;
   PreparedStatement pstmt;
   ResultSet rs;

   private MembersDAO() {
   };

   public static MembersDAO getInstance() {
      if (dao == null) {
         dao = new MembersDAO();
      }
      return dao;
   }

   public void setConnection(Connection con) {
      this.con = con;

   }

   public String checkId(String uid) {
      String sql = "SELECT USERID FROM KWH.MEMBERS WHERE USERID = ?";
      String result = null;
      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, uid);
         rs = pstmt.executeQuery();
          if(rs.next()) {
             result = rs.getString(1);
          }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      return result;
   }

public int membersJoin(MembersDTO memberJoin) {
	String sql = "INSERT INTO KWH.MEMBERS VALUES(?,?,?,?,?)";
	int result = 0;
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, memberJoin.getUserid());
		pstmt.setString(2, memberJoin.getUserpw());
		pstmt.setString(3, memberJoin.getUsername());
		pstmt.setDate(4, memberJoin.getUserbirth());
		pstmt.setString(5, memberJoin.getUserpnum());
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		close(pstmt); // pstmt 객체 닫기
		/*
		 * try { pstmt.close(); } catch(SQLException e) { e.printStackTrace(); }
		 */
	}

	return result;

}

public String membersLogin(String userid, String userpw) {
	String sql = "SELECT USERID FROM KWH.MEMBERS WHERE USERID=? AND USERPW=?";
	String loginid = null;
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, userpw);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			loginid = rs.getString("USERID");
		} else {
			loginid = null;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		close(rs);
		close(pstmt);
	}

	return loginid;
}

public MembersDTO membersView(String userid) {
	  String sql = "SELECT * FROM KWH.MEMBERS WHERE USERID = ? ORDER BY USERNAME ASC";
	  MembersDTO memberInfo = new MembersDTO();
      
      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, userid);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            memberInfo.setUserid(rs.getString("USERID"));
            memberInfo.setUserpw(rs.getString("USERPW"));
            memberInfo.setUsername(rs.getString("USERNAME"));
            memberInfo.setUserbirth(rs.getDate("USERBIRTH"));
            memberInfo.setUserpnum(rs.getString("USERPNUM"));
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }
      return memberInfo;
   }

public int membersModify(MembersDTO membersModify) {
	String sql = "UPDATE KWH.MEMBERS SET USERPW = ?, USERBIRTH = ?, USERNAME = ?, USERPNUM = ? WHERE USERID = ?";
	int modifyResult = 0;
	
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,membersModify.getUserpw());
        pstmt.setDate(2, membersModify.getUserbirth());
		pstmt.setString(3, membersModify.getUsername());
        pstmt.setString(4, membersModify.getUserpnum());
        pstmt.setString(5, membersModify.getUserid());
        modifyResult = pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	
	return modifyResult;
}

public int membersDelete(String delid) {
	String sql = "DELETE FROM KWH.MEMBERS WHERE USERID=?";
	int delResult = 0;
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,delid);
		delResult = pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}  finally {
		close(pstmt);
	}
	
	return delResult;
}



}