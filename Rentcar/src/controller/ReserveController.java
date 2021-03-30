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
import com.oreilly.servlet.MultipartRequest;

import dto.RentcarDTO;
import service.ReserveListService;
import service.ReserveService;

/**
 * Servlet implementation class ReservationController
 */
@WebServlet("/reserveClear")
public class ReserveController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReserveController() {
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
//		car.jsp에서 넘겨받은 정보를(장소, 시간, 차종 등) 가지고 예약을 하는 servlet

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		RentcarDTO rcDTO = new RentcarDTO();
		String locations = request.getParameter("locations");
		Date starts = Date.valueOf(request.getParameter("starts"));
		String starttime = request.getParameter("starttime");
		Date ends = Date.valueOf(request.getParameter("ends"));
		String endtime = request.getParameter("endtime");
		String variety = request.getParameter("variety");
		String reid = request.getParameter("reid");
		String insurance = request.getParameter("insurance");

		rcDTO.setLocations(locations);
		rcDTO.setStarts(starts);
		rcDTO.setStarttime(starttime);
		rcDTO.setEnds(ends);
		rcDTO.setEndtime(endtime);
		rcDTO.setVariety(variety);
		rcDTO.setReid(reid);
		if (insurance != null) {
			rcDTO.setInsurance(insurance);
		} else {
			insurance = "미가입";
			rcDTO.setInsurance(insurance);
		}
		ReserveService reservesvc = new ReserveService();
		int reserveResult = reservesvc.reserve(rcDTO);
		System.out.println("두번째 rc" + rcDTO);

		if (reserveResult > 0) {
			ReserveListService reserveListsvc = new ReserveListService();
			ArrayList<RentcarDTO> reserveList = reserveListsvc.reserveList(reid);
			request.setAttribute("reserveView", reserveList);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Main.jsp");
			dispatcher.forward(request, response);

			// session.setAttribute("rcDTO", rcDTO);
			// response.sendRedirect("reserveList");
		}

	}
}
