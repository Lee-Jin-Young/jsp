package test.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friend/list")
public class FriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// get방식 요청 시 호출
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<String> list = new ArrayList<>();
		list.add("가");
		list.add("나");
		list.add("다");
		list.add("라");
		list.add("마");

		request.setAttribute("list", list);

		RequestDispatcher rd = request.getRequestDispatcher("/test/friend.jsp");

		rd.forward(request, response);

	}

	// post방식 요청 시 호출
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
