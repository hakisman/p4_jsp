<?xml version="1.0"?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="1.2">
<jsp:directive.page import="java.util.*,com.perforce.api.*,java.text.*,java.net.*" contentType="text/html;charset=ISO-8859-1"/>
<jsp:directive.include file="session.jsp"/>
<jsp:scriptlet>title="P4JSP Change View";</jsp:scriptlet>
<jsp:text><HTML><HEAD>
<jsp:directive.include file="head.jsp"/>
</HEAD>
<BODY bgcolor="#FFFFFF" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<TABLE width="780" cellspacing="0" cellpadding="0" border="0">
<jsp:directive.include file="navbar.jsp"/>
<TR><TD><TABLE width="100%" cellspacing="0" cellpadding="0" border="0">
<TR><TD width="21"><IMG src="images/s.gif" width="21" rowspan="10"/></TD><TD width="100%">
<jsp:scriptlet>
String num = request.getParameter("num");
if (null == num) {
  response.sendRedirect(response.encodeRedirectURL("changes.jsp"));
  return;
}
Change chng;
try {
  chng = Change.getChange(env, num, true);
} catch (Exception ex) {
  out.print("&lt;PRE&gt;Exception:\n"+ex+"\n\n"+env+"&lt;/PRE&gt;");
  return;
}
out.println("&lt;H1&gt;Change "+chng.getNumber()+":&lt;/H1&gt;");
</jsp:scriptlet>
<TABLE cellspacing="4" cellpadding="3">
<jsp:scriptlet>
out.print("&lt;TR&gt;&lt;TD align=\"right\" valign=\"top\" &gt;Submitter:&lt;/TD&gt;&lt;TD&gt;"+chng.getUser().getId()+"&lt;/TD&gt;");
out.print("&lt;TR&gt;&lt;TD align=\"right\" valign=\"top\" &gt;Status:&lt;/TD&gt;&lt;TD&gt;"+(Change.PENDING==chng.getStatus()?"pending":"submitted")+"&lt;/TD&gt;");
out.print("&lt;TR&gt;&lt;TD align=\"right\" valign=\"top\" &gt;Mod Time:&lt;/TD&gt;&lt;TD&gt;"+chng.getModtimeString()+"&lt;/TD&gt;");
out.print("&lt;TR&gt;&lt;TD align=\"right\" valign=\"top\" &gt;Description:&lt;/TD&gt;&lt;TD&gt;&lt;PRE&gt;"+chng.getShortDescription(true)+"&lt;/PRE&gt;&lt;/TD&gt;");
out.print("&lt;TR&gt;&lt;TD nowrap=\"t\" align=\"right\" valign=\"top\" &gt;Affected Files:&lt;/TD&gt;&lt;TD&gt;");
Vector fents = chng.getFileEntries();
FileEntry fent;
Enumeration en = fents.elements();
while (en.hasMoreElements()) {
  fent = (FileEntry)en.nextElement();
  out.print(Utils.formatDepotPath(fent.getDepotPath()+"#"+fent.getHeadRev(), "&lt;A href=\"browse.jsp?path={0}\"&gt;{1}&lt;/A&gt;", "&lt;A href=\"file.jsp?path={0}\"&gt;{1}&lt;/A&gt;", "&lt;A href=\"view.jsp?path={0}\"&gt;{1}&lt;/A&gt;", true));
  out.print(" ");
  if (1 &lt; fent.getHeadRev()) {
    out.print("&lt;A href=\"diff.jsp?path="+URLEncoder.encode(fent.getDepotPath())+"&amp;r1="+(fent.getHeadRev()-1)+"&amp;r2="+fent.getHeadRev()+"\"&gt;"+fent.getHeadAction()+"&lt;/A&gt;");
  } else {
    out.print(fent.getHeadAction());
  }
  out.print("&lt;BR/&gt;");
}
out.print("&lt;/TD&gt;");
</jsp:scriptlet>
</TABLE>

</TD></TR>
</TABLE></TD></TR>
</TABLE></BODY></HTML></jsp:text>
</jsp:root>
