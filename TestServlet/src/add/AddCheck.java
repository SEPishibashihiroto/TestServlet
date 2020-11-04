package add;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonAddData;
import common.CommonDB;

/**
 * Servlet implementation class AddCheck
 */
@WebServlet("/AddCheck")
public class AddCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		CommonAddData data = (CommonAddData) request.getSession().getAttribute("data");
		request.getSession().removeAttribute("data");

		/** ユーザーID取得 **/
		HttpSession session = request.getSession();
		int user_id = (int) session.getAttribute("User_id");

		CommonDB.addDB(data);

		if (!(CommonDB.checkTransitData(data.getTransit_no(), data.getFrom_st(), data.getTo_st(), data.getPrice(),
				user_id))) {
			CommonDB.addTransitData(data.getTransit_no(), data.getFrom_st(), data.getTo_st(), data.getPrice(), user_id);
		}

		//フォワード
		request.getRequestDispatcher("/List").forward(request, response);

	}

}
