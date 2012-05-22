<?xml version="1.0"?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="1.2">
<jsp:directive.page import="java.util.*,com.perforce.api.*" contentType="text/html;charset=ISO-8859-1"/>
<jsp:directive.include file="session.jsp"/>
<jsp:scriptlet>title="P4JSP Branches";</jsp:scriptlet>
<jsp:text><HTML><HEAD>
<jsp:directive.include file="head.jsp"/>
</HEAD>
<BODY bgcolor="#FFFFFF" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<TABLE width="780" cellspacing="0" cellpadding="0" border="0">
<jsp:directive.include file="navbar.jsp"/>
<TR><TD><TABLE width="100%" cellspacing="0" cellpadding="0" border="0">
<TR><TD width="21"><IMG src="images/s.gif" width="21" rowspan="10"/></TD><TD width="100%">
<H1>Branches:</H1>
<TABLE cellspacing="4" cellpadding="3">
<THEAD><TR><TH>Branch</TH><TH>Description</TH></TR></THEAD>
<TBODY>
<jsp:scriptlet>

class BranchComparator implements Comparator {
  public int compare(Object o1, Object o2) {
    return ((Branch)o1).getName().compareTo(((Branch)o2).getName());
  }
  public boolean equals(Object o) {
    return this.equals(o);
  }
}

TreeSet ts = new TreeSet(new BranchComparator());

Enumeration en = Branch.getBranches(env);
while (en.hasMoreElements()) {
  ts.add(en.nextElement());
}

Iterator itr = ts.iterator();
while (itr.hasNext()) {
  Branch brnch = (Branch)itr.next();
  out.print("&lt;TR&gt;");
  out.print("&lt;TD&gt;"+brnch.getName()+"&lt;/TD&gt;");
  out.print("&lt;TD&gt;"+brnch.getDescription()+"&lt;/TD&gt;");
  out.print("&lt;/TR&gt;");
}
</jsp:scriptlet>
</TBODY></TABLE>

</TD></TR>
</TABLE></TD></TR>
</TABLE></BODY></HTML></jsp:text>
</jsp:root>
