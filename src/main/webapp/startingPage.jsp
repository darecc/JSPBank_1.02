<%--
  Strona tylko dla uprawnionego pracownika banku: obsługa zleceń
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  errorPage="error.jsp" %>
<html>
  <head>
    <title>Obsługa zleceń</title>
  </head>
  <body>
  <%
    String rola = request.getParameter("rola");
    if (rola == null)
    {
      String komunikat = "Nie masz uprawnień do obsługi zleceń!";
      throw new Exception("Nie masz uprawnień do obsługi zleceń!");
    }
    if (!rola.equals("admin")) {
      String komunikat = "Nie masz uprawnień do obsługi zleceń!";
      throw new Exception("Nie masz uprawnień do obsługi zleceń!");
    }
  %>
  </body>
</html>
