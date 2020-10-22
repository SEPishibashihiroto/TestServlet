package Savlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonDB;

/**
 * Servlet implementation class TestListSavlet
 */
@WebServlet("/TestListSavlet")
public class TestListSavlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestListSavlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int user_id = (int) request.getSession().getAttribute("User_id");
		int nowPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		int limitSta = (nowPage - 1) * 10;
		ResultSet rs = CommonDB.getTransitListAll(limitSta, user_id);
		int maxPage = CommonDB.getTransitListCnt(user_id) % 10 == 0 ? CommonDB.getTransitListCnt(user_id) / 10
				: (CommonDB.getTransitListCnt(user_id) / 10) + 1;

		request.setAttribute("page", nowPage);
		request.setAttribute("rs", rs);
		request.setAttribute("maxPage", maxPage);

		getServletContext().getRequestDispatcher("/TestList.jsp").forward(request, response);
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
