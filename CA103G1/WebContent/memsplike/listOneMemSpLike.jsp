<%@ page contentType="text/html; charset=Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.memsplike.model.*"%>
<%
MemSpLikeVO memsplikeVO = (MemSpLikeVO) request.getAttribute("memsplikeVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>
<html>
<head>
<title>���u��� - listOneEmp.jsp</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>��@�|���ߦn���A��� - ListOneMemSpLike.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

	<%-- ���~��C --%>

	<c:if test="${not empty errorMsgs}">
		<font color='red'>�Эץ��H�U���~:
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li>${message}</li>
			</c:forEach>
		</ul>
		</font>
	</c:if>

<table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>�|���s��</th>
		<th>�ߦn�s��</th>
		<th>�ߦn���A</th>

	</tr>
	<tr align='center' valign='middle'>
		<td><%=memsplikeVO.getMem_id()%></td>
		<td><%=memsplikeVO.getSptype_id()%></td>
		<td><%=memsplikeVO.getLike_status()%></td>
	</tr>
</table>

</body>
</html>
