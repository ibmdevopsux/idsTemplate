<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN">
<html>
<head>
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.0.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<!-- Don't cache on netscape! -->
<title>PingJsp</title>
</head>
<BODY>
<%@ page import="com.ibm.samples.trade.web.prims.PingBean" %>
<%!String initTime = (new java.util.Date()).toString();%>
<jsp:useBean id="ab" type="com.ibm.samples.trade.web.prims.PingBean" scope="request" />
<HR>
<FONT size="+2" color="#000066"><BR>
Ping Servlet2JSP:<BR>
</FONT><FONT size="+1" color="#000066">Init time: <%= initTime %></FONT><BR>
<BR>
<B>Message from Servlet: </B> <%= ab.getMsg() %>

</BODY>
</html>
