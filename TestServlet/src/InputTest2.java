
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonErrMsg;

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
		String route = (String) request.getParameter("route");
		String transit = (String) request.getParameter("transit");
		String from_st = (String) request.getParameter("from_st");
		String to_st = (String) request.getParameter("to_st");
		String price = (String) request.getParameter("price");

		request.setAttribute("day", day);
		request.setAttribute("route", route);
		request.setAttribute("transit", transit);
		request.setAttribute("from_st", from_st);
		request.setAttribute("to_st", to_st);
		request.setAttribute("price", price);

		String dayErr = CommonErrMsg.getErrMsg("day", day);
		String routeErr = CommonErrMsg.getErrMsg("route", route);
		String transitErr = CommonErrMsg.getErrMsg("transit", transit);
		String from_stErr = CommonErrMsg.getErrMsg("from_st", from_st);
		String to_stErr = CommonErrMsg.getErrMsg("to_st", to_st);
		String priceErr = CommonErrMsg.getErrMsg("price", price);

		request.setAttribute("dayErr", dayErr);
		request.setAttribute("routeErr", routeErr);
		request.setAttribute("transitErr", transitErr);
		request.setAttribute("from_stErr", from_stErr);
		request.setAttribute("to_stErr", to_stErr);
		request.setAttribute("priceErr", priceErr);

		if (dayErr.equals("") && routeErr.equals("") && transitErr.equals("") && from_stErr.equals("")
				&& to_stErr.equals("") && priceErr.equals("")) {
			getServletContext().getRequestDispatcher("/OK.jsp").forward(request, response);
		} else {
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
