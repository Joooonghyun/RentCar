package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.RentcarDTO;

/**
 * Servlet implementation class ReserveCarController
 */
@WebServlet("/rentcarView")
public class ReserveCarController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReserveCarController() {
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
//		response.getWriter().append("Served at: ").append(request.getContextPath());
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
//		Main.jsp에서 입력한 정보를(장소, 시간 등) car.jsp로 전해주기 위해 사용하는 servlet
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		RentcarDTO rcDTO = new RentcarDTO();

		String locations = request.getParameter("locations");
		Date starts = Date.valueOf(request.getParameter("starts"));
		String starttime = request.getParameter("starttime");
		Date ends = Date.valueOf(request.getParameter("ends"));
		String endtime = request.getParameter("endtime");

		rcDTO.setLocations(locations);
		rcDTO.setStarts(starts);
		rcDTO.setStarttime(starttime);
		rcDTO.setEnds(ends);
		rcDTO.setEndtime(endtime);
		rcDTO.setReid(userid);
		System.out.println(rcDTO.getStarts());
		request.setAttribute("rcDTO", rcDTO);
		System.out.println("처음 넘어갈때" + rcDTO);
				
		RequestDispatcher dispatcher = request.getRequestDispatcher("car.jsp");
		dispatcher.forward(request, response);
	}
}
