package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

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
		//응답 인코딩 설정(utf-8 : 한글사용 가능)
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정
		resp.setContentType("text/html; charset=utf-8");

		//클라이언트에게 문자열을 응답하는 객체의 참조값
		PrintWriter pw = resp.getWriter();
		pw.println("<!DOCTYPE html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title>오늘의 운세 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div>");
		Random rand = new Random();
		
		String[] fortunes = {"동쪽으로 가면 귀인을 만나요", 
	            "오늘은 집에만 계세요", 
	            "너무 멀리가지 마세요",
	            "오늘은 뭘해도 되는 날이에요",
	            "로또가 당첨되요"};

		String fortune = fortunes[rand.nextInt(5)];
		pw.println("<p>"+fortune+"</p>");
		pw.println("</div>");
		pw.println("</body>");
		pw.println("</html>");
		
		pw.close();
	}
}
