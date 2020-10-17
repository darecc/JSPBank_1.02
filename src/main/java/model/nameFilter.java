package model;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter("/waliduj")
public class nameFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String userName = request.getParameter("user");
            String errorPage = "login.jsp";
            if(userName.length() < 6 || userName.contains("@") == false || userName.contains(".") == false) {
                request.setAttribute("user", userName);
                String komunikat = "Nazwa użytkownika nie spełnia wymagań: minimum 6 znaków, znak @ oraz .";
                request.setAttribute("userMsg", komunikat);
                RequestDispatcher rd = request.getRequestDispatcher(errorPage);
                rd.include(request, response);
        }
        else
          chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
