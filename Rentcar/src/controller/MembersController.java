package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dto.MembersDTO;
import dto.RentcarDTO;
import service.MembersService;
import service.ReserveListService;

/**
 * Servlet implementation class MemberController
 */
@WebServlet(value = { "/checkId", "/membersJoin", "/membersLogin", "/membersView", "/modifyProcess", "/membersDelete",
		"/membersLogout" })
public class MembersController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MembersController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MembersService membersService = new MembersService();
		
		switch (request.getServletPath()) {
		
		case "/checkId":
			System.out.println("/members/checkId");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			String uid = request.getParameter("uid");
			String resultMsg = membersService.checkId(uid);
			out.print(resultMsg);
			break;

		case "/membersJoin":
			System.out.println("/members/membersJoin");
			MembersDTO membersJoin = new MembersDTO();
			membersJoin.setUserid(request.getParameter("userid"));
			membersJoin.setUserpw(request.getParameter("userpw"));
			membersJoin.setUsername(request.getParameter("username"));
			membersJoin.setUserpnum(request.getParameter("userpnum"));

			System.out.println(request.getParameter("userbirth"));
			Date userbirth = Date.valueOf(request.getParameter("userbirth"));
			System.out.println(userbirth);
			membersJoin.setUserbirth(userbirth);
			System.out.println(membersJoin.getUserbirth());

			int joinResult = membersService.membersJoin(membersJoin);
			if (joinResult > 0) {
				response.setContentType("text/html; charset = UTF-8");
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원가입 성공')");
				out.println("location.href='Main.jsp'");
				out.println("</script>");
			} else {
				response.setContentType("text/html; charset = UTF-8");
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원가입 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
			break;

		case "/membersLogout":
			System.out.println(request.getServletPath());
			session.invalidate();
			response.sendRedirect("Main.jsp");
			break;

		case "/membersLogin":
			System.out.println("/members/membersLogin");

			String userid = request.getParameter("userid");
			String userpw = request.getParameter("userpw");

			String loginid = membersService.membersLogin(userid, userpw);

			if (loginid != null) {
				session.setAttribute("userid", userid);
				
				// 내 정보
				MembersDTO membersView = new MembersDTO();
				membersView = membersService.membersView(userid);
				session.setAttribute("membersView", membersView);
				
				// 예약 정보
				ReserveListService reserveListsvc = new ReserveListService();
				ArrayList<RentcarDTO> reserveList = reserveListsvc.reserveList(userid);
				request.setAttribute("reserveView", reserveList);
				System.out.println(reserveList);
				RequestDispatcher dispatcher = request.getRequestDispatcher("Main.jsp");
				dispatcher.forward(request, response);

			} else {
				response.setContentType("text/html; charset=UTF-8");
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
			break;

		case "/membersView":
			userid = request.getParameter("userid");
			MembersDTO membersView = new MembersDTO();
			membersView = membersService.membersView(userid);
			request.setAttribute("membersView", membersView);
			System.out.println(membersView.getUserid());
			RequestDispatcher dispatcher = request.getRequestDispatcher("MembersView.jsp");
			dispatcher.forward(request, response);
			break;

		case "/modifyProcess":
			MembersDTO membersModify = new MembersDTO();
			userid = request.getParameter("userid");
			membersModify.setUserid(request.getParameter("userid"));
			membersModify.setUserpw(request.getParameter("usernewpw"));
			membersModify.setUsername(request.getParameter("username"));
			membersModify.setUserbirth(Date.valueOf(request.getParameter("userbirth")));
			membersModify.setUserpnum(request.getParameter("userpnum"));
			int modifyResult = membersService.membersModify(membersModify);
			if (modifyResult > 0) {
				response.sendRedirect("Main.jsp");
			} else {
				response.setContentType("text/html; charset=UTF-8");
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원정보 수정 실패)");
				out.println("history.back()");
				out.println("</script>");
			}

			break;

		case "/membersDelete":
			System.out.println("/members/membersDelete");
			String delid = (String) session.getAttribute("userid");
			System.out.println(delid);
			int delResult = membersService.membersDelete(delid);
			if (delResult > 0) {
				session.invalidate();
				response.sendRedirect("Main.jsp");
			} else {
				response.setContentType("text/html; charset=UTF-8");
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원탈퇴 실패)");
				out.println("history.back()");
				out.println("</script>");
			}
			break;

		}
	}

}
