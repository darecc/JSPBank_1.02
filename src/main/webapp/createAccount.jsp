<%--
  tworzenie nowego konta
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<html>
<head>
  <title>Tworzenie nowego konta</title>
  <meta charset="utf-8"/>
  <link href="styl.css" rel="stylesheet"/>
</head>
<body class="page">
<%
  request.setCharacterEncoding("UTF-8");
  response.setCharacterEncoding("UTF-8");
  Object imie = "";
  if(request.getParameter("imie") != null)
    imie = request.getAttribute("imie");
  Object nazwisko = "";
  if(request.getParameter("nazwisko") != null)
    nazwisko = request.getAttribute("nazwisko");
  Object pesel = "";
  if(request.getParameter("pesel") != null)
    pesel = request.getAttribute("pesel");
  Object login = "";
  if(request.getParameter("login") != null)
    login = request.getAttribute("login");
  Object haslo = "";
  if(request.getParameter("haslo") != null)
    haslo = request.getAttribute("haslo");
  System.out.println("dane: " + imie + " " + nazwisko + " " + login);
  // a teraz komunikaty
  Object imieMsg = request.getAttribute("imieMsg");
  String imieMessage = "";
  if (imieMsg != null)
    imieMessage += imieMsg;
  Object nazwiskoMsg = request.getAttribute("nazwiskoMsg");
  String nazwiskoMessage = "";
  if (nazwiskoMsg != null)
    nazwiskoMessage += nazwiskoMsg;
  Object peselMsg = request.getAttribute("peselMsg");
  String peselMessage = "";
  if (peselMsg != null)
    peselMessage += peselMsg;
  Object loginMsg = request.getAttribute("loginMsg");
  String loginMessage = "";
  if (loginMsg != null)
    loginMessage += loginMsg;
  Object hasloMsg = request.getAttribute("hasloMsg");
  String hasloMessage = "";
  if (hasloMsg != null)
    hasloMessage += hasloMsg;
  String base = (String)application.getAttribute("base");
%>
<h3>Dzisiaj w promocji dostaniesz na start 500 zł</h3><br/>
<form action="newClient.jsp" method="post">
  <label>Imię </label>
  <input name = "imie" type="text" value="<%=imie%>"/><p style="color:red;"><%=imieMessage%></p>
  <label>Nazwisko</label>
  <input name = "nazwisko" type = "text" value="<%=nazwisko%>"/><br/><p style="color:red;"><%=nazwiskoMessage%></p>
  <label>PESEL: </label>
  <input name = "pesel" type="text" value="<%=pesel%>"/><br/><p style="color:red"><%=peselMessage%></p>
  <label>Adres: </label>
  <input name = "adres" type="text"/><br/>
  <label>Login: </label>
  <input name="login" type="text" value="<%=login%>"/><br/><p style="color:red;"><%=loginMessage%></p>
  <label>Hasło: </label>
  <input name = "haslo" type = "password" value="<%=haslo%>"/><p style="color:red"><%=hasloMessage%></p><br/>
  <input type="hidden" id="base" name="base" value="<%=base%>">
  <input type = "submit" value="Dodaj" class="button"/>
</form>
</body>
</html>