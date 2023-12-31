<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 15/10/2023
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.ws.rs.client.Client" %>
<%@ page import="jakarta.ws.rs.client.ClientBuilder" %>
<%@ page import="com.example.clientrest.Demandeurs" %>
<%@ page import="jakarta.ws.rs.client.WebTarget" %>
<%@ page import="jakarta.ws.rs.core.GenericType" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Utilisateurs</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<header>
    <h1>Liste des Utilisateurs</h1>
</header>
<main>
    <table class="user-table">
        <tr>
            <th>Nom</th>
            <th>Age</th>
            <th>Status</th>
            <th>Mission</th>
        </tr>
        <%   Client client = ClientBuilder.newClient();
             WebTarget target = client.target("http://localhost:8080/RestFull/webapi/GestionDm/Demandeurs");
            GenericType<List<Demandeurs>> genericType = new GenericType<List<Demandeurs>>() {};
             List<Demandeurs> Demandeurs = target.request().get(genericType);
            for (Demandeurs user : Demandeurs) { %>
        <tr>
            <td><%= user.getName()%></td>
            <td><%= user.getAge() %></td>
            <td><%= user.getStatue() %></td>
            <td><%= user.getMission() %></td>
        </tr>
        <% } %>
    </table>
</main>
</body>
</html>
