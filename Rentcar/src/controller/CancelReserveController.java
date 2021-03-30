package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CancelReserveService;

/**
 * Servlet implementation class CancelReserveController
 */
@WebServlet("/cancelReserve")
public class CancelReserveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelReserveController() {
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
		request.setCharacterEncoding("UTF-8");
		PrintWriter out;
		int cancelNum = Integer.parseInt(request.getParameter("renum"));
		CancelReserveService cancelReservesvc = new CancelReserveService();
		int cancelResult = cancelReservesvc.reserveCancel(cancelNum);
		if(cancelResult > 0) {
			response.sendRedirect("/Rentcar2/rentcar/myReserve");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			out = response.getWriter();
			out.println("<script>");
			out.println("alert('예약 취소 실패')");
			//out.println("history.back()"); 새로운 창 띄우는 거 아니면 뒤로가기 필요없을듯
			out.println("</script>");
		}
		
	}
}
