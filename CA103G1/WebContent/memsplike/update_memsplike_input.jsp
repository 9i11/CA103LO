<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.memsplike.model.*"%>
<%
	MemSpLikeVO memsplikeVO = (MemSpLikeVO)request.getAttribute("memsplikeVO"); 
	//EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
<html>
<head>
<title>���u��ƭק� - update_emp_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>
	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td>
			<h3>��ƭק� - update_memsplike_input.jsp</h3>
			<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></td>
		</tr>
	</table>
	
	<h3>��ƭק�:</h3>
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
	
	<FORM METHOD="post" ACTION="memsplike.do" name="form1">
		<table border="0">
			<tr>
				<td>�|���s��:<font color=red><b>*</b></font></td>
				<td><%=memsplikeVO.getMem_id()%></td>
			</tr>
			<tr>
				<td>�B�ʽs��:</td>
				<td><%=memsplikeVO.getSptype_id()%></td>
			</tr>
			<tr>
				<td>�ߦn���A</td>
				<td>
					<select size="1" name="like_status">
						<option value="LS0">
							LS0 �L�ߦn���A
						<option value="LS1">
							LS1 �ߦn
						<option value="LS2">
							LS2 �R�����A
					</select>
				</td>
			</tr>		
		</table>
		<br>
		<input type="hidden" name="action" value="update">
		<input type="hidden" name="mem_id" value="<%=memsplikeVO.getMem_id()%>">
		<input type="hidden" name="sptype_id" value="<%=memsplikeVO.getSptype_id()%>">
		<input type="submit" value="�e�X�ק�">
	</FORM>

</body>
</html>
