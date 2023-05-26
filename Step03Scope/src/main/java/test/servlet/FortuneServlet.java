package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fortune = "good";
		/*
		 * 응답에 필요한 데이터를 key:value형태로 담아둔다.
		 * 담은 데이터는 응답을 마친 이후 사라진다.
		 * getAttribute(key)를 통해 응답바든다.
		 * value는 object type으로 응답 받을 당시 원래 타입으로 casting 해주어야 한다.
		 */
		req.setAttribute("fortuneToday", fortune);
		
		//응답을 jsp페이지로 위임
		RequestDispatcher rd = req.getRequestDispatcher("/test/fortune.jsp");
		//전달 받은 매개변수를 jsp페이지로 전달
		rd.forward(req, resp);
	}
}
