<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.memsplike.model.*" %>

<%
	MemSpLikeVO memsplikeVO = (MemSpLikeVO) request.getAttribute("memsplikeVO");
%>
<html>

<head>
	<title>�s�W�|���ߦn��� - addMemSpLike.jsp</title>
	<link rel="stylesheet" type="text/css" href="js/calendar.css">
	<script language="JavaScript" src="js/calendarcode.js"></script>
	<div id="popupcalendar" class="text"></div>
</head>

<body bgcolor='white'>
	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td>
			<h3>�s�W�|���ߦn��� - addMemSpLike.jsp</h3>
			</td>
			<td>
			   <a href="select_page.jsp"><img src="images/tomcat.gif" width="100" height="100" border="1">�^����</a>
		    </td>
		</tr>
	</table>
	
	<h3>��ƿ�J</h3>
	<c:if test="${not empty errorMsgs}">
		<font color='red'>�Эץ��H�U���~:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>
	
	<form method="post" action="memsplike.do" name="form1" >
		<table border="0">
			<tr>
				<td>�|���s��</td>
				<td>
					<input type="text" name="mem_id" size="45" 
					value="<%=(memsplikeVO == null)? "M000001" : memsplikeVO.getMem_id()%>">
				</td>
			</tr>
			
			<tr>
				<td>�ߦn�s��</td>
				<td><input type="text" name="sptype_id" size="45" 
					value="<%=(memsplikeVO == null)? "SP000001" : memsplikeVO.getSptype_id()%>">
				</td>
			</tr>
			
			<tr>
				<td>�ߦn�{��</td>
				<td>
					<select size="1" name="like_status">
						<option value="LS0">LS0 �L�ߦn���A
						<option value="LS1">LS1 �ߦn
						<option value="LS2">LS2 �R�����A
					</select>
				</td>
			</tr>
		</table>
		
		<br>
		
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="�e�X�s�W">
	</form>
</body>
</html>