package service;

import static db.JdbcUtil.*;

import java.sql.Connection;
import dao.MembersDAO;
import dto.MembersDTO;

public class MembersService {

	public String checkId(String uId) {
		 MembersDAO dao = MembersDAO.getInstance();
	      Connection con = getConnection();
	      dao.setConnection(con);
	      
	      
	      String resultMsg = null;
	      String chkId = dao.checkId(uId);
	      System.out.println("chkId:"+chkId);
	      if(chkId == null) {
	    	  resultMsg = "OK";
	      }else {
	    	  resultMsg = "NO";
	      }
	      close(con);
		return resultMsg;
	}

	public int membersJoin(MembersDTO membersJoin) {
	      //DB연결
	      MembersDAO dao = MembersDAO.getInstance();
	      Connection con = getConnection();
	      dao.setConnection(con);
	      
	     
	      int joinResult = dao.membersJoin(membersJoin);
	      if(joinResult > 0 ) {
	         commit(con);
	         
	      } else {
	         rollback(con);
	      
	      }
	      close(con);//connection pool 객체를 닫아(반납)주는 코드
	      return joinResult;
	}

	public String membersLogin(String userid, String userpw) {
		  MembersDAO dao = MembersDAO.getInstance();
	      Connection con = getConnection();
	      dao.setConnection(con);
		
		  String loginResult = dao.membersLogin(userid,userpw);
		 
		     
		      close(con);//connection pool 객체를 닫아(반납)주는 코드
		      return loginResult;
	}

	public MembersDTO membersView(String userid) {
		MembersDAO dao = MembersDAO.getInstance();
	    Connection con = getConnection();
	    dao.setConnection(con);

	    MembersDTO  membersView = dao.membersView(userid);
		    close(con);
		    return membersView;
		}

	public int membersModify(MembersDTO membersModify) {
		MembersDAO dao = MembersDAO.getInstance();
	    Connection con = getConnection();
	    dao.setConnection(con);
	    
	    int modifyResult = dao.membersModify(membersModify);
	    if(modifyResult > 0) {
	    	commit(con);
	    }else {
		    rollback(con);
	    }
	    close(con);
	    return modifyResult;
	}

	public int membersDelete(String delid) {
		MembersDAO dao = MembersDAO.getInstance();
	    Connection con = getConnection();
	    dao.setConnection(con);
	    
	    int delResult = dao.membersDelete(delid);
        if(delResult > 0) { 
        	commit(con);
        } else {
     	   rollback(con);
        }
	      close(con);
	      
	      return delResult;
}
		
	
	
	
	
	
}
