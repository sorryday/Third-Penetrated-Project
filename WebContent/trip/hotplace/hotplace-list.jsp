<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <title>EnjoyTrip</title>
    <style>
        button {
            word-break: keep-all;
        }
    </style>
</head>
<body>
<%@include file="../../header.jsp" %>
<section>
    <div class="d-flex justify-content-center">
        <div class="d-flex flex-column container">
            <h1 class="fw-bold mt-5 mb-3 text-center">핫플레이스</h1>
            <div class="d-flex justify-content-end mb-3">
                <form class="d-flex" action="${root}/hotplaces" method="get">
                    <select name="condition" id="condition" class="form-select me-2" aria-label="검색조건" required>
                        <option selected disabled value="none">검색조건</option>
                        <option value="id">글번호</option>
                        <option value="title">제목</option>
                        <option value="user_id">작성자</option>
                    </select>
                    <input class="form-control me-2" type="search" name="keyword" placeholder="검색어를 입력하세요"
                           aria-label="Search" size="30" value="${keyword}" required>
                    <button class="btn btn-info text-white" type="submit" id="search-button">검색</button>
                </form>
            </div>
            <div class="row row-cols-4 mb-3">
                <c:forEach var="hotplace" items="${hotplaces}">
                    <div class="col">
                        <a href="${root}/hotplaces?id=${hotplace.id}" class="card mx-1 my-1 text-decoration-none text-black">
                            <div class="carousel" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="${root}/assets/img/1.jpg" class="card-img-top" alt="">
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">${hotplace.title}</h5>
                                <c:if test="${hotplace.placeType == '12'}">
                                    <p class="card-text h-6">관광지</p>
                                </c:if>
                                <c:if test="${hotplace.placeType == '14'}">
                                    <p class="card-text h-6">문화시설</p>
                                </c:if>
                                <c:if test="${hotplace.placeType == '15'}">
                                    <p class="card-text h-6">행사/공연/축제</p>
                                </c:if>
                                <c:if test="${hotplace.placeType == '25'}">
                                    <p class="card-text h-6">여행코스</p>
                                </c:if>
                                <c:if test="${hotplace.placeType == '28'}">
                                    <p class="card-text h-6">레포츠</p>
                                </c:if>
                                <c:if test="${hotplace.placeType == '32'}">
                                    <p class="card-text h-6">숙박</p>
                                </c:if>
                                <c:if test="${hotplace.placeType == '38'}">
                                    <p class="card-text h-6">쇼핑</p>
                                </c:if>
                                <c:if test="${hotplace.placeType == '39'}">
                                    <p class="card-text h-6">음식점</p>
                                </c:if>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
            
            <!-- 페이징 추가 부분 -->
            <div class="row" style="margin-top:50px">
	      	  ${navigation.navigator}
	      	</div>
	      	
            <form id="form-page" method="get" action="">
		      <input type="hidden" id="p-action" name="action" value="">
		      <input type="hidden" id="p-pgno" name="page-number" value="">
	      	</form>
	      	<!-- 페이징 추가 부분 끝 -->
            
            
            <div class="d-flex justify-content-end">
                <div id ="write-hotplace" class="btn btn-info text-white">핫플 자랑하기</div>
            </div>
        </div>
    </div>
</section>
<%@include file="../../footer.jsp" %>
<script>
	<%-- 페이징  추가부분 --%>
	var pageNum = 0;
	let pages = document.querySelectorAll(".page-link");
	pages.forEach(function (page) {
	  page.addEventListener("click", function () {
	    document.querySelector("#p-action").value = "list";
	 	document.querySelector("#p-pgno").value = this.parentNode.getAttribute("data-pg");
	    document.querySelector("#form-page").submit();
	  });
	});
	<%-- 페이징  추가부분 끝 --%>
	
    const searchButton = document.querySelector("#search-button");
    searchButton.addEventListener("click", function (event) {
        const condition = document.querySelector("#condition");
        if(condition.value === "none") {
            event.preventDefault();
            alert("검색조건을 선택해주세요.");
        }
    });
    
    const writeHotPlace = document.querySelector('#write-hotplace');
    writeHotPlace.addEventListener('click', () => {
        <c:if test="${sessionScope.user == null}">
            alert('로그인 후 이용해주세요.');
            location.href = '${root}/trip/user/login.jsp';
        </c:if>
        <c:if test="${sessionScope.user != null}">
            location.href = '${root}/trip/hotplace/hotplace-create.jsp';
        </c:if>
    });
    
</script>
</body>
</html>
