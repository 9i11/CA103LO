<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.eventlist.model.*"%>
<%@ page import="com.mem.model.*"%>
<!DOCTYPE html>

<jsp:useBean id="eveSvc" scope="page" class="com.eve.model.EveService" />
<jsp:useBean id="evelistSvc" scope="page" class="com.eventlist.model.EventlistService" />
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />

<%	//取出會員的SESSION
	MemVO memVO = (MemVO) session.getAttribute("memVO"); 
%>
<%
	List<EventListVO> list=	evelistSvc.getEveListsByMem(memVO.getMem_id());
	pageContext.setAttribute("list",list);
%>



<html>
<head>
<title>會員的活動清單 - listEvesByMem.jsp</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

<style>
.myTable{
  width: 100%;
}
.myTable *{
  text-align: center;
}
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>會員的活動清單 - listEvesByMem.jsp</h3>
		 <h4><a href="<%=request.getContextPath() %>/front_end/event/eventlist/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<% session.removeAttribute("errorMsgs"); %>

<table>
	<tr>
		<th>會員名稱</th>
		<th>活動名稱</th>
		<th>活動評價</th>
		<th>活動清單狀態</th>
		<th>活動付款金額</th>
		<th>活動分享</th>
		<th>活動付款截止日</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="eventListVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr ${(eventListVO.mem_id==param.mem_id && eventListVO.eve_id==param.eve_id) ? 'bgcolor=#CCCCFF':''}>
			
			<td>
			 	<A href="<%=request.getContextPath() %>/eventlist/eventlist.do?mem_id=${eventListVO.mem_id}&eve_id=${eventListVO.eve_id}&action=getOne_modal&whichPage=<%=request.getParameter("whichPage")%>">
			    ${memSvc.getOneMem(eventListVO.mem_id).mem_name}
			    </A>			
			</td>
			<td>${eveSvc.getOneEve(eventListVO.eve_id).eve_title}</td>
			<td>
				<c:if test="${eveSvc.getOneEve(eventListVO.eve_id).eve_enddate.getTime()<System.currentTimeMillis()}">
					<c:if test="${eventListVO.eve_rating==0}">
						<input type='button' value='評價'>
					</c:if>
					${(eventListVO.eve_rating==0)?"":eventListVO.eve_rating}				
				</c:if>	
			</td>
			<td>${eveListStatusMap.get(eventListVO.evelist_status)}</td>
			<td>${eventListVO.evepay_amount}</td>
			<td>
				<c:if test="${eventListVO.eve_share=='ES0'}">
						<BUTTON >
							<A href="<%=request.getContextPath() %>/eventlist/eventlist.do?mem_id=${eventListVO.mem_id}&eve_id=${eventListVO.eve_id}&action=update_status&whichPage=<%=request.getParameter("whichPage")%>&sharestatus=ES1">
							分享
							</A>
						</BUTTON>					
				</c:if>
				<c:if test="${eventListVO.eve_share=='ES1'}">
						<BUTTON >
						<A href="<%=request.getContextPath() %>/eventlist/eventlist.do?mem_id=${eventListVO.mem_id}&eve_id=${eventListVO.eve_id}&action=update_status&whichPage=<%=request.getParameter("whichPage")%>&sharestatus=ES0">
							取消分享
							</A>
						</BUTTON>
				</c:if>
			
			</td> 
	
			
			<td>${eventListVO.evepay_deadline}</td>
			
			<td>
			  	<Button>
			  		<A href="<%=request.getContextPath() %>/eventlist/eventlist.do?mem_id=${eventListVO.mem_id}&eve_id=${eventListVO.eve_id}&action=update_modal&whichPage=<%=request.getParameter("whichPage")%>&requestURL=<%=request.getServletPath()%>">
			  		修改
			  		</A>
			  	</Button>
			     
			</td>
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath() %>/eventlist/eventlist.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="修改"> -->
<%-- 			     <input type="hidden" name="mem_id"  value="${eventListVO.mem_id}"> --%>
<%-- 			     <input type="hidden" name="eve_id"  value="${eventListVO.eve_id}"> --%>
<%-- 			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller--> --%>
<%-- 			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller--> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath() %>/eventlist/eventlist.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="mem_id"  value="${eventListVO.mem_id}">
			     <input type="hidden" name="eve_id"  value="${eventListVO.eve_id}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>


<%@ include file="page2.file" %>



  <!-- The Modal -->
<c:if test="${openModal!=null}">

<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
							
			<div class="modal-body">
          		 <jsp:include page="listOneEvelist.jsp" />
        	</div>
        	
			<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
		
		</div>
	</div>
</div>
        <script>
    		 $("#basicModal").modal({show: true});
        </script>
 </c:if>
 
 
 <!-- The Modal -->
<c:if test="${openupModal!=null}">

<div class="modal fade" id="basicModal2" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
							
			<div class="modal-body">
          		 <jsp:include page="update_evelist_modal.jsp" />
        	</div>
        			
		</div>
	</div>
</div>
        <script>
    		 $("#basicModal2").modal({show: true});
        </script>
 </c:if>
 

<!-- <br>本網頁的路徑:<br><b> -->
<%--    <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br> --%>
<%--    <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b> --%>
</body>
</html>