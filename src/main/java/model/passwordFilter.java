package model;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter("/waliduj")
public class passwordFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpServletRequest req = (HttpServletRequest)request;
        System.out.println("jestem w filtrze passwordFilter");
        String pass = req.getParameter("password");
        String user = req.getParameter("user");
        String errorPage = "login.jsp";
        if (pass == null)
            chain.doFilter(request, response);
        if (pass.length() < 6 || pass.length() > 8 || czyLitera(pass) == false && czyCyfra(pass) == false) {
            request.setAttribute("user", user);
            request.setAttribute("passwordMsg", "Hasło nie spełnia wymagań: 6-8 znaków, w tym litera, cyfra");
            RequestDispatcher rd = request.getRequestDispatcher(errorPage);
            rd.include(request, response);
        }
        else
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {
    }
    private boolean czyLitera(String pass) {
     boolean jest = false;
        for (char c : pass.toCharArray()) {
            if (c > 64 && c < 91) { // duże litery w kodzie ASCII
                jest = true;
                break;
            }
            if (c > 96 && c < 123) { // małe litery w kodzie ASCII
                jest = true;
                break;
            }
        }
     return jest;
    }
    private boolean czyCyfra(String pass) {
        boolean jest = false;
        for (char c : pass.toCharArray()) {
            if (c > 47 && c < 58) {
                jest = true;
                break;
            }
        }
        return jest;
    }
}
