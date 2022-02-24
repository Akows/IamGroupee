<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.iag.leave.entity.LvUsedListDto"%>

	            <div class="card card-primary card-outline card-tabs" style="height: 49%;">
	              <div class="card-body">
	                <div class="tab-content" id="custom-tabs-three-tabContent">
			          <div id="letter" style="margin-bottom: 20px;">
			        		<h4 style="color: rgb(94, 94, 94); font-weight: 600;">연차 사용 대장</h4>
					  </div>
	                  <div class="card">
			              <div class="card-body p-0">
			                <table class="table" style="text-align: center;">
			                  <thead>
			                    <tr>
			                      <th style="width: 20%">연차 종류</th>
			                      <th style="width: 40%">사용 날짜</th>
			                      <th style="width: 20%">사용 연차</th>
			                      <th style="width: 20%">세부 내용</th>
			                    </tr>
			                  </thead>
			                  <tbody>
				                  <c:forEach items="${alvUsedList}" var="alv">
				                    <tr>
				                      <td>${alv.lvName}</td>
				                      <td>${alv.during}</td>
				                      <td>${alv.alvReduce}</td>
				                      <td>${alv.lvReason}</td>
				                    </tr>
				                  </c:forEach>
			                  </tbody>
			                </table>
			              </div>
				  		  <!-- 페이징 -->
						  <div class="card-footer clearfix" style="width: 100%; margin: auto; text-align: center;">
			                <ul class="pagination pagination-m m-2" style=" margin: auto; color: black; padding-left: 25%; padding-right: 25%;">
			             	  <c:if test="${page.startPage != 1}">
				                  <li class="page-item"><a class="page-link" href="${root}/leave/lvUsedList/${page.startPage - 1}" style="color: rgb(14, 104, 225); font-weight: bold;">&laquo;</a></li>&nbsp;
							  </c:if>
		
							   <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
			                   <li class="page-item">
							  	  <c:if test="${page.currentPage != i and i <= page.lastPage}">
									  <a class="page-link" href="${root}/notice/list/${i}" style="color: rgb(14, 104, 225);">${i}</a>&nbsp
							 	  </c:if> 
							 	 
							  	  <c:if test="${page.currentPage == i and i <= page.lastPage}">
									   ${i}&nbsp
							   	  </c:if>
							   </li>	  
							   </c:forEach>
							
							  <c:if test="${page.endPage < page.lastPage}">
								<li class="page-item"><a class="page-link" href="${root}/leave/lvUsedList/${page.endPage + 1}" style="color: rgb(14, 104, 225); font-weight: bold;">&raquo;</a></li>
							  </c:if>
			                  
			                </ul>
		                  </div>
			            </div>
	                </div>
	              </div>
	            </div>
	            
          