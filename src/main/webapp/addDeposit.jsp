<%@ page import="model.TypLokaty" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Bank" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %><%--
 Nowa lokata
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Nowa lokata</title>
    <link href="styl.css" rel="stylesheet"/>
    <meta charset="utf-8"/>
  </head>
  <body>
  <%
    request.setCharacterEncoding("UTF-8");
    String base = (String)application.getAttribute("base");
    String user = (String)session.getAttribute("user");
    List<TypLokaty> kolekcja = new ArrayList<>();
    kolekcja = Bank.deserializeDepositTypes();
    String add = request.getParameter("dni");
    if (add == null) {
        out.print("<h3>Założenie nowej lokaty:</h3>");
        out.print("<form action=\"addDeposit.jsp\" method=\"post\">");
        out.print("<label>Kwota</label>");
        out.print("<input type=\"number\" name=\"kwota\"/>");
        out.print("<label>Czas trwania </label>");
        out.print("<select id=\"dni\" name=\"dni\">");
        for(TypLokaty typ : kolekcja)
          out.print("<option value=\"" + typ.getDni() + "\">" + typ.getDni() + " na procent: " + typ.getOprocentowanie() + "</option>");
        out.print("</select>");
        out.print("<input type=\"submit\" value=\"Dodaj\" class=\"button\"/>");
        out.print("</form>");
    }
    else {
      Date data = Date.valueOf(LocalDate.now());
      String dni = request.getParameter("dni");
      int ileDni = Integer.parseInt(dni);
      String kwota = request.getParameter("kwota");
      double kwotaVal = Double.parseDouble(kwota);
      double procent = 0;
      for(TypLokaty typ : kolekcja)
        if (typ.getDni() == ileDni)
          procent = typ.getOprocentowanie();
      Bank.addDeposit(base, user, data, ileDni, kwotaVal, procent);
      response.sendRedirect("client.jsp");
    }
  %>
  </body>
</html>
