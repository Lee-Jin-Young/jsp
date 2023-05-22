package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send2")
public class SendServlet2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String msg = req.getParameter("msg");
		System.out.println("msg : " + msg);
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset = utf-8");
		req.setCharacterEncoding("utf-8");
		PrintWriter pw = resp.getWriter();
		pw.println("<head>");
		pw.println("<meta charset='UTF-8'>");
	    pw.println("<meta http-equiv='X-UA-Compatible' content='IE=edge'>");
		pw.println("<title>메세지 전송 결과 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>메세지를 받음</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
