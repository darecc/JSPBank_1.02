<%@ page import="model.TypLokaty" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.GsonBuilder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.*" %>
<%@ page import="model.Bank" %><%--
  zatwierdzenie przelewów zewnętrznych
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<html>
  <head>
    <title>Zatwierdzenie przelewów wysyłanych na zewnątrz banku i zmiana ustawień lokat</title>
    <link href="styl.css" rel="stylesheet"/>
  </head>
  <body>
  <%
    List<TypLokaty> kolekcja = new ArrayList<>();
    kolekcja = Bank.deserializeDepositTypes();
    for(TypLokaty typ : kolekcja) {
      out.print("<p>" + typ.getDni() + " " + typ.getOprocentowanie() + "</p>");
    }
  %>
  </body>
</html>
