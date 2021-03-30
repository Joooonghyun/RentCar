package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.RentcarDTO;
import service.ModifyProcessService;

/**
 * Servlet implementation class ModifyProcessController
 */
@WebServlet("/reserveModifyProcess")
public class ModifyProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyProcessController() {
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
		RentcarDTO reserveModify = new RentcarDTO();
		int modifyNum = Integer.parseInt(request.getParameter("renum"));
		reserveModify.setRenum(modifyNum);
		reserveModify.setLocations(request.getParameter("locations"));
		reserveModify.setStarts(Date.valueOf(request.getParameter("starts")));
		reserveModify.setStarttime(request.getParameter("starttime"));
		reserveModify.setEnds(Date.valueOf(request.getParameter("ends")));
		reserveModify.setEndtime(request.getParameter("endtime"));
		reserveModify.setVariety(request.getParameter("variety"));
		reserveModify.setInsurance(request.getParameter("insurance"));
		
		ModifyProcessService modifyProcesssvc = new ModifyProcessService();
		int modifyResult = modifyProcesssvc.reserveModify(reserveModify);
		if(modifyResult > 0) {
			response.sendRedirect("reserveView?renum=" + modifyNum);
		}
		
	}
}
