<?xml version="1.0"?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="1.2">
<jsp:directive.page import="java.util.*,com.perforce.api.*" contentType="text/html;charset=ISO-8859-1"/>
<jsp:directive.include file="session.jsp"/>
<jsp:scriptlet>title="P4JSP Changes";</jsp:scriptlet>
<jsp:text><HTML><HEAD>
<jsp:directive.include file="head.jsp"/>
</HEAD>
<BODY bgcolor="#FFFFFF" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<TABLE width="780" cellspacing="0" cellpadding="0" border="0">
<jsp:directive.include file="navbar.jsp"/>
<TR><TD><TABLE width="100%" cellspacing="0" cellpadding="0" border="0">
<TR><TD width="21"><IMG src="images/s.gif" width="21" rowspan="10"/></TD><TD width="100%">
<H1>Changes:</H1>
<TABLE cellspacing="4" cellpadding="3">
<THEAD><TR><TH>Change</TH><TH>User</TH><TH>Modtime</TH><TH>Short Description</TH></TR></THEAD>
<TBODY>
<jsp:scriptlet>
String path = "";
int max = 100;
String start = null;
String end = null;
boolean use_integs = true;
String ufilter = null;

try {
  Change[] changes = Change.getChanges(env, path, max, start, end, use_integs, ufilter);
  Change chng;

  for (int i = 0; i &lt; changes.length; i++) {
    chng = changes[i];
    out.print("&lt;TD valign=\"top\"&gt;&lt;A href=\"change.jsp?num="+chng.getNumber()+"\"&gt;"+chng.getNumber()+"&lt;/A&gt;&lt;/TD&gt;");
    out.print("&lt;TD valign=\"top\"&gt;"+chng.getUser().getId()+"&lt;/TD&gt;");
    out.print("&lt;TD valign=\"top\"&gt;"+chng.getModtimeString()+"&lt;/TD&gt;");
    out.print("&lt;TD valign=\"top\"&gt;"+chng.getShortDescription()+"&lt;/TD&gt;");
    out.print("&lt;/TR&gt;");
  }
} catch (Exception ex) {
    out.print("&lt;PRE&gt;Exception:\n"+ex+"\n\n"+env+"&lt;/PRE&gt;");
}
</jsp:scriptlet>
</TBODY></TABLE>

</TD></TR>
</TABLE></TD></TR>
</TABLE></BODY></HTML></jsp:text>
</jsp:root>
