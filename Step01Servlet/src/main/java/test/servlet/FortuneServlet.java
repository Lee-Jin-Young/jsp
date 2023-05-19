package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 어떤 경로 요청을 처리 할 것인지 경로 설정
// 반드시 '/' 로 시작
@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//클라이언트에게 문자열을 응답하는 객체의 참조값
		PrintWriter pw = resp.getWriter();
		pw.println("Today is Good!");
		pw.close();
	}
}
