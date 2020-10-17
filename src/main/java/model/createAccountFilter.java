package model;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebFilter("/newClient.jsp")
public class createAccountFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpServletRequest req = (HttpServletRequest) request;
        System.out.println("jestem w filtrze createAccounntFilter");
        String imie = req.getParameter("imie");
        String base = req.getParameter("base");
        String nazwisko = req.getParameter("nazwisko");
        String login = req.getParameter("login");
        String pesel = req.getParameter("pesel");
        String haslo = req.getParameter("haslo");
        String errorPage = "createAccount.jsp";
        boolean cosNieTak = false;
        if (imie.length() < 3 || imie.length() > 15) {
            String komunikat = "Imie nie spełnia warunków: minimum 3 znaki i maksimum 15 znaków";
            request.setAttribute("imieMsg", komunikat);
            cosNieTak = true;
        }
        if (nazwisko.length() < 3) {
            String komunikat = "Nazwisko użytkownika nie spełnia wymagań: minimum 3 znaki i maksimum 15 znaków";
            request.setAttribute("nazwiskoMsg", komunikat);
            cosNieTak = true;
        }
        if (pesel.length() != 11) {
            String komunikat = "PESEL użytkownika nie spełnia wymagań: 11 znaków";
            request.setAttribute("peselMsg", komunikat);
            cosNieTak = true;
        }
        if (login.length() < 5) {
            String komunikat = "Login użytkownika nie spełnia wymagań: minimum 5 znaków";
            request.setAttribute("loginMsg", komunikat);
            cosNieTak = true;
        }
        if (checkIfUserExists(base, login)) {
            String komunikat = "Login użytkownika jest już używany w banku";
            request.setAttribute("loginMsg", komunikat);
            cosNieTak = true;
        }
        if (haslo.length() < 6 || haslo.length() > 8 || czyLitera(haslo) == false && czyCyfra(haslo) == false) {
            request.setAttribute("hasloMsg", "Hasło nie spełnia wymagań: 6-8 znaków, w tym litera, cyfra");
            cosNieTak = true;
        }
        if (cosNieTak) {
            request.setAttribute("imie", imie);
            request.setAttribute("nazwisko", nazwisko);
            request.setAttribute("login", login);
            request.setAttribute("pesel", pesel);
            request.setAttribute("haslo", haslo);
            RequestDispatcher rd = request.getRequestDispatcher(errorPage);
            rd.include(request, response);
        }
        else
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {

    }
    private boolean checkIfUserExists(String base, String login) {
        Statement stmt = null;
        ResultSet rs = null;
        String role = "no";
        boolean jest = false;
        try {
            Connection conn = DatabaseConnection.initializeDatabase(base);
            if (conn == null) {
                System.out.println("Nie można połączyć się z bazą danych. ");
            }
            stmt = conn.createStatement();
            String sql = "SELECT * FROM klienci where login = '" + login + "';";
            rs = stmt.executeQuery(sql);
            jest = rs.first();
            return jest;
        }
        catch(ClassNotFoundException cnfe) {
            System.out.println("!!!" + cnfe.getMessage());
            return false;
        }
        catch(SQLException se) {
            System.out.println("@@@"  +se.getMessage());
            return false;
        }
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
