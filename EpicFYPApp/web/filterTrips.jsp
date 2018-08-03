<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Dao.TripsDAO"%>
<%@page import="Model.Entity.Trip"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filtered Trips</title>
    </head>
    <body>
        <%
            String country = (String) request.getParameter("country");
            String priceRange = (String) request.getParameter("price");
            String rating = (String) request.getParameter("rating");
            String programme = (String) request.getParameter("programmes");

            ArrayList<Trip> filteredTrips = TripsDAO.filterTrips(country, rating, priceRange, programme);
        %>
    </body>
</html>

