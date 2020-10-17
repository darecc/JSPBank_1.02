<%--
  strona obsługująca błędy
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
  <head>
    <title>Bląd</title>
  </head>
  <%
    String komunikat = exception.getMessage();
  %>
  <body>
  <p>Opis błędu: <span style="color:green;"><%=komunikat%></span></p>
  </body>
</html>
