<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<%@include file="../include/header.jsp"%>
	<section class="search">
		<div class="wrapper">
			<form action="#" method="post">
				<input type="text" id="search" name="search" placeholder="What are you looking for?"  autocomplete="off"/>
				<input type="submit" id="submit_search" name="submit_search"/>
			</form>
			<a href="#" class="advanced_search_icon" id="advanced_search_btn"></a>
		</div>

		<div class="advanced_search">
			<div class="wrapper">
				<span class="arrow"></span>
				<form action="#" method="post">
					<div class="search_fields">
						<input type="text" class="float" id="check_in_date" name="check_in_date" placeholder="Check In Date"  autocomplete="off">

						<hr class="field_sep float"/>

						<input type="text" class="float" id="check_out_date" name="check_out_date" placeholder="Check Out Date"  autocomplete="off">
					</div>
					<div class="search_fields">
						<input type="text" class="float" id="min_price" name="min_price" placeholder="Min. Price"  autocomplete="off">

						<hr class="field_sep float"/>

						<input type="text" class="float" id="max_price" name="max_price" placeholder="Max. price"  autocomplete="off">
					</div>
					<input type="text" id="keywords" name="keywords" placeholder="Keywords"  autocomplete="off">
					<input type="submit" id="submit_search" name="submit_search"/>
				</form>
			</div>
		</div><!--  end advanced search section  -->
	</section><!--  end search section  -->
	


	<section class="listings">
		<div class="wrapper">
			<ul class="properties_list">
			<c:forEach items="${list}" var="boardVO">
				<li>
					<a href="/board/read?bno=${boardVO.bno}">
						<img src="/resources/LaCasa/img/property_1.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$2500</span>
					<div class="property_details">
						<h1>
							<a href="/board/read?bno=${boardVO.bno}">${boardVO.title}</a>
							<span>[${boardVO.replycnt}]</span>
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

			<div class="more_listing">
				<a href="/board/register" class="more_listing_btn">Create Post</a>
			</div>
		</div>
	</section>	<!--  end listing section  -->


<script>
	var result = '${msg}';
	
	if(result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>
<%@include file="../include/footer.jsp"%>