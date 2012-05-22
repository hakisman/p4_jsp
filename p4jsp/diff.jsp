<?xml version="1.0"?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="1.2">
<jsp:directive.page import="java.util.*,com.perforce.api.*" contentType="text/html;charset=ISO-8859-1"/>
<jsp:directive.include file="session.jsp"/>
<jsp:text><HTML><HEAD>
<jsp:directive.include file="head.jsp"/>
</HEAD>
<BODY bgcolor="#FFFFFF" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<TABLE width="780" cellspacing="0" cellpadding="0" border="0">
<jsp:directive.include file="navbar.jsp"/>
<TR><TD><TABLE width="100%" cellspacing="0" cellpadding="0" border="0">
<TR><TD width="21"><IMG src="images/s.gif" width="21" rowspan="10"/></TD><TD width="100%">
<H1>File Diff:</H1>
<jsp:scriptlet>
String path = request.getParameter("path");
if (null == path) {
  response.sendRedirect(response.encodeRedirectURL("index.jsp"));
  return;
}
String r1 = request.getParameter("r1");
String r2 = request.getParameter("r2");

FileEntry fent = new FileEntry(env, path);
fent.sync();
if (null == r1) r1 = String.valueOf(fent.getHeadRev()-1);
if (null == r2) r2 = String.valueOf(fent.getHeadRev());

out.print("File: "+Utils.formatDepotPath(fent.getDepotPath(), "&lt;A href=\"browse.jsp?path={0}\"&gt;{1}&lt;/A&gt;", "&lt;A href=\"file.jsp?path={0}\"&gt;{1}&lt;/A&gt;",null, true));
out.print("&lt;BR/&gt;");
out.print("Versions: #"+r1+" to #"+r2);
out.print("&lt;HR/&gt;");

String cmd[] = { "p4", "diff2", "-du", path+"#"+r1, path+"#"+r2 };
String l, c;
out.println("&lt;PRE style=\"diff\"&gt;");
try {
  P4Process p = new P4Process(env);
  p.setRawMode(true);
  p.exec(cmd);
  while (null != (l = p.readLine())) {
    if (l.startsWith("text: ")) {
      l = l.substring(6);
    } else {
      continue;
    }
    
    switch (l.charAt(0)) {
      case '@':
	c = "diffmacro";
	break;
      case '+':
	c = "diffadd";
	if (1 &gt; l.length()) {
          l = "";
	} else {
          l = l.substring(1);
	}
	break;
      case '-':
	c = "diffsub";
	if (2 &gt; l.length()) {
          l = "&amp;nbsp;";
	} else {
          l = l.substring(1);
	}
	break;
      default:
	c = "diff";
	if (2 &gt; l.length()) {
          l = "&amp;nbsp;";
	} else {
          l = l.substring(1);
	}
	break;
    }
    l = Utils.HTMLEncode(l);
    out.println("&lt;SPAN class=\""+c+"\"&gt;"+l+"&lt;/SPAN&gt;");
  }
  p.close();
} catch (Exception ex) {
  /* Ignored. */
}

out.println("&lt;/PRE&gt;");

</jsp:scriptlet>

</TD></TR>
</TABLE></TD></TR>
</TABLE></BODY></HTML></jsp:text>
</jsp:root>
