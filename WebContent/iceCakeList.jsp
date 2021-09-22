<%@page import="vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<Product> productList =(ArrayList<Product>) request.getAttribute("productList");
%>
    
<%@ include file="header.jsp" %>
    <!-- section -->
    <section id="section" class="section" style="height: 1000px;" >
    	<h3>아이스크림 케이크 목록</h3>
    	<table border="1">
	    	<tr>
	    		<th>번호</th>
	       		<th>물건 번호</th>
	       		<th>물건 이름</th>
	       		<th>물건 칼로리</th>
	       		<th>물건 알레르기</th>
	       		<th>물건 가격</th>
	       		<th>물건 종류</th>
	       		<th>물건 제고 확인(있으면 O,I 없으면 X)</th>
	       		<th>물건 날짜</th>
        		<th>물건 제고 갯수</th>
        	</tr>
    	<% int i =0;
    	for (Product ListProduct : productList) { %>
    	
    	<%if(ListProduct.getProduct_choice().equalsIgnoreCase("1")) { %>
	    	<tr>
	    		<td><%=i++ %></td>
        		<td><%=ListProduct.getProduct_code() %></td>
        		<td><%=ListProduct.getProduct_name() %></td>
        		<td><%=ListProduct.getProduct_kcal() %></td>
        		<td><%=ListProduct.getProduct_allergy() %></td>
        		<td><%=ListProduct.getProduct_price() %></td>
        		<%if(ListProduct.getProduct_choice().equalsIgnoreCase("1")) { %>
        		<td>케이크</td>
        		<%} else if(ListProduct.getProduct_choice().equalsIgnoreCase("2")) { %>
        		<td>음료</td>
        		<%} else if(ListProduct.getProduct_choice().equalsIgnoreCase("3")) { %>
        		<td>커피</td>
        		<%} else if(ListProduct.getProduct_choice().equalsIgnoreCase("4")) {%>
        		<td>디저트</td>
        		<%} %>
        		<%if (ListProduct.getProduct_inout().equalsIgnoreCase("I")) { %>
        		<td>있음</td>
        		<% } else if(ListProduct.getProduct_inout().equalsIgnoreCase("O")) { %>
        		<td>없음</td>
        		<%} %>
        		<td><%=ListProduct.getProduct_date() %></td>
        		<td><%=ListProduct.getProduct_count() %></td>
	    	</tr>
   	 		<%} %>
    	<%} %>
    		</table>
    </section>

 <%@ include file="footer.jsp" %>