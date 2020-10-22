package Savlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonAddData;
import common.CommonDB;

/**
 * Servlet implementation class TestInputCheckSavlet
 */
@WebServlet("/TestInputCheckSavlet")
public class TestInputCheckSavlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestInputCheckSavlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CommonAddData data = (CommonAddData) request.getSession().getAttribute("data");
		request.getSession().removeAttribute("data");
		if (!(CommonDB.checkTransitData(data.getTransit_no(), data.getFrom_st(),
				data.getTo_st(), data.getPrice(), data.getUser_id()))) {
			CommonDB.addTransitData(data.getTransit_no(), data.getFrom_st(),
					data.getTo_st(), data.getPrice(), data.getUser_id());
		}
		CommonDB.addDB(data);
		getServletContext().getRequestDispatcher("/TestListSavlet").forward(request, response);
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
