<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<title>마켓하니 :: 오늘의 장보기, 마켓하니</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<%-- import header.css --%>
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/css/header.css" />
	<link rel="icon"
		href="<%=request.getContextPath()%>/img/favicon/favicon-32x32.ico"
		type="image/x-icon" sizes="16x16">
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script defer src="<%=request.getContextPath()%>/js/header/header.js"></script>
	<script defer
		src="<%=request.getContextPath()%>/js/header/location_postcode.js"></script>
	
	<%-- import footer.css --%>
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/css/footer.css" />

	<%-- import product_detail.css --%>
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/css/product_detail.css">

	<%-- include product_qna.css --%>
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/css/product_qna.css" />

	<%-- jQuery library (served from Google) --%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		
	<%-- import product_detail.js --%>
	<script defer src="${pageContext.request.contextPath}/js/product/product_detail.js"></script>
	<script defer src="${pageContext.request.contextPath}/js/product/productqty.js"></script>
	
	<%-- QnA 게시판 그리기 --%>
	<script>	
	
		let p_num = ${productCont.getP_num()};
		
		$(document).ready(function() {
			qnaList(p_num, 1, '${user_id }');
		});
		
	</script>
</head>

<body>

	<jsp:include page="../include/header.jsp" />

	<div id="body_product">
	
	<br>
		<c:set var="dto" value="${productCont }" />
		
		<c:if test="${!empty dto }">
	
		<div id="main">
			<div id="content" style="opacity: 1;">
				<div class="section_view">

					<div id="shareLayer">
						<div class="layer_share">
							<div class="inner_layersns">
								<h3 class="screen_out">SNS 공유하기</h3>
								<ul class="list_share">
									<li><a class="btn btn_fb" data-sns-name="페이스북"
										data-sns="facebook" href="#none"><img
											src="./img/product/ico_facebook.jpg"
											alt="페이스북"><span class="txt">공유하기</span></a></li>
									<li><a class="btn btn_tw" data-sns-name="트위터"
										data-sns="twitter" href="#none"><img
											src="./img/product/ico_twitter.jpg"
											alt="트위터"><span class="txt">트윗하기</span></a></li>
									<li class="btn_url">
									<input type="text" class="inp"
										value="http://localhost:8282/MarketHani/user_product_view.do?p_num=2" readonly="readonly"> 
										
										<a class="btn_copy off" data-sns-name="링크 복사" data-sns="copy" href="#none" >URL 복사<img
											src="./img/product/ico_checked_x2.jpg" alt=""></a></li>
								</ul>
							</div>
						</div>
										
					</div>
					
					<div id="sectionView">
						<div class="inner_view">
						
							<div class="thumb">
								<img
									src="<%=request.getContextPath() %>/upload/product/${dto.getP_image()}"
									class="bg">
							</div>

							<p class="goods_name">
								<input id="p_num" type="hidden" name="p_num" value="${param.p_num}"/>
								<input id="p_qty" type="hidden" name="p_qty" value="${dto.getP_qty()}"/>
								<span class="btn_share">
									<button id="btnShare" onclick="onDisplay();">공유하기</button>
								</span> 
								<strong class="name">[${dto.getP_seller()}]${dto.getP_name() }</strong> 
								<span class="short_desc">${dto.getP_name_cont() }</span>
							</p>
						<c:if test="${dto.getP_discount() !=0  }">
							<p class="goods_dcinfo">회원할인가</p>
							</c:if>
							<p class="goods_price">
								<%-- 로그인을 했을 경우 --%>
								<c:if test="${!empty user_id }">
								<span class="position"> 
								<span class="dc"> 
								<span class="dc_price">
										<fmt:formatNumber value="${dto.getP_price() * (100-dto.getP_discount()) / 100}" pattern="0,000"/><span class="won">원</span>
								<c:if test="${dto.getP_discount() !=0  }">
								<span class="dc_percent">${dto.getP_discount() }
										<span class="per">%</span></span>
								</c:if>
						 			 </span> 
								</span> <%--회원 할인가 end--%>
 								
 								<%-- 할인 전 금액 --%>
 								<c:if test="${dto.getP_discount() !=0  }">
 								<a class="original_price">
 								<span class="price">
 								<fmt:formatNumber type="number" value="${dto.getP_price() }" />원	    
								</span>
								<img src="./img/product/question_product.JPG" class="product_ico"></a></c:if>
								
								</span><%--position end --%>
					
								<span class="txt_benefit">
								<span class="not_login"> <%-- --%> 
								<span class="ico_grade grade0">5% 적립</span>
								</span>
								<span class="point">개당 ${dto.getP_point() }원</span>
								</span>
								</c:if>
								
								<%-- 로그인을 안했을 경우 --%>
								<c:if test="${empty user_id }">
								<span class="position">
								<span class="dc"> 
								<span class="dc_price">
										<fmt:formatNumber value="${dto.getP_price() * (100-dto.getP_discount()) / 100}" pattern="0,000"/><span class="won">원</span>
								<c:if test="${dto.getP_discount() !=0  }">
								<span class="dc_percent">${dto.getP_discount() }
										<span class="per">%</span></span>
								</c:if>
						 		</span></span><%--회원 할인가 end--%>
								<%-- 할인 전 금액 --%>
 								<c:if test="${dto.getP_discount() !=0  }">
 								<a class="original_price">
 								<span class="price">
 								<fmt:formatNumber type="number" value="${dto.getP_price() }" />원	    
								</span>
								<img src="./img/product/question_product.JPG" class="product_ico"></a></c:if>
								
								</span><%--position end --%>
								
								<span class="not_login"> 
								<span>로그인 후, 적립혜택이 제공됩니다.</span>
								</span>
								</c:if>
								
							</p>
							<%-- --%>
							<div class="goods_info">
								<dl class="list fst">
									<dt class="tit">판매단위</dt>
									<dd class="desc">1팩</dd>
								</dl>

								<dl class="list">
									<dt class="tit">배송구분</dt>
									<%-- --%>
									<dd class="desc">샛별배송/택배배송</dd>
								</dl>
								<%-- --%>
								<dl class="list">
									<dt class="tit">포장타입</dt>
									<dd class="desc">
										상온/종이포장 <br> <strong class="emph">택배배송은 에코포장이
											스티로폼으로 대체됩니다.</strong>
									</dd>
								</dl>
								<%-- --%>
							</div>
							<%-- --%>
						</div>
						<%-- --%>
					</div>

					<%--cart_put --%>
					<div id="cartPut">
						<div class="cart_option cartList cart_type2">
							<div class="inner_option">
								<!---->
								<!---->
								<div class="in_option">
									<div class="list_goods">
										<!---->
										<!---->
										<!---->
										<ul id="ul_product" class="list list_nopackage">
											<li class="on"><span class="btn_position">
													<button id="button_product" type="button" class="btn_del">
														<span class="txt">삭제하기</span>
													</button>
											</span> <span class="name"> <!----> [조공] 나 게살 좋아해 스틱 <!---->
											</span> 
											
											<span class="tit_item">구매수량</span>
												<div class="option">
													<span class="count">
													  <input id="plusbtn" type='button' value='+'/>
														<input id="minusbtn" type='button' value='-'/>
														<span id='result'>1</span> 
													</span> <!-- <span class="price"> <span class="dc_price">2,900원</span></span> -->
												</div>
											</li>
										</ul>
									</div>
									<div class="total">
										<div class="price">
											<!---->
											<strong class="tit">총 상품금액 :</strong> 
											<span class="sum">
												<span class="num" id="totalPrice">
													<fmt:formatNumber value="${dto.getP_price() * (100-dto.getP_discount()) / 100}" pattern="0,000"/>													
												</span>
												<span class="won">원</span>
											</span>
										</div>
										
										<c:if test="${empty user_id }">
										<p class="txt_point">
											<span class="ico">적립</span> <span class="no_login"> <!---->
												<span>로그인 후, 적립혜택 제공</span>
											</span>
											<!---->
										</p>
										</c:if>
										
										<c:if test="${!empty user_id }">
										<p class="txt_point">
											<span class="ico">적립</span> <span class="no_login"> <!---->
												<span>구매 시 ${dto.getP_point() }원 적립</span>
											</span>
											<!---->
										</p>
										</c:if>
										
									</div>
								</div>
								<div class="group_btn off">
									<div class="view_function">
										<button id="button_product" type="button"
											class="btn btn_alarm">재입고 알림</button>
									</div>
									<span class="btn_type1">
										<button id="addCart_btn" type="button" class="txt_type">장바구니 담기</button> <!---->
									</span>
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
								</div>
								<!---->
							</div>
						</div>
						<div class="cart_option cartList cart_type1">
							<div class="inner_option">
								<!---->
								<!---->
								<div class="in_option">
									<div class="list_goods">
										<div class="bar_open">
											<button id="button_product" type="button" class="btn_close">
												<span class="ico">상품 선택</span>
											</button>
										</div>
										<!---->
										<!---->
										<!---->
									</div>
									<!---->
								</div>
								<div class="group_btn off">
									<div class="view_function">
										<button id="button_product" type="button"
											class="btn btn_alarm">재입고 알림</button>
									</div>
									<span class="btn_type1"><button id="button_product"
											type="button" class="txt_type">장바구니 담기</button> <!----> </span>
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
									<!---->
								</div>
								<!---->
							</div>
						</div>
						<div class="cart_option cart_type3 notify_option">
							<div class="inner_option">
								<strong class="tit">재입고 알림 신청</strong>
								<p class="name_deal">[조공] 나 게살 좋아해 스틱</p>
								<!---->
								<!---->
								<p class="notice">
									<span class="ico">·</span> 상품이 입고되면 앱 푸시 또는 알림톡으로 알려 드립니다.
								</p>
								<div class="group_btn layer_btn2">
									<span class="btn_type2">
										<button id="button_product" type="button" class="txt_type">취소</button>
									</span> <span class="btn_type1">
										<button id="button_product" type="button" class="txt_type">신청하기</button>
									</span>
								</div>
							</div>
						</div>
						<div class="cart_option cart_result cart_type3">
							<div class="inner_option">
								<button id="button_product" type="button" class="btn_close1">pc레이어닫기</button>
								<p class="success">
									상품 구매를 위한 <span class="bar"></span> 배송지를 설정해주세요
								</p>
								<div class="group_btn layer_btn2">
									<span class="btn_type2">
										<button id="button_product" type="button" class="txt_type">취소</button>
									</span> <span class="btn_type1">
										<button id="button_product" type="button" class="txt_type">
											<span class="ico_search"></span> 주소 검색
										</button>
									</span>
								</div>
							</div>
						</div>
						<form name="frmBuyNow" method="post"
							action="/shop/order/order.php">
							<input id="input_product" type="hidden" name="mode"
								value="addItem"> <input id="input_product" type="hidden"
								name="goodsno" value="">
						</form>
						<form name="frmWishlist" method="post"></form>
					</div>


				</div>
			</div>
		</div> <%-- div.main end --%>
		</c:if>
	
		<%-- 페이지 위로 올리는 버튼  --%>
		<div id="topUp">
		<a href="#top" id="pageTop" class="on"
		   style="opacity: 1; bottom: 25px;">맨 위로가기</a>
		</div>
	
			<%-- 상단 탭  --%>
		
			<ul id="ul_product" class="goods-view-infomation-tab-group">

				<li><a href="#content1"
					class="goods-view-infomation-tab-anchor __active">상품설명</a></li>

				<li><a href="#content2"
					class="goods-view-infomation-tab-anchor __active">상세정보</a></li>

				<li><a href="#content3"
					class="goods-view-infomation-tab-anchor __active">후기</a></li>

				<li><a href="#content4"
					class="goods-view-infomation-tab-anchor __active">문의</a></li>
			</ul>
	
		
		<div id="contents_top" align="center">	
		
			<%-- 상품설명 이미지  --%>
			<div id="content1">
					<img
						src="<%=request.getContextPath() %>/upload/product/${dto.getP_contents()}"
						align="center" width="1010px" height="100%"> 
			</div> <%-- #content1 scroll end --%>		
		
			<%-- 상세정보 이미지  --%>
			<div id="content2">		
					<img
						src="<%=request.getContextPath() %>/upload/product/${dto.getP_contents_spec()}"
						align="center" width="1010px" height="100%"> <br> <br>
					<br> <br> <br> <br> <br>
		
			</div> <%-- #content2 scroll end --%>
		
			<%-- 상품 후기 게시판  --%>
			<div id="content3">	
				<div class="review_container">
				
					<iframe id="inreview"
						src="<%=request.getContextPath()%>/user_product_review_list.do?p_num=${dto.getP_num()}"
						frameborder="0" class="goods-view-infomation-board">
						
						<%-- 여기있던 내용 전부 삭제함 --%>
						
					</iframe>
				</div>
			</div> <%-- #content3 scroll end --%>
		
		<div class="qna_area"> <%-- box-sizing: border-box; 적용 --%>
			<%-- 상품 문의 게시판  --%>
			<div id="content4">	
				<div class="qna_container">
					<div class="qna_header" align="left">
						<strong>PRODUCT Q&A</strong>
						<ul>
							<li>상품에 대한 문의를 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
							<li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <a>1:1문의</a>에 남겨주세요.</li>
						</ul>
					</div>
					
					<div class="qna_content">
						<div class="qna_content_title">
							<div style="width: 710px;">제목</div>
							<div>작성자</div>
							<div>작성일</div>
							<div>답변상태</div>
						</div>
						
						
						<%-- QnA 공지부분 --%>
						<ul class="qna_notice_list">
							<li class="qna_notice_item">
								<div class="notice-cell">
									<span>공지</span>
									<strong>판매 (일시)중단 제품 안내 (21-11-12 업데이트)</strong>
								</div>
								<div class="item-cell"><p>Marketkurly</p></div>
								<div class="item-cell"><p>2021-11-18</p></div>
								<div class="item-cell"><p>-</p></div>
							</li>
						</ul>
						
					
						<%-- QnA 리스트 받아오는 영역 --%>
						<ul class="qna_content_list"></ul>						
						
						<%-- 문의하기, 페이지 이동 버튼 --%>
						<div class="qna_button_area">
							<div class="qna_paging_nav">
								<button type="button" class="prev"><span></span></button>
								<button type="button" class="next"><span></span></button>
							</div>
							
							<c:if test="${empty user_id }">
								<button class="qna_write_btn" onclick="alert('로그인 후 작성하실 수 있습니다');">
									<span>문의하기</span>
								</button>
							</c:if>
							
							<c:if test="${!empty user_id }">
								<button class="qna_write_btn" onclick="showWrite();">
									<span>문의하기</span>
								</button>
							</c:if>
							
						</div>
					</div> 
				</div>		
			</div> 
		</div> 
	</div> 
	
	<div class="qna_area"> <%-- box-sizing: border-box; 적용 --%>	
		<%-- 모달 오버레이(공용) --%>
		<div class="modal_overlay">
		</div>
		
		<%-- 모달: "비밀글입니다" 경고창 --%>
		<div class="modal_dialog warning">
			<p>비밀글입니다</p>
			<button class="modal_button" onclick="hideSecret();"><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
		</div>
		
		<%-- 모달: 작성 완료 메시지 --%>
		<div class="modal_dialog confirm">
			<p>문의가 정상적으로 등록되었습니다.</p>
			<button class="modal_button" onclick="location.reload(); hideWriteConfirm();"><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
		</div>
		
		<%-- 모달: 작성 실패 메시지 --%>
		<div class="modal_dialog failure">
			<p>문의 등록에 실패하였습니다</p>
			<button class="modal_button" onclick="hideWriteFailure();"><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
		</div>
		
		<%-- 모달: "작성한 문의를 삭제하시겠습니까?"  --%>
		<div class="modal_dialog delete">
			<p>작성한 문의를 삭제하시겠습니까?</p>
			<button class="modal_button delete1" onclick="hideDelete();"><strong>취소</strong></button>
			<button class="modal_button delete2" onclick=""><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
		</div>
		
		<%-- 모달: 삭제 완료 메시지 --%>
		<div class="modal_dialog delete_confirm">
			<p>삭제되었습니다</p>
			<button class="modal_button" onclick="hideDeleteConfirm(); location.reload();"><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
		</div>
		
		<%-- 모달: 수정 완료 메시지 --%>
		<div class="modal_dialog revise_confirm">
			<p>수정이 완료되었습니다</p>
			<button class="modal_button" onclick="hideReviseConfirm(); location.reload();"><strong>확인</strong></button> <%-- 확인버튼 클릭 시 모달함수 호출 --%>
		</div>
		
		<%-- 문의하기 버튼 클릭 시 모달로 띄워줄 질문 작성창 --%>
		<div class="modal_dialog_qna write">
			<form action="user_qna_write.do" method="post">	<%-- 작성시 write_qna.do로 맵핑 --%>
				
				<input type="hidden" value="${dto.getP_num() }" name="p_num">	<%-- 제품번호 : p_num --%>
				<input type="hidden" value="${user_id }" name="user_id"> <%-- 세션에서 user_id 갖고와야함 --%>
				
				<table class="modal_qna_write">
					<tr class="modal_qna_title" height="53px">
						<td colspan="2">
							<strong>상품 문의하기</strong>
							<img src="<%=request.getContextPath() %>/img/product/qna_close.svg" onclick="hideWrite();"> <%-- 상단 우측 'X' 버튼 --%>
						</td>
					</tr>
					<tr class="modal_qna_header" height="90px">
						<td width="100px">
							<div class="modal_qna_image">
								<img width="72px" height="72px" src="<%=request.getContextPath() %>/upload/product/${dto.getP_image()}">
							</div>
						</td>
						<td><strong>[${dto.p_seller}]${dto.p_name }</strong></td>
					</tr>
					<tr class="modal_write_title" height="70px">
						<td width="100px">제목</td>
						<td><input class="modal_input_title" name="qna_title"></td>	<%-- 제목 : qna_title --%>
					</tr>
					<tr class="modal_write_content" height="260px">
						<td width="100px" rowspan="2">내용</td>					<%-- 내용 : qna_content --%>
						<td><textarea class="modal_input_content" maxlength="5000" name="qna_content"></textarea></td>
					</tr>
					<tr class="modal_write_secret" height="50px">
						<td>
							<label onclick="isSecret();">
								<input class="secret_check" type="checkbox" name="is_secret"> <%-- 비밀글여부 : is_secret --%>
								<span class="secret_check_ico"> </span>
								<span>비밀글로 문의하기</span>
							</label>
						</td>
					</tr>
					<tr class="modal_write_button" height="77px" align="center">
						<td colspan="2">
							<button onclick="hideWrite();">취소</button>
							<button onclick="hideWrite(); showWriteConfirm();" type="submit">등록</button>
						</td>
					</tr>
				</table>
			</form>				
		</div><%-- .modal_dialog qna_write end --%>	
		
		<%-- 수정하기 버튼 클릭 시 모달로 띄워줄 작성창 --%>
		<div class="modal_dialog_qna revise">
			
			<form action="user_qna_revise.do" method="post">	<%-- 작성시 revise_qna.do로 맵핑 --%>
				
				<input type="hidden" value="${dto.getP_num() }" name="p_num">	<%-- 제품번호 : p_num --%>
				<input type="hidden" value="test_user" name="user_id"> <%-- 세션에서 user_id 갖고와야함 --%>
				
				<table class="modal_qna_write">
					<tr class="modal_qna_title" height="53px">
						<td colspan="2">
							<strong>문의내용 수정</strong>
							<img src="<%=request.getContextPath() %>/img/product/qna_close.svg" onclick="hideRevise();"> <%-- 상단 우측 'X' 버튼 --%>
						</td>
					</tr>
					<tr class="modal_qna_header" height="90px">
						<td width="100px">
							<div class="modal_qna_image">
								<img width="72px" height="72px" src="<%=request.getContextPath() %>/upload/product/${dto.getP_image()}">
							</div>
						</td>
						<td><strong>[${dto.p_seller}]${dto.p_name }</strong></td>
					</tr>
					<tr class="modal_write_title" height="70px">
						<td width="100px">제목</td>
						<td><input class="modal_input_title revise" name="qna_title" value=""></td>	<%-- 제목 : qna_title --%>
					</tr>
					<tr class="modal_write_content" height="220px">
						<td width="100px" rowspan="2">내용</td>					<%-- 내용 : qna_content --%>
						<td><textarea class="modal_input_content revise" maxlength="5000" name="qna_content"></textarea></td>
					</tr>
					<tr class="modal_write_secret" height="50px">
						<td>
							<label onclick="isSecretRevise();">
								<input class="secret_check revise" type="checkbox" name="is_secret"> <%-- 비밀글여부 : is_secret --%>
								<span class="secret_check_ico revise"> </span>
								<span>비밀글로 문의하기</span>
							</label>
							<br><br>
						</td>
					</tr>
					<tr class="modal_write_button" height="77px" align="center">
						<td colspan="2">
							<button onclick="hideRevise();">취소</button>
							<button onclick="hideRevise(); showReviseConfirm();" type="submit">등록</button>
						</td>
					</tr>
				</table>
			</form>				
		</div><%-- modal_dialog_qna revise end --%>
	</div><%-- qna_area end --%>
	
	</div>	
	<jsp:include page="../include/footer.jsp" />

<%-- </body>
</html> --%>