<?xml version="1.0"?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="1.2">
<jsp:directive.page import="java.util.*,com.perforce.api.*" contentType="text/html;charset=ISO-8859-1"/>
<jsp:directive.include file="session.jsp"/>
<jsp:declaration>
public String getFileType(String file) {
  String lower = file.toLowerCase();
  if (file.endsWith(".sh") || file.endsWith(".csh")) return "shellscript";
  if (file.endsWith(".html") || file.endsWith(".htm")) return "html";
  if (file.endsWith(".c")) return "source_c";
  if (file.endsWith(".h")) return "source_h";
  if (file.endsWith(".java")) return "source_java";
  if (file.endsWith(".pl")) return "source_pl";
  if (file.endsWith(".cpp")) return "source_cpp";
  if (file.endsWith(".py")) return "source_py";
  if (lower.endsWith("readme") || lower.endsWith("readme.txt")) return "readme";
  if (file.endsWith(".txt")) return "txt";
  if (file.endsWith(".tar")) return "tar";
  if (file.endsWith(".tgz")) return "tgz";
  if (file.endsWith(".deb") || file.endsWith("/debian/control") || file.endsWith("/debian/changelog") || file.endsWith("/debian/rules") || file.endsWith("/debian/postinst") || file.endsWith("/debian/preinst") || file.endsWith("/debian/postrm") || file.endsWith("/debian/prerm")) return "deb";
  if (file.endsWith(".pdf")) return "pdf";
  if (file.endsWith(".ps")) return "postscript";
  if (lower.endsWith("makefile")) return "make";
  if (file.endsWith(".png") || file.endsWith(".gif") || file.endsWith(".jpg") || file.endsWith(".bmp")) return "image";
  if (file.endsWith(".wav") || file.endsWith(".mp3")) return "sound";
  if (file.endsWith(".mpg") || file.endsWith(".avi")) return "video";

  return "unknown";
}
</jsp:declaration>
<jsp:scriptlet>title="P4JSP Browser";</jsp:scriptlet>
<jsp:text><HTML><HEAD>
<jsp:directive.include file="head.jsp"/>
</HEAD>
<BODY bgcolor="#FFFFFF" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<TABLE width="780" cellspacing="0" cellpadding="0" border="0">
<jsp:directive.include file="navbar.jsp"/>
<TR><TD><TABLE width="100%" cellspacing="0" cellpadding="0" border="0">
<TR><TD width="21"><IMG src="images/s.gif" width="21" rowspan="10"/></TD><TD width="100%">
<H1>Browse:</H1>
<PRE>
<jsp:scriptlet>
String path = request.getParameter("path");
if (null == path) path = "//";
if (!path.endsWith("/")) path += "/";

out.print("&lt;BR/&gt;");

DirEntry dir = new DirEntry(env, path);
String[] dirs = dir.getDirNames();
int i;

out.print("&lt;TABLE&gt;");
out.print("&lt;TR&gt;&lt;TD&gt;&lt;IMG width=\"16\" height=\"16\" src=\"images/root.png\"/&gt;&lt;/TD&gt;");
out.print("&lt;TD&gt;&lt;A href=\"browse.jsp\"&gt;// - all depots&lt;/A&gt;&lt;/TD&gt;&lt;/TR&gt;");
out.print("&lt;TR&gt;&lt;TD/&gt;&lt;TD colspan=\"3\"&gt;"+Utils.formatDepotPath(path, "&lt;A href=\"browse.jsp?path={0}\"&gt;{1}&lt;/A&gt;", null, null, true)+"&lt;/TD&gt;&lt;/TR&gt;");

for (i = 0; i &lt; dirs.length; i++) {
  out.print("&lt;TR&gt;&lt;TD&gt;&lt;IMG width=\"16\" height=\"16\" src=\"images/folder.png\"/&gt;&lt;/TD&gt;");
  out.print("&lt;TD&gt;&lt;A href=\"browse.jsp?path="+path+dirs[i]+"\"&gt;"+dirs[i]+"&lt;/A&gt;&lt;/TD&gt;&lt;/TR&gt;");
}
FileEntry[] files = dir.getFiles();
FileEntry fent;
if (0 &lt; files.length) {
</jsp:scriptlet>
<TR><TH/><TH>File</TH><TH>Type</TH><TH>Rev</TH><TH>Action</TH><TH>Modtime</TH></TR>
<jsp:scriptlet>
}
for (i = 0; i &lt; files.length; i++) {
  fent = files[i];
  fent.setTimeFormat("MM/dd/yy HH:mm");
  out.print("&lt;TR&gt;&lt;TD&gt;&lt;IMG width=\"16\" height=\"16\" src=\"images/"+getFileType(fent.getDepotPath())+".png\"/&gt;&lt;/TD&gt;");
  out.print("&lt;TD&gt;&lt;A href=\"file.jsp?path="+fent.getDepotPath()+"\"&gt;"+fent.getName()+"&lt;/A&gt;&lt;/TD&gt;");
  out.print("&lt;TD&gt;"+fent.getHeadType()+"&lt;/TD&gt;");
  out.print("&lt;TD&gt;&lt;A href=\"view.jsp?path="+URLEncoder.encode(fent.getDepotPath()+"#"+fent.getHeadRev())+"\"&gt;"+fent.getHeadRev()+"&lt;/A&gt;&lt;/TD&gt;");
  out.print("&lt;TD&gt;");
  if (1 &lt; fent.getHeadRev()) {
    out.print("&lt;A href=\"diff.jsp?path="+URLEncoder.encode(fent.getDepotPath())+"&amp;r1="+(fent.getHeadRev()-1)+"&amp;r2="+fent.getHeadRev()+"\"&gt;"+fent.getHeadAction()+"&lt;/A&gt;");
  } else {
    out.print(fent.getHeadAction());
  }
  out.print("&lt;/TD&gt;");
  out.print("&lt;TD&gt;"+fent.getHeadTimeString()+"&lt;/TD&gt;");
  out.print("&lt;/TR&gt;");
}
out.print("&lt;/TABLE&gt;");
</jsp:scriptlet>
</PRE>

</TD></TR>
</TABLE></TD></TR>
</TABLE></BODY></HTML></jsp:text>
</jsp:root>
