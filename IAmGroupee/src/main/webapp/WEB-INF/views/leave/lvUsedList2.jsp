<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.iag.leave.entity.LvUsedListDto"%>

	            <div class="card card-primary card-outline card-tabs" style="height: 49%;">
	              <div class="card-body">
	                <div class="tab-content" id="custom-tabs-three-tabContent">
			        	<div id="letter" style="margin-bottom: 20px;">
			        		<h4 style="color: rgb(94, 94, 94); font-weight: 600;">휴가 사용 대장</h4>
						</div>
	                  <div class="card">
			              <div class="card-body p-0">
			                <table class="table" style="text-align: center;">
			                  <thead>
			                    <tr>
			                      <th style="width: 30%">휴가 종류</th>
			                      <th style="width: 40%">사용 날짜</th>
			                      <th style="width: 30%">세부 내용</th>
			                    </tr>
			                  </thead>
			                  <tbody>
				                  <c:forEach items="${lvUsedList}" var="lv">
				                    <tr>
				                      <td>${lv.lvName}</td>
				                      <td>${lv.during}</td>
				                      <td>${lv.lvReason}</td>
				                    </tr>
				                  </c:forEach>
			                  </tbody>
			                </table>
			              </div>
				  		  <!-- 페이징 -->
						  <div class="card-footer clearfix" style="width: 100%; margin: auto; text-align: center;">
			                <ul class="pagination pagination-m m-2" style=" margin: auto; color: black; padding-left: 25%; padding-right: 25%;">
			             	  <c:if test="${page.startPage != 1}">
				                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225); font-weight: bold;">&laquo;</a></li>&nbsp;
								  <%-- <a href="${root}/notice/list/${page.startPage - 1}">이전</a> --%>
							  </c:if>
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">1</a></li>
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">2</a></li>
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">3</a></li>
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">4</a></li>
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">5</a></li>&nbsp;
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225); font-weight: bold;">&raquo;</a></li>
			                </ul>
		                  </div>
			            </div>
	                </div>
	              </div>
	            </div>