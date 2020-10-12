
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonDB;
import common.CommonErrMsg;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommonErrMsg commonerrmsg;
	CommonDB commomdb;

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
		request.setAttribute("route", commomdb.getRouteAll());

		request.setAttribute("transit", commomdb.getTransitAll());

		request.setAttribute("transist_data", commomdb.getTransitDataAll("", "", "", 1, 0));

		request.setAttribute("count", commomdb.getTransitDataCnt("", "", "", 1));

		request.setAttribute("transist_list", commomdb.getTransitListAll(1, 0));

		request.setAttribute("user", commomdb.getUser("ishibashihiroto1196", "test"));

		request.setAttribute("user_category", commomdb.getUserCategoryAll());

		String text1 = "ishibashihiroto1196は存在してますか?" + commomdb.isUser("test");
		String text2 = "ishibashihiroto1197は存在してますか?" + commomdb.isUser("test");
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
