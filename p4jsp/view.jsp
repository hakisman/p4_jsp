<?xml version="1.0"?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="1.2">
<jsp:directive.page import="java.util.*,com.perforce.api.*" contentType="text/html;charset=ISO-8859-1"/>
<jsp:directive.include file="session.jsp"/>
<jsp:scriptlet>title="P4JSP FileView";</jsp:scriptlet>
<jsp:text><HTML><HEAD>
<jsp:directive.include file="head.jsp"/>
</HEAD>
<BODY bgcolor="#FFFFFF" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<TABLE width="780" cellspacing="0" cellpadding="0" border="0">
<jsp:directive.include file="navbar.jsp"/>
<TR><TD><TABLE width="100%" cellspacing="0" cellpadding="0" border="0">
<TR><TD width="21"><IMG src="images/s.gif" width="21" rowspan="10"/></TD><TD width="100%">
<H1>File View:</H1>
<jsp:scriptlet>
String path = request.getParameter("path");
if (null == path) {
  response.sendRedirect(response.encodeRedirectURL("index.jsp"));
  return;
}

FileEntry fent = new FileEntry(env, path);
fent.sync();

out.print("File: "+Utils.formatDepotPath(path, "&lt;A href=\"browse.jsp?path={0}\"&gt;{1}&lt;/A&gt;", "&lt;A href=\"file.jsp?path={0}\"&gt;{1}&lt;/A&gt;",null, true));
/* out.print("#"+fent.getHeadRev()); */
out.print(" is an ");
if (1 &lt; fent.getHeadRev()) {
  out.print("&lt;A href=\"diff.jsp?path="+URLEncoder.encode(fent.getDepotPath())+"&amp;r1="+(fent.getHeadRev()-1)+"&amp;r2="+fent.getHeadRev()+"\"&gt;"+fent.getHeadAction()+"&lt;/A&gt;");
} else {
  out.print(fent.getHeadAction());
}
out.print(" from change &lt;A href=\"change.jsp?num="+fent.getHeadChange()+"\"&gt;"+fent.getHeadChange()+"&lt;/A&gt;");
out.print("&lt;HR/&gt;");

if (fent.getHeadType().endsWith("text")) {
  String cmd[] = { "p4", "print", path };
  String l, c;
  int lnum = 0;

  try {
    P4Process p = new P4Process(env);
    p.setRawMode(true);
    p.exec(cmd);
    out.print("&lt;PRE class=\"diff\"&gt;");
    while (null != (l = p.readLine())) {
      if (0 == lnum++) continue;
      if (0 == l.length()) {
        out.println("");
        continue;
      }
      if (l.startsWith("text: ")) {
        out.println(Utils.HTMLEncode(l.substring(6)));
      }
    }
    out.print("&lt;/PRE&gt;");
    p.close();
  } catch (Exception ex) {
    /* Ignored. */
  }
}
</jsp:scriptlet>

</TD></TR>
</TABLE></TD></TR>
</TABLE></BODY></HTML></jsp:text>
</jsp:root>
