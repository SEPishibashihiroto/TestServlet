
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonAddData;
import common.CommonDB;
import common.CommonErrMsg;
import common.CommonUpdData;

/**
 * Servlet implementation class InputTest2
 */
@WebServlet("/InputTest2")
public class InputTest2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InputTest2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String day = (String) request.getParameter("day");
		String route_no = (String) request.getParameter("route");
		String transit_no = (String) request.getParameter("transit");
		String from_st = (String) request.getParameter("from_st");
		String to_st = (String) request.getParameter("to_st");
		String price = (String) request.getParameter("price");

		int user_id = 1;

		request.setAttribute("day", day);
		request.setAttribute("route", route_no);
		request.setAttribute("transit", transit_no);
		request.setAttribute("from_st", from_st);
		request.setAttribute("to_st", to_st);
		request.setAttribute("price", price);

		CommonUpdData data = new CommonUpdData(68, day, route_no, transit_no, from_st, to_st, price, user_id);
		CommonAddData data2 = new CommonAddData(day, route_no, transit_no, from_st, to_st, price, user_id);

		String errmsg = CommonErrMsg.getErrMsg(data);

		if (errmsg.equals("")) {
			CommonDB.updateDB(data);
			getServletContext().getRequestDispatcher("/OK.jsp").forward(request, response);
		} else {
			request.setAttribute("errmsg", errmsg);
			getServletContext().getRequestDispatcher("/TestInput2.jsp").forward(request, response);
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
