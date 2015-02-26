<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.1 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
    <link rel="stylesheet" type="text/css" href="style.css" media="screen" />
<TITLE>Trade Order information</TITLE>

</HEAD>
<BODY bgcolor="#ffffff" link="#000099" vlink="#000099">
<%@ page import="java.util.Collection, java.util.Iterator, java.math.BigDecimal,com.ibm.samples.trade.*,com.ibm.samples.trade.util.*" session="true" isThreadSafe="true" isErrorPage="false"%>
<jsp:useBean id="results" scope="request" type="java.lang.String" />

<TABLE height="54">
  <TBODY>
    <TR>
            <TD bgcolor="#8080c0" align="left" width="500" height="10" colspan="5"><FONT color="#ffffff"><B>Trade New Orders</B></FONT></TD>
            <TD align="center" bgcolor="#000000" width="100" height="10"><FONT color="#ffffff"><B>Trade</B></FONT></TD>
        </TR>
        <TR align="center">
            <TD><B><A href="app?action=home">Home</A></B><B> </B></TD>
            <TD><B><A href="app?action=account">Account</A></B><B> </B></TD>
            <TD><B><A href="app?action=portfolio">Portfolio</A></B><B> </B></TD>
            <TD><B><A href="app?action=quotes&symbols=s:0,s:1,s:2,s:3,s:4">Quotes/Trade</A></B></TD>
            <TD><B><A href="app?action=logout">Logoff</A></B></TD>
            <TD></TD>
        </TR>
        <TR>
            <TD align="right" colspan="6">
            <HR>
            <FONT color="#ff0000" size="-2"><%= new java.util.Date() %></FONT></TD>
        </TR>
<%
Collection closedOrders = (Collection)request.getAttribute("closedOrders");
if ( (closedOrders != null) && (closedOrders.size()>0) )
{
%>         
        <TR>
            <TD colspan="6" bgcolor="#ff0000"><BLINK><B><FONT color="#ffffff">Alert: The following Order(s) have completed.</FONT></B></BLINK></TD>
        </TR>
        <TR align="center">
            <TD colspan="6">
            <TABLE  style="font-size: smaller">
                            <TBODY>
<%
	Iterator it = closedOrders.iterator();
	while (it.hasNext() )
	{
		OrderDataBean closedOrderData = (OrderDataBean)it.next();
%>                            
                                <TR align="center">
                                    <TD><A href="docs/glossary.html">order ID</A></TD>
                                    <TD><A href="docs/glossary.html">order status</A></TD>
                                    <TD><A href="docs/glossary.html">creation date</A></TD>
									<TD><A href="docs/glossary.html">completion date</A></TD>
									<TD><A href="docs/glossary.html">txn fee</A></TD>
									<TD><A href="docs/glossary.html">type</A></TD>
									<TD><A href="docs/glossary.html">symbol</A></TD>
									<TD><A href="docs/glossary.html">quantity</A></TD>
                                </TR>
                                <TR align="center">
                        <TD><%= closedOrderData.getOrderID()%></TD>
                        <TD><%= closedOrderData.getOrderStatus()%></TD>
                                    <TD><%= closedOrderData.getOpenDate()%></TD>
                                    <TD><%= closedOrderData.getCompletionDate()%></TD>
                                    <TD><%= closedOrderData.getOrderFee()%></TD>
                                    <TD><%= closedOrderData.getOrderType()%></TD>
                                    <TD><%= FinancialUtils.printQuoteLink(closedOrderData.getSymbol()) %></TD>
                                    <TD><%= closedOrderData.getQuantity()%></TD>
                                </TR>
        <%
	}
%>
                                
                            </TBODY>
                        </TABLE>
            </TD>
        </TR>
        <%
}
%>
    </TBODY>
</TABLE>
<TABLE width="650">
    <TBODY>
        <TR>
            <TD>
            <TABLE width="100%">
                <TBODY>
                    <TR>
                        <TD></TD>
                    </TR>
                    <% 
 OrderDataBean orderData = (OrderDataBean)request.getAttribute("orderData");
 if ( orderData != null )
 {
                    %>
                    <TR>
                        <TD align="left" bgcolor="#cccccc"><B>New Order</B></TD>
                    </TR>
                    <TR>
                        <TD align="left"><FONT color="#cc0000"><B><BR>
                        Order <%=orderData.getOrderID()%></B> to <B><%=orderData.getOrderType()%> <%=orderData.getQuantity()%></B> shares of <B><%=orderData.getSymbol()%></B> has been submitted for processing. </FONT><BR>
                        <BR>
                        <FONT color="#000000">Order <FONT color="#000000"><B><%=orderData.getOrderID()%></B></FONT> details:</FONT></TD>
                    </TR>
                    <TR>
                        <TD align="center">
                        <TABLE  style="font-size: smaller">
                            <TBODY>
                                <TR align="center">
                                    <TD><A href="docs/glossary.html">order ID</A></TD>
                                    <TD><A href="docs/glossary.html">order status</A></TD>
                                    <TD><A href="docs/glossary.html">creation date</A></TD>
									<TD><A href="docs/glossary.html">completion date</A></TD>
									<TD><A href="docs/glossary.html">txn fee</A></TD>
									<TD><A href="docs/glossary.html">type</A></TD>
									<TD><A href="docs/glossary.html">symbol</A></TD>
									<TD><A href="docs/glossary.html">quantity</A></TD>
                                </TR>
                                <TR align="center" bgcolor="">
                                    <TD><%= orderData.getOrderID()%></TD>
                                    <TD><%= orderData.getOrderStatus()%></TD>
                                    <TD><%= orderData.getOpenDate()%></TD>
                                    <TD><%= orderData.getCompletionDate()%></TD>
                                    <TD><%= orderData.getOrderFee()%></TD>
                                    <TD><%= orderData.getOrderType()%></TD>
                                    <TD><%= FinancialUtils.printQuoteLink(orderData.getSymbol()) %></TD>
                                    <TD><%= orderData.getQuantity()%></TD>
                                </TR>
                            </TBODY>
                        </TABLE>
                        </TD>
                    </TR>
<% 
 }
 %>
                </TBODY>
            </TABLE>
            </TD>
        </TR>
    </TBODY>
</TABLE>
<TABLE height="54" style="font-size: smaller">
  <TBODY>
        <TR>
            <TD colspan="2">
            <HR>
            </TD>
        </TR>
        <TR>
            <TD colspan="2">
            <TABLE width="100%" style="font-size: smaller">
                <TBODY>
                    <TR>
                        <TD>Note: Click any <A href="docs/glossary.html">symbol</A> for a quote or to trade.</TD>
                        <TD align="right"><FORM><INPUT type="submit" name="action" value="quotes"> <INPUT size="20" type="text" name="symbols" value="s:0, s:1, s:2, s:3, s:4"></FORM></TD>
                    </TR>
                </TBODY>
            </TABLE>
            </TD>
        </TR>
        <TR>
            <TD bgcolor="#8080c0" align="left" width="500" height="10"><B><FONT color="#ffffff">Trade New Orders</FONT></B></TD>
            <TD align="center" bgcolor="#000000" width="100" height="10"><FONT color="#ffffff"><B>Trade</B></FONT></TD>
        </TR>
        <TR>
            <TD colspan="2" align="center"> Created&nbsp;with&nbsp;IBM WebSphere Application Server and WebSphere Studio Application Developer<BR>

 
Copyright 2000, IBM Corporation</TD>
        </TR>
    </TBODY>
</TABLE>
</BODY>
</HTML>