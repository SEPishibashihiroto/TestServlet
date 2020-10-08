
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonErrMsg;

/**
 * Servlet implementation class TestInput
 */
@WebServlet("/InputTest1")
public class InputTest1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InputTest1() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String address;
		String password;
		String errmsg;

		address = (String) request.getParameter("address");
		password = (String) request.getParameter("password");
		errmsg = CommonErrMsg.getLoginErr(address, password);

		request.setAttribute("address", address);
		request.setAttribute("password", password);
		request.setAttribute("errmsg", errmsg);

		if (errmsg.equals("")) {
			getServletContext().getRequestDispatcher("/OK.jsp").forward(request, response);
		} else {
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
