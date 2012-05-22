<?xml version="1.0"?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="1.2">
<jsp:directive.page import="java.util.*" contentType="text/html;charset=ISO-8859-1"/>
<!--<jsp:directive.include file="session.jsp"/>-->
<jsp:scriptlet>title="P4JSP_FOR_YX";</jsp:scriptlet>
<jsp:text><HTML><HEAD>
<jsp:directive.include file="head.jsp"/>
</HEAD>
<BODY bgcolor="#FFFFFF" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<TABLE width="780" cellspacing="0" cellpadding="0" border="0">
<jsp:include page="navbar.jsp"/>
<TR><TD><TABLE width="100%" cellspacing="0" cellpadding="0" border="0">
<TR><TD width="21"><IMG src="images/s.gif" width="21" rowspan="10"/></TD><TD width="100%">
<H1>Perforce JSP:</H1>
<UL>
<LI><A href="browse.jsp">Browse Files.</A></LI>
<LI><A href="changes.jsp">View Changes.</A></LI>
<LI><A href="users.jsp">View Users.</A></LI>
<LI><A href="clients.jsp">View Clients.</A></LI>
<LI><A href="labels.jsp">View Labels.</A></LI>
<LI><A href="branches.jsp">View Branches.</A></LI>
</UL></TD></TR>
</TABLE></TD></TR>
<!-- <jsp:scriptlet>
out.print("SESSION: "+session.getId()+"&lt;BR/&gt;");
out.print("ENV: "+env.hashCode()+"&lt;BR/&gt;");
out.print("ENV: "+env+"&lt;BR/&gt;");
</jsp:scriptlet> -->
</TABLE></BODY></HTML></jsp:text>
</jsp:root>
