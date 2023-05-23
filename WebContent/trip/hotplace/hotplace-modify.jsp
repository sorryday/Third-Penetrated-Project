<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:import url="../../header.jsp"></c:import>
<c:set var="root" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <title>EnjoyTrip</title>
</head>

<body>
<!--  여기서 부터 시작 -->
		<section>
		    <div class="d-flex flex-column align-items-center">
		        <h1 class="fw-bold mt-5 mb-3">나만의 핫플 자랑하기</h1>
		        <div class="container mb-5">
		            <div class="row">
		                <div class="col-6">
		                    <div id="map" style="width: 100%; height: 600px"></div>
		                </div>
		                <div class="col-6">
		                
		                    <form action="" method="POST" name="hotplaceModifyForm">
		                        <div class="mb-3">
		                            <label for="place-image" class="form-label text-danger">
		                                <span class="d-flex align-items-center">
		                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
		                                         class="bi bi-camera" viewBox="0 0 16 16">
		                                        <path d="M15 12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1h1.172a3 3 0 0 0 2.12-.879l.83-.828A1 1 0 0 1 6.827 3h2.344a1 1 0 0 1 .707.293l.828.828A3 3 0 0 0 12.828 5H14a1 1 0 0 1 1 1v6zM2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2z"/>
		                                        <path d="M8 11a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5zm0 1a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7zM3 6.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
		                                    </svg>&nbsp;스마트폰으로 찍은 사진을 올려주세요.
		                                </span>
		                            </label>
		                            <input type="file" class="form-control" id="place-image" name="image" accept="image/*"
		                                   onchange="markMap()"/>
		                        </div>
		                        
		                        <div class="mb-3">
		                            <label for="place-name" class="form-label">핫플 이름</label>
		                            <input type="text" class="form-control" id="title" name="title" value= "${modifyHotPlace.title}" size="15" />
		                        </div>
		                        <div class="mb-3">
		                            <label for="date" class="form-label">다녀온 날짜</label>
		                            <input type="date" class="form-control" id="date" name="date" value="${modifyHotPlace.date}" disabled/>
		                        </div>
		                        <div class="mb-3">
		                            <label for="type-select" class="form-label">장소 유형</label>
		                            <select class="form-select" id="type" name="type">
		                                <option selected disabled>관광지 유형</option>
		                                <option value="12" ${modifyHotPlace.placeType == 12 ? 'selected="selected"' : '' }>관광지</option>
		                                <option value="14" ${modifyHotPlace.placeType == 14 ? 'selected="selected"' : '' }>문화시설</option>
		                                <option value="15" ${modifyHotPlace.placeType == 15 ? 'selected="selected"' : '' }>행사/공연/축제</option>
		                                <option value="25" ${modifyHotPlace.placeType == 25 ? 'selected="selected"' : '' }>여행코스</option>
		                                <option  value="28" ${modifyHotPlace.placeType == 28 ? 'selected="selected"' : '' }>레포츠</option>
		                                <option  value="32" ${modifyHotPlace.placeType == 32 ? 'selected="selected"' : '' }>숙박</option>
		                                <option  value="38" ${modifyHotPlace.placeType == 38 ? 'selected="selected"' : '' }>쇼핑</option>
		                                <option  value="39" ${modifyHotPlace.placeType == 39 ? 'selected="selected"' : '' }>음식점</option>
		                            </select>
		                        </div>
		                        
		                        <input type="hidden" id = "latitude" name="latitude" value="${modifyHotPlace.latitude}">
		                        <input type="hidden" id = "longitude" name="longitude" value="${modifyHotPlace.longitude}">
		                        
		                        
		                        <div class="mb-3">
		                            <label for="content" class="form-label">상세설명</label>
		                            <textarea id="content" name="content" class="form-control">${modifyHotPlace.content}</textarea>
		                        </div>
		                        
		                        <input type="hidden" id="modifyHotPlace-id" name="modifyHotPlace-id" value="${modifyHotPlace.id}">
		                        <div>
		                        	<button type="submit" id="register-button" class="btn btn-success container-fluid"  
		                        	formaction="${root}/hotplaces?mode=update&pgno=1&key=&word=" >
		                        		수정 완료 
		                        	</button>
		                        
		                        </div>
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
		</section>

<!--  여기서끝 -->


<c:import url="../../footer.jsp"></c:import>

<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d07dd8988b0ead77351bbfd00f03228f"></script>
<script src="https://cdn.jsdelivr.net/npm/exif-js"></script>

<script>
	var lat = ${modifyHotPlace.latitude};
	var lot = ${modifyHotPlace.longitude};
	
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(lat, lot), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);
    
    const markerPosition = new kakao.maps.LatLng(lat, lot);
    const marker = new kakao.maps.Marker({
        position: markerPosition
    });
    marker.setMap(map);
    map.setCenter(markerPosition);
    
    function markMap() {
        const placeImage = document.getElementById('place-image');
        const imageFile = placeImage.files[0];
        const reader = new FileReader();
        reader.onload = function () {
            console.log("Y")
            EXIF.getData(imageFile, () => {
                const tags = EXIF.getAllTags(imageFile);
                if (tags.GPSLatitude === undefined || tags.GPSLongitude === undefined) {
                    alert("GPS 정보가 없는 사진입니다. 다른 사진을 올려주세요.")
                    placeImage.value = "";
                    return;
                }
                const lat = tags.GPSLatitude;
                const lng = tags.GPSLongitude;
                const latRef = tags.GPSLatitudeRef || 'N';
                const lngRef = tags.GPSLongitudeRef || 'E';
                const latDeg = lat[0] + lat[1] / 60 + lat[2] / 3600;
                const lngDeg = lng[0] + lng[1] / 60 + lng[2] / 3600;
                const latFinal = latRef === 'N' ? latDeg : -latDeg;
                const lngFinal = lngRef === 'E' ? lngDeg : -lngDeg;
                const markerPosition = new kakao.maps.LatLng(latFinal, lngFinal);
                const marker = new kakao.maps.Marker({
                    position: markerPosition
                });
                marker.setMap(map);
                map.setCenter(markerPosition);
                
                document.hotplaceModifyForm.latitude.value=latFinal;
                document.hotplaceModifyForm.longitude.value=lngFinal;
            })
        }
        if (imageFile) {
            reader.readAsDataURL(imageFile);
        }
    }
    
</script>
</body>
</html>