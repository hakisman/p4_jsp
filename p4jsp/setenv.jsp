<?xml version="1.0"?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="1.2">
<jsp:directive.page import="java.io.*,java.net.*,java.util.*,com.perforce.api.*" contentType="text/html;charset=ISO-8859-1"/>
<jsp:useBean id="base_env" scope="application" class="com.perforce.api.Env"/>
<jsp:useBean id="env" scope="session" class="com.perforce.api.Env"/>
<jsp:scriptlet>
String usr = request.getParameter("usr");
String passwd = request.getParameter("passwd");
String dest = request.getParameter("dest");

env.setFromProperties(base_env.getProperties());
env.setUser(usr);
env.setPassword(passwd);

try {
  env.checkValidity();
  session.setAttribute("loggedin", "yes");
} catch (PerforceException pex) {
  if (null == dest) {
    response.sendRedirect(response.encodeRedirectURL("login.jsp"));
  } else {
    dest = URLEncoder.encode(dest);
    response.sendRedirect(response.encodeRedirectURL("login.jsp?dest="+dest));
  }
  return;
}

if (null == dest) {
  response.sendRedirect(response.encodeRedirectURL("index.jsp"));
} else {
  dest = URLDecoder.decode(dest);
  response.sendRedirect(response.encodeRedirectURL(dest));
}

</jsp:scriptlet>
</jsp:root>
