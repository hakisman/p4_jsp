<?xml version="1.0"?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="1.2">
<jsp:directive.page import="java.io.*,java.net.*,java.util.*,com.perforce.api.*" contentType="text/html;charset=ISO-8859-1"/>
<jsp:scriptlet>
session.invalidate();
out.println("INVALID");
</jsp:scriptlet>
</jsp:root>
