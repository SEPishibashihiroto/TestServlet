package Savlet;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.CommonDB;
import common.CommonErrMsg;

/**
 * Servlet implementation class TestInput
 */
@WebServlet("/TestLoginSavlet")
public class TestLoginSavlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommonErrMsg commonerrmsg;
	CommonDB commomdb;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestLoginSavlet() {
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
		if (!errmsg.isEmpty()) {
			request.setAttribute("errmsg", errmsg);
			getServletContext().getRequestDispatcher("/TestLogin.jsp").forward(request, response);
		}

		String salt = null; //ソルト
		int role_id = 0;
		String user_name = "";
		//DBからアドレスをもとにソルトを取得
		ResultSet rs = CommonDB.getUser(address);
		try {
			rs.next();
			salt = rs.getString("salt");
			role_id = rs.getInt("role_id");
			user_name = rs.getString("user_name");
		} catch (SQLException e1) {
		}

		//ハッシュ化
		String loginKey = null;//ハッシュ化されたパスワードが入ります
		String saltpass = null;//ソルトと入力されたパスワードを結合したものが入ります

		saltpass = salt + password;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[] result = md.digest(saltpass.getBytes());
			loginKey = String.format("%040x", new BigInteger(1, result));
		} catch (Exception e) {
			e.printStackTrace();
		}
		errmsg = CommonErrMsg.getLoginErr(loginKey);
		if (errmsg.isEmpty()) {
			int User_id = CommonDB.getUserId(address, loginKey);
			//セッション！！
			HttpSession session = request.getSession();
			session.setAttribute("User_id", User_id);
			session.setAttribute("role_id", role_id);
			session.setAttribute("user_name", user_name);
			getServletContext().getRequestDispatcher("/TestListSavlet").forward(request, response);
		} else {
			request.setAttribute("address", address);
			request.setAttribute("password", password);
			request.setAttribute("errmsg", errmsg);
			getServletContext().getRequestDispatcher("/TestLogin.jsp").forward(request, response);
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
