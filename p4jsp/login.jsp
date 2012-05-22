<?xml version="1.0"?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="1.2">
<jsp:directive.page import="java.util.*,com.perforce.api.*" contentType="text/html;charset=ISO-8859-1"/>
<jsp:useBean id="base_env" scope="application" class="com.perforce.api.Env"/>
<jsp:useBean id="env" scope="session" class="com.perforce.api.Env"/>
<jsp:scriptlet>
if (null != request.getParameter("logout")) {
  env.setUser("robot");
  env.setPassword("");
}
String title="P4JSP login";
</jsp:scriptlet>
<jsp:text><HTML><HEAD>
<jsp:directive.include file="head.jsp"/>
</HEAD>
<BODY bgcolor="#FFFFFF" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<TABLE width="780" cellspacing="0" cellpadding="0" border="0">
<jsp:directive.include file="navbar.jsp"/>
<TR><TD><TABLE width="100%" cellspacing="0" cellpadding="0" border="0">
<TR><TD width="21"><IMG src="images/s.gif" width="21" rowspan="10"/></TD><TD width="100%">
<H1>Login:</H1>
<FORM action="setenv.jsp">
<TABLE>
<TR><TD nowrap="t" align="right">P4USER:</TD>
<TD><INPUT type="text" name="usr" size="20"/></TD></TR>
<TR><TD nowrap="t" align="right">P4PASSWD:</TD>
<TD><INPUT type="password" name="passwd" size="20"/></TD></TR>
<jsp:scriptlet>
String dest = request.getParameter("dest");
if (null != dest) {
  out.println("&lt;INPUT type=\"hidden\" name=\"dest\" value=\""+dest+"\"/&gt;");
}
</jsp:scriptlet>
<TR><TD></TD><TD><INPUT type="submit"/></TD></TR>
</TABLE>
</FORM>

<!--
<FORM method="POST" enctype="multipart/form-data" action="fup.cgi">
File to upload: <INPUT type="file" name="upfile"/>
<br/>
<INPUT type="submit" value="Press"/> to upload the file!
</FORM>
-->

</TD></TR>
</TABLE></TD></TR>
</TABLE></BODY></HTML></jsp:text>
</jsp:root>
