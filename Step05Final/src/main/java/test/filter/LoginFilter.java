package test.filter;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = { "/private/*"})
public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		if (id != null) {
			chain.doFilter(request, response);
		} else {

			//파라미터가 있다면 파라미터 정보도 함께 전송
			// 원래 가려던 url 정보 읽어오기
			String url = req.getRequestURI();
			String query = req.getQueryString();
			String encodedUrl = null;
			
			if (query == null) {
				encodedUrl = URLEncoder.encode(url);
			} else {
				encodedUrl = URLEncoder.encode(url + "?" + query);
			}

			String cPath = req.getContextPath();
			// ServletResponse type 을 HttpServletResponse type 으로 casting
			HttpServletResponse res = (HttpServletResponse) response;

			res.sendRedirect(cPath + "/users/login_form.jsp?url=" + encodedUrl);
		}

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
