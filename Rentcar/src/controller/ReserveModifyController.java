package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.RentcarDTO;
import service.ReserveListService;
import service.ReserveModifyService;

/**
 * Servlet implementation class ReserveModifyController
 */
@WebServlet("/reserveModify")
public class ReserveModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveModifyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request,response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		int modifyNumber = Integer.parseInt(request.getParameter("renum"));
		ReserveModifyService reserveModifysvc = new ReserveModifyService();
		RentcarDTO reserveModify = reserveModifysvc.reserveModify(modifyNumber);
		request.setAttribute("reserveModify", reserveModify);
		
		ReserveListService reserveListsvc = new ReserveListService();
		ArrayList<RentcarDTO> reserveList = reserveListsvc.reserveList(userid);
		request.setAttribute("reserveView", reserveList);
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Main.jsp");
		dispatcher.forward(request, response);
	}

}
