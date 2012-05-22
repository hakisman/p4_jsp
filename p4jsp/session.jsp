<?xml version="1.0"?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="1.2">
<jsp:directive.page import="java.io.*,java.net.*,java.util.*,com.perforce.api.*"/>
<jsp:useBean id="base_env" scope="application" class="com.perforce.api.Env"/>
<jsp:useBean id="env" scope="session" class="com.perforce.api.Env"/>
<jsp:scriptlet>
String loggedin = (String)session.getAttribute("loggedin");

if (base_env.getUser().equals("yuzhenmeng")) {
  base_env.setFromProperties("p4jsp.conf");
}

String dest = request.getRequestURI();
if (null != request.getQueryString()) dest += "?"+request.getQueryString();
dest = response.encodeRedirectURL("login.jsp?dest="+URLEncoder.encode(dest));

if (null == loggedin || env.getUser().equals("robot")) {
  env.setFromProperties(base_env.getProperties());
  env.setPassword("");
  session.removeAttribute("loggedin");
  response.sendRedirect(dest);
  return;
}

try {
  env.checkValidity();
} catch (PerforceException pex) {
  session.removeAttribute("loggedin");
  response.sendRedirect(dest);
  return;
}

String title = "P4JSP";
</jsp:scriptlet>
</jsp:root>
