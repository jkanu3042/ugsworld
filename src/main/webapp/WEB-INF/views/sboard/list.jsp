<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<%@include file="../include/header.jsp"%>
	
	
	<section class="listings">
		<div class="wrapper">
			<ul class="properties_list">
			<c:forEach items="${list}" var="boardVO">
				<li>
					<a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}">
						<img src="/resources/LaCasa/img/property_1.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$2500</span>
					<div class="property_details">
						<h1>
							<a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}">${boardVO.title}</a>
							<span>[${boardVO.replycnt}]</span>
							<span class="property_size">
								<small> / 조회수 : ${boardVO.viewcnt }</small>
							</span>
						</h1>
						<h2> ${ boardVO.writer } 
							<span class="property_size">
							(<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate }" />)
							</span>
						</h2>
					</div>
				</li>
			</c:forEach>
			</ul>
			
			<div class='box-body' align="center">
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---
						</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							제목
						</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							내용
						</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							작성자
						</option>
					</select> 
					<input type="text" name='keyword' id="keywordInput"	value='${cri.keyword }'>
					<button id='searchBtn' class="btn btn-primary">Search</button>
					<button id='newBtn' class="btn btn-default">New Board</button>
			</div>
			
			
			
			<div class="text-center">
					<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<li
							<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
					</c:if>
					</ul>
			</div>
	</div>

</section>	<!--  end listing section  -->


<script>
	var result = '${msg}';
	
	if(result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	
</script>
<script>
$(document).ready(function(){
	$('#searchBtn').on("click", function(event){
		self.location = "list" + '${pageMaker.makeQuery(1)}'
							   + "&searchType="
							   + $("select option:selected").val()
							   + "&keyword="+$('#keywordInput').val();
	});
	
	$('#newBtn').on("click", function(event){
		
		self.location="register";
	
	});
	
	
	
	
});


</script>



<%@include file="../include/footer.jsp"%>