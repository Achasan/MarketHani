<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓하니 :: 오늘의 장보기, 마켓하니</title>
<%-- import product_review_list.css --%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/product_review_list.css" />
	
<script type="text/javascript">

function sort(p_num, how) {
	
	location.href='user_product_review_list.do?p_num=' + 227 + '&sort=' + 'new'; 
	
	console.log(p_num);
	
}//제품 리스트 정렬방식을 전달하여 액션을 호출하는 메서드


</script>
</head>
<body>



	<%-- 상품 후기 게시판  --%>
<body style="overflow-y: hidden;">
	<div id="contents-wrapper" class="goods_board">
		<div
			class="xans-element- xans-product xans-product-additional detail_board  ">
			<div class="board">
				<span class="line"></span>
				<form name="frmList">

					<div class="title_txt">
						<h2>PRODUCT REVIEW</h2>
						<div class="sort-wrap">
							<ul class="list_type1 old">
								<li><span class="ico"></span>
									<p class="txt">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의
										없이 담당 게시판으로 이동될 수 있습니다.</p></li>
								<li><span class="ico"></span>
									<p class="txt">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내
										1:1문의에 남겨주세요.</p></li>
							</ul>


							<div class="sort" style="bottom: -9px">
									<%-- <button onclick="location.href='user_product_review_list.do?sort='new'&p_num=227">테스트</button> --%>
									<select onclick="sort('${productNo}', value)">
										<option value="new">최근등록순</option>
										<option value="2" >좋아요많은순</option>
										<option value="hit">조회많은순</option>
									</select>
							</div>
						</div>
					</div>

				
					<table class="xans-board-listheader" width="100%" border="0"
						cellpadding="0" cellspacing="0">
						<caption style="display: none">구매후기 제목</caption>
						<colgroup>
							<col style="width: 70px;">
							<col style="width: auto;">
							<%-- <col style="width: 51px;"> 회원등급 --%>
							<col style="width: 128px;">
							<%-- 77px인데 회원등급 제거해서 128로 변경 --%>
							<col style="width: 100px;">
							<%-- <col style="width: 40px;">  도움--%>
							<col style="width: 80px;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="col" class="input_txt">번호</th>
								<th scope="col" class="input_txt">제목</th>
								<!-- <th scope="col" class="input_txt">
								<span class="screen_out">회원 등급</span>
							</th> -->
								<th scope="col" class="input_txt">작성자</th>
								<th scope="col" class="input_txt">작성일</th>
								<th scope="col" class="input_txt">조회</th>
							</tr>
						</tbody>
					</table>
					
					
					<%--공지글 임의로 작성 --%>
					<div class="reviewlist">
					<table class="xans-board-listheaderd tbl_newtype1" width="100%"
						cellpadding="0" cellspacing="0">
						<caption style="display: none">구매후기 내용</caption>
						<colgroup>
							<col style="width: 70px;">
							<col style="width: auto;">
							<%-- <col style="width: 51px;"> 회원등급--%>
							<col style="width: 128px;">
							<%-- 77px인데 회원등급 제거해서 128로 변경 --%>
							<col style="width: 100px;">
							<%-- <col style="width: 40px;"> --%>
							<col style="width: 80px;">
						</colgroup>
							
							<%--공지글 임의로 작성 --%>
						
						<td align="center" width="70px">공지</td>
						<td class="subject">
							<div>금주의 Best 후기 안내</div>
						</td>
						<td class="user_grade">MarketHani</td>
						<td class="time">2019-11-01</td>
						<td><span class="review-hit-cnt">436025</span></td>
					</table>
					</div>
					
					<div class="reviewlist">
					<table class="xans-board-listheaderd tbl_newtype1" width="100%"
						cellpadding="0" cellspacing="0">
						<caption style="display: none">구매후기 내용</caption>
						<colgroup>
							<col style="width: 70px;">
							<col style="width: auto;">
							<%-- <col style="width: 51px;"> 회원등급--%>
							<col style="width: 128px;">
							<%-- 77px인데 회원등급 제거해서 128로 변경 --%>
							<col style="width: 100px;">
							<%-- <col style="width: 40px;"> --%>
							<col style="width: 80px;">
						</colgroup>
						
						<td align="center" width="70px">공지</td>
						<td class="subject">
							<div>상품 후기 적립금 정책 안내</div>
						</td>
						<td class="user_grade">MarketHani</td>
						<td class="time">2019-11-01</td>
						<td><span class="review-hit-cnt">235169</span></td><%--공지글 임의로 작성 end --%>
						</table>
					</div>
								
						<c:set var="list" value="${List }" />
						<c:if test="${!empty list }">
							<c:forEach items="${list }" var="dto">
								<div class="reviewlist">
									<table class="xans-board-listheaderd tbl_newtype1" width="100%"
										cellpadding="0" cellspacing="0">
										<caption style="display: none">구매후기 내용</caption>
										<colgroup>
											<col style="width: 70px;">
											<col style="width: auto;">
											<%-- <col style="width: 51px;"> 회원등급--%>
											<col style="width: 128px;">
											<%-- 77px인데 회원등급 제거해서 128로 변경 --%>
											<col style="width: 100px;">
											<%-- <col style="width: 40px;"> --%>
											<col style="width: 80px;">
										</colgroup>


										<tr>
											<input type="hidden" name="index" value="1">
											<input type="hidden" name="image" value="true">
											
											<td align="center">${dto.getR_num() }</td>
											<td class="subject"><a
												href="<%=request.getContextPath()
						%>/user_product_review_content.do?p_num=${dto.getP_num() }&no=${dto.getR_num()}&page=${page }">${dto.getR_title() }</a></td>
											<td>${dto.getUser_id() }</td>
											<td class="time">${dto.getR_date() }<%-- <fmt:formatDate value="${dto.getR_date() }" pattern="yyyy-MM-dd" /> --%></td>
											<td>${dto.getR_hit() }</td>

										</tr>
									</table>
								</div>
							</c:forEach>
						</c:if>

						<c:if test="${empty list }">
							<tr>
								<td colspan="5" align="center">
									<h3>검색된 게시물이 없습니다.....</h3>
								</td>
							</tr>
						</c:if>
				</form>

				<p id="p_btnReview">
						<span id="btnReview" style="line-height:30px; width:130px;" 
						onclick="location.href='user_product_review_write.do?p_num=${productNo }'">후기쓰기
						</span>
						
				
					</p>
			</div>
		</div>

	</div>
	
	<%--페이징 처리 시작 --%>
	<br>
	<div class="page_wrap">
	<div class="page_nation" align="center"> <%-- 페이징 처리 div --%>
	<c:if test="${page == 1 }">
		<a class="first" 
			href="<%=request.getContextPath()%>/user_product_review_list.do?page=1&p_num=${productNo }&page=1"></a>
		<a class="prev" 
			href="<%=request.getContextPath() %>/user_product_review_list.do?page=${startBlock}&p_num=${productNo }&page=1"></a>
	</c:if>
	
	<c:if test="${page != 1 }">
		<a class="first" 
			href="<%=request.getContextPath()%>/user_product_review_list.do?page=1&p_num=${productNo }&page=1"></a>
		<a class="prev" 
			href="<%=request.getContextPath() %>/user_product_review_list.do?page=${startBlock}&p_num=${productNo }"></a>
	</c:if>
	

	<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
		<c:if test="${i == page }">
			<b><a id="on"
				href="<%=request.getContextPath() %>/user_product_review_list.do?page=${i}&p_num=${productNo }">${i }</a></b>
		</c:if>

		<c:if test="${i != page }">
			<a href="user_product_review_list.do?page=${i}&p_num=${productNo }">${i }</a>
		</c:if>
	</c:forEach>

	<c:if test="${page == allPage }">
		<a class="next" 
			href="<%=request.getContextPath() %>/user_product_review_list.do?page=${allPage}&p_num=${productNo }"></a>
		<a class="last" 
			href="<%=request.getContextPath() %>/user_product_review_list.do?page=${allPage}&p_num=${productNo }"></a>
	</c:if>
	
	<c:if test="${page != allPage }">
		<a class="next"
			href="<%=request.getContextPath() %>/user_product_review_list.do?page=${page+1 }&p_num=${productNo }"></a>
		<a class="last"
		    href="<%=request.getContextPath() %>/user_product_review_list.do?page=${allPage}&p_num=${productNo }"></a>
	</c:if>
	
	
	</div>  <%-- 페이징 처리 div end--%>
	</div>




</body>
</html>