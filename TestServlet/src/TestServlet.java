
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonDB;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("route", CommonDB.getRouteAll());

		request.setAttribute("transit", CommonDB.getTransitAll());

		request.setAttribute("transist_data", CommonDB.getTransitDataAll("", "", ""));

		request.setAttribute("count", CommonDB.getTransitDataCnt("", "", ""));

		request.setAttribute("transist_list", CommonDB.getTransitListAll());

		request.setAttribute("user", CommonDB.getUser("ishibashihiroto1196", "test"));

		request.setAttribute("user_category", CommonDB.getUserCategoryAll());

		String text1 = "ishibashihiroto1196は存在してますか?" + CommonDB.isUser("ishibashihiroto1196", "test");
		String text2 = "ishibashihiroto1197は存在してますか?" + CommonDB.isUser("ishibashihiroto1197", "test");
		request.setAttribute("text1", text1);
		request.setAttribute("text2", text2);
		getServletContext().getRequestDispatcher("/TestDisplay.jsp").forward(request, response);
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
