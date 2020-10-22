package Savlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonAddData;
import common.CommonErrMsg;

/**
 * Servlet implementation class InputTest2
 */
@WebServlet("/TestInputSavlet")
public class TestInputSavlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestInputSavlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String day = (String) request.getParameter("day");
		String route_no = (String) request.getParameter("route_no");
		String transit_no = (String) request.getParameter("transit_no");
		String from_st = (String) request.getParameter("from_st");
		String to_st = (String) request.getParameter("to_st");
		String price = (String) request.getParameter("price");
		int user_id = (int) request.getSession().getAttribute("User_id");
		//CommonUpdData data = new CommonUpdData(68, day, route_no, transit_no, from_st, to_st, price, user_id);
		CommonAddData data = new CommonAddData(day, route_no, transit_no, from_st, to_st, price, user_id);
		String errmsg = CommonErrMsg.getErrMsg(data);
		if (errmsg.isEmpty()) {
			request.setAttribute("data", data);
			getServletContext().getRequestDispatcher("/TestInputCheck.jsp").forward(request, response);
		} else {
			request.setAttribute("errmsg", errmsg);
			getServletContext().getRequestDispatcher("/TestInput.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
