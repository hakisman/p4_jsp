<?xml version="1.0"?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="1.2">
<jsp:directive.page import="java.net.*,java.util.*,com.perforce.api.*" contentType="text/html;charset=ISO-8859-1"/>
<jsp:directive.include file="session.jsp"/>
<jsp:scriptlet>title="P4JSP FileLog";</jsp:scriptlet>
<jsp:text><HTML><HEAD>
<jsp:directive.include file="head.jsp"/>
</HEAD>
<BODY bgcolor="#FFFFFF" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<TABLE width="780" cellspacing="0" cellpadding="0" border="0">
<jsp:directive.include file="navbar.jsp"/>
<TR><TD><TABLE width="100%" cellspacing="0" cellpadding="0" border="0">
<TR><TD width="21"><IMG src="images/s.gif" width="21" rowspan="10"/></TD><TD width="100%">
<H1>File:</H1>
<PRE>
<jsp:scriptlet>
String path = request.getParameter("path");
if (null == path) {
  response.sendRedirect(response.encodeRedirectURL("index.html"));
  return;
}

out.print(Utils.formatDepotPath(path, "&lt;A href=\"browse.jsp?path={0}\"&gt;{1}&lt;/A&gt;", "&lt;A href=\"file.jsp?path={0}\"&gt;{1}&lt;/A&gt;", null, true));
out.print("&lt;BR/&gt;");

Vector v = FileEntry.getFileLog(env, path);

out.print("&lt;H2&gt;History&lt;/H2&gt;");
out.print("&lt;TABLE&gt;");
</jsp:scriptlet>
<TR><TH>Rev</TH><TH>Change</TH><TH>Mod Time</TH><TH>Action</TH><TH>Type</TH><TH>Short Description</TH></TR>
<jsp:scriptlet>

Enumeration en = v.elements();
while(en.hasMoreElements()) {
  FileEntry fent = (FileEntry)en.nextElement();
  fent.setTimeFormat("MM/dd/yy");

  out.print("&lt;TR&gt;");
  out.print("&lt;TD&gt;&lt;A href=\"view.jsp?path="+URLEncoder.encode(fent.getDepotPath()+"#"+fent.getHeadRev())+"\"&gt;"+fent.getHeadRev()+"&lt;/A&gt;&lt;/TD&gt;");
  out.print("&lt;TD&gt;&lt;A href=\"change.jsp?num="+fent.getHeadChange()+"\"&gt;"+fent.getHeadChange()+"&lt;/A&gt;&lt;/TD&gt;");
  out.print("&lt;TD&gt;"+fent.getHeadTimeString()+"&lt;/TD&gt;");

  if (1 &lt; fent.getHeadRev()) {
    out.print("&lt;TD&gt;&lt;A href=\"diff.jsp?path="+URLEncoder.encode(fent.getDepotPath())+"&amp;r1="+(fent.getHeadRev()-1)+"&amp;r2="+fent.getHeadRev()+"\"&gt;"+fent.getHeadAction()+"&lt;/A&gt;&lt;/TD&gt;");
  } else {
    out.print("&lt;TD&gt;"+fent.getHeadAction()+"&lt;/TD&gt;");
  }

  out.print("&lt;TD&gt;"+fent.getHeadType()+"&lt;/TD&gt;");
  out.print("&lt;TD&gt;"+fent.getDescription()+"&lt;/TD&gt;");
  out.print("&lt;/TR&gt;");
}

out.print("&lt;/TABLE&gt;");
</jsp:scriptlet>
</PRE>

</TD></TR>
</TABLE></TD></TR>
</TABLE></BODY></HTML></jsp:text>
</jsp:root>
