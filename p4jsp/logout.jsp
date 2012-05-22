<?xml version="1.0"?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="1.2">
<jsp:directive.page import="java.util.*,com.perforce.api.*" contentType="text/html;charset=ISO-8859-1"/>
<jsp:useBean id="base_env" scope="application" class="com.perforce.api.Env"/>
<jsp:useBean id="env" scope="session" class="com.perforce.api.Env"/>
<jsp:scriptlet>
env.setUser("robot");
env.setPassword("");
session.removeAttribute("loggedin");
response.sendRedirect("login.jsp?logout=y");
</jsp:scriptlet>
</jsp:root>
