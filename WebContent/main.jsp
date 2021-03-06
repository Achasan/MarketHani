<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>마켓하니 :: 오늘의 장보기, 마켓하니</title>

<%-- import main.css --%>
<link rel="stylesheet" type="text/css" href="css/main.css"/>

<%-- import header.css --%>
<link rel="stylesheet" type="text/css" href="css/header.css"/>
<link rel="icon" href="<%=request.getContextPath() %>/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script defer src="<%=request.getContextPath() %>/js/header/header.js"></script>
<script defer src="<%=request.getContextPath() %>/js/header/location_postcode.js"></script>

<%-- import footer.css --%>
<link rel="stylesheet" type="text/css" href="css/footer.css"/>

<!-- jQuery library (served from Google) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />

<style>
    .bx-wrapper {border:0;background:#fbfbfb;box-shadow:none;}
    

.main_type1 .bx-controls-direction .bx-prev {
    background: url(./img/main/ico_prev1_x1.png) 0 0 no-repeat;
    padding: 9px;
} 

.main_type1 .bx-controls-direction .bx-next {
    background: url(./img/main/ico_next1_x1.png) 0 0 no-repeat;
    padding: 9px;
}  


.main_type2 .bx-controls-direction .bx-prev,
.main_type4 .bx-controls-direction .bx-prev
 {
    background: url(./img/main/btn_prev_default.png) 0 0 no-repeat;
    padding: 9px;
} 

.main_type2 .bx-controls-direction .bx-next,
.main_type4 .bx-controls-direction .bx-next
 {
    background: url(./img/main/btn_next_default.png) 0 0 no-repeat;
    padding: 9px;
} */
    
    
    </style> 

<script>
     $(document).ready(function(){
            $('.bannerSlide').bxSlider({
                auto: true,
                pager: false,
                slideWidth: 1920
            });

            $('.itemSlide').bxSlider({
                mode: 'horizontal',// 가로 방향 수평 슬라이드
                speed: 500, // 이동 속도를 설정
                pager: false, // 현재 위치 페이징 표시 여부 설정
                moveSlides: 1, // 슬라이드 이동시 개수
                slideWidth: 1050, // 슬라이드 너비   (11/19 수정) 200 -> 1050
                slideHeight: 300,
                minSlides: 4, // 최소 노출 개수
                maxSlides: 4, // 최대 노출 개수
                slideMargin: 15, // 슬라이드간의 간격
                auto: true, // 자동 실행 여부
                autoHover: true, // 마우스 호버시 정지 여부
                controls: true // 이전 다음 버튼 노출 여부
            });

            $('.recipeSlide').bxSlider({
                mode: 'horizontal',// 가로 방향 수평 슬라이드
                speed: 500, // 이동 속도를 설정
                pager: false, // 현재 위치 페이징 표시 여부 설정
                moveSlides: 1, // 슬라이드 이동시 개수
                slideWidth: 338, // 슬라이드 너비
                slideHeight: 300,
                minSlides: 3, // 최소 노출 개수
                maxSlides: 3, // 최대 노출 개수
                slideMargin: 15, // 슬라이드간의 간격
                auto: true, // 자동 실행 여부
                autoHover: true, // 마우스 호버시 정지 여부
                controls: true // 이전 다음 버튼 노출 여부
            });
        });
</script>
</head>
<body>
	
	<jsp:include page="/include/header.jsp"/>
	
	<div id="haliMain">
	
	    <%-- 메인타입1 - 상단 배너 ( 이미지 슬라이더 사용) --%>
	    <div>
	        <div class="main_type1">
	            <div class="list_goods_0">
	                <%-- slide --%>
	                <ul class="bannerSlide">
	                    <li><a href="<%=request.getContextPath() %>/user_category.do?cat=A1&sort=new"><img src="<%=request.getContextPath() %>/img/main/9714a8f5-db34-45aa-ac9a-adbca7584f4e.webp" alt="이벤트배너"></a></li>
	                    <li><a href="<%=request.getContextPath() %>/user/user_event.jsp"><img src="<%=request.getContextPath() %>/img/main/2abed505-2b13-4d4d-878d-98ab6b8bee7a.webp" alt="이벤트배너"></a></li>
	                    <li><a href="<%=request.getContextPath() %>/user/user_event.jsp"><img src="<%=request.getContextPath() %>/img/main/e21e2f45-cd30-4eb8-b0f0-c818f6691f89.webp" alt="이벤트배너"></a></li>
	               			<li><a href="<%=request.getContextPath() %>/user/user_event.jsp"><img src="<%=request.getContextPath() %>/img/main/ec535b68-4063-4e73-a89e-34b1256a39ad.jpg" alt="이벤트배너"></a></li>
	                </ul>
	            </div>
	        </div> <%-- main_type1 end --%>
	    </div> <%-- --%>
	
	    <%-- 메인타입 2 - '이 상품 어때요?' ( 이미지 호버했을 때 확대, 슬라이더 사용 ) --%>
	    <div>
	        <div class="main_type2">
	            <div class="product_list">
	                <div class="tit_goods">
	                    <h3 class="tit">
	                    	<span class="name">이 상품 어때요?</span>
	                    </h3>
	                </div>
	                <%-- slide --%>
	                <div class="list_goods">
	                    <ul class="itemSlide">
	                        <li>
		                        <div class="good_thumb">
			                        <a href="">
			                        	<img src="<%=request.getContextPath() %>/upload/product/2021-12-6/edition18.jpg">
			                        </a>
		                        </div>
		                        <div class="info_goods">
		                            <span class="name"><a class="txt">[르자당] 레드 플라워 화병 꽂이</a></span>
		                            <span class="price">200,000원 </span> 
		                            <%-- <span class="cost">5,000원</span> --%>
		                        </div>
	                        </li>
	                        <li>
		                        <div class="good_thumb">
			                        <a href="">
			                        	<img src="<%=request.getContextPath() %>/upload/product/2021-12-4/beat1.jpg" alt="">
			                        </a>
		                       	</div>
		                        <div class="info_goods">
		                            <span class="name"><a class="txt">[KF365] PET 비트 2kg 박스</a></span>
		                            <span class="price">6,490원 </span> 
		                            <%--<span class="cost">12,530원</span>--%>
		                        </div>
	                        </li>
	                        <li>
	                        	<div class="good_thumb">
	                            <a href="<%=request.getContextPath() %>/user_product_view.do?p_num=165">
	                            	<img src="<%=request.getContextPath() %>/upload/product/2021-12-6/edition16.jpg" alt="">
	                            </a>
	                          </div>
	                          <div class="info_goods">
	                            <span class="name"><a class="txt">[랑꼬뉴]딸기 샤를로뜨 케이크</a></span>
	                            <span class="price">62,000원</span>
	                          </div>
	                        </li>                    
	                        <li>
	                        	<div class="good_thumb">
	                            <a href="">
	                            	<img src="<%=request.getContextPath() %>/upload/product/2021-12-5/stapleFood20.jpg" alt="">
	                            </a>
	                          </div>
	                            <div class="info_goods">
	                                <span class="name"><a class="txt">[오쥬 바이 로우즈] 치킨 파우치</a></span>
	                                <span class="price">3,500원</span>
	                            </div>
	                        </li>                    
	                        <li>
	                        	<div class="good_thumb">
	                            <a href="">
	                            	<img src="<%=request.getContextPath() %>/upload/product/2021-12-6/edition9.jpg" alt="">
	                            </a>
	                          </div>
	                          <div class="info_goods">
	                            <span class="name"><a class="txt">[네기] 스키야끼 2인 세트</a></span> 
	                            <span class="price">100,000원</span>
	                          </div>
	                        </li>
	                        <li>
	                        	<div class="good_thumb">
	                            <a href="">
	                            	<img src="<%=request.getContextPath() %>/upload/product/2021-12-4/paprika1.jpg" alt="">
	                            </a>
	                          </div>
	                          <div class="info_goods">
	                            <span class="name"><a class="txt">[KF365] 미니 파프리카 200g</a></span>
	                            <span class="price">3,990원</span>
	                          </div>
	                        </li>                    
	                    </ul>
	                </div>
	            </div>
	        </div> <%-- main_type2 end --%>
	    </div> <%-- --%>
	
	    <%-- 메인타입 3 - 지금 가장 핫한 상품( 이미지 호버했을 때 확대, 슬라이더 미사용 )  --%>
	    <div>
	        <div class="main_type3">
	            <div class="main_event">
	                <div class="tit_goods">
	                    <h3 class="tit">
	                        <a href="#" class="name">
	                            <span class="link_x1">지금 가장 핫한 상품</span>
	                        </a>
	                    </h3>
	                </div>
	                <div class="list_goods">
	                    <ul data-title="특가/혜택" data-section="event" class="list">
	                        <li data-index="1">
	                        	<div class="good_thumb">
		                        	<a href="#" class="thumb_goods">
		                        		<img src="<%=request.getContextPath() %>/upload/product/2021-12-6/seasonDessert24.jpg">
		                        	</a>
		                        </div>
	                            <div class="info_goods">
	                           	 	<span class="name">
	                            		<a class="txt">[오설록] 한라산 녹차케이크</a>
	                            	</span> 
	                            </div>		                   
	                        </li>
	                        <li data-index="2">
	                        		<div class="good_thumb">
		                        		<a href="#" class="thumb_goods">
		                        			<img src="<%=request.getContextPath() %>/upload/product/2021-12-4/cauliflower.jpg">
		                        		</a>
	                        		</div>                           
	                            <div class="info_goods">
	                                <div class="inner_info">
		                                <span class="name">
		                                	<a class="txt">[KF365]콜리플라워 1입</a>
		                                </span>	                              
	                                 </div>
	                            </div>
	                        </li>
	                        <li data-index="3">
	                        		<div class="good_thumb">
		                        		<a href="#" class="thumb_goods">
		                        			<img src="<%=request.getContextPath() %>/upload/product/2021-12-5/goods16.jpg">
		                        		</a>
	                            </div>    
	                            <div class="info_goods">
	                              <div class="inner_info">
	                                <span class="name">
	                                  <a class="txt">[바잇미X히끄]고양이 장난감 </a>
	                                </span> 
	                              </div>
	                            </div>
	                        </li>
	                    </ul>
	                </div>
	
	            </div>
	        </div>
	    </div> <%-- main_type3 end --%>
	
	    <!-- 메인타입 4 - '하니의 레시피' ( 이미지 호버했을 때 확대, 슬라이더 사용 ) -->
	    <div class="main_type4">
	        <div class="main_recipe">
	            <div class="tit_goods">
	                <h3 class="tit">
	                	<a href="#" class="name">
	                		<span class="link_x1">연말을 위한 하니 레시피</span>
	                	</a>
	                </h3>
	            </div>
	            <ul class="recipeSlide">
								<li>
									<div class="good_thumb">
										<a href="#">
											<img src="<%=request.getContextPath() %>/img/main/recipe1.png">
										</a>
									</div>
				          <div class="info_goods">
				            <span class="name"><a class="txt">나폴리탄 파스타</a></span>
				          </div>
								</li>
								<li>
									<div class="good_thumb">
										<a href="#">
											<img src="<%=request.getContextPath() %>/img/main/recipe2.png">
										</a>
									</div>
									<div class="info_goods">
				            <span class="name"><a class="txt">플랫 브레드 루꼴라 피자</a></span>
				          </div>
								</li>
								<li>
									<div class="good_thumb">
										<a href="#">
											<img src="<%=request.getContextPath() %>/img/main/recipe3.png">
										</a>
									</div>
									<div class="info_goods">
				            <span class="name"><a class="txt">토마토 스튜</a></span>
				          </div>
								</li>
								<li>
									<div class="good_thumb">
										<a href="#">
											<img src="<%=request.getContextPath() %>/img/main/recipe4.png">
										</a>
									</div>
									<div class="info_goods">
				            <span class="name"><a class="txt">채끝 찹스테이크</a></span>
				          </div>
								</li>
								<li>
									<div class="good_thumb">
										<a href="#">
											<img src="<%=request.getContextPath() %>/img/main/recipe5.png">
										</a>
									</div>
									<div class="info_goods">
				            <span class="name"><a class="txt">램 케서롤</a></span>
				          </div>
								</li>
								<li>
									<div class="good_thumb">
										<a href="#">
											<img src="<%=request.getContextPath() %>/img/main/recipe6.png">
										</a>
									</div>
				          <div class="info_goods">
				            <span class="name"><a class="txt">라자냐</a></span>
				          </div>
				         </li>
							</ul>                
	        </div>                
	    </div> <%-- main_type4 end --%>
	
	    <br>
	    <br>
	    <br>
	    <br>
	    <br>
	    <%-- 메인타입 5 - 하단 배너 --%>
	    <div class="banner_bottom">
	        <img class="banner_img" src="<%=request.getContextPath() %>/img/main/banner_bottom.jpg">
	    </div>
	    
	
	</div> <%-- haliMain end --%>

	<jsp:include page="/include/footer.jsp"/>
<%--
</body>
</html>
 --%>