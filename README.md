# 🧳 EnjoyTrip_DB

## 📝 DB 테이블 구성 - ER Diagram
![ERDiagram](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/6ef1975f-4f75-4787-b949-ef149dbda5dc)

 - **1) attraction_info** : 관광지 기본 정보를 저장하는 테이블
 - **2) tripplan** : 여행계획을 저장할 테이블, attraction_info의 content_id를 FK로 가지고 있다.
 - **3) tripplan_has_attraction_info** : user가 어떤 tripplan을 가지고 있는지 저장하는 테이블
 - **4) user** : 사용자 정보 저장
 - **5) attraction_description** : 추가적인 관광지 정보 저장
 - **6) hotplace** : 추천 관광지를 공유하는 게시글 저장
 - **7) post** : 각종 게시글 정보 저장
 - **8) sido** : sido코드와 이에 맞는 지명을 저장해놓은 테이블
 - **9) gugun** : gugun 코드와 이에 맞는 지명을 저장해놓은 테이블

## 📌 기능 구현
### 1. 메인페이지
#### - 메인 페이지 화면
![1-1 메인화면](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/453740cc-b4f3-4b77-b02c-6448ce1ed043)


### 2. 회원가입
#### - 회원가입 화면
![2-1 회원가입](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/729d15f8-2bd5-48c3-9287-9ae6f2245daa)


#### - 마이페이지 & 로그인 화면
![2-2 마이페이지 로그인화면](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/6eb3a0fd-6f57-4cfc-97d8-60233fa78100)


#### - 마이페이지 & 프로필 수정 화면
![2-3 마이페이지_프로필수정](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/0023e95d-c4c0-4149-a1d9-26cdc0a3b6b8)


#### - 마이페이지 & 프로필 수정 완료 화면
![2-4 마이페이지_프로필수정(완료)](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/7d63b15a-a854-4200-8922-54f08d7c4843)


#### - 로그아웃 팝업 화면
![2-5 로그아웃팝업](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/76b73b33-0983-4768-9f53-32742ac82cbe)


### 3. 지역별 관광정보
#### - 시/구군/유형별 검색
![3-1 시_군구_유형별검색](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/3de7376c-a5af-4c00-bde3-657f6682eead)


#### - 시/구군/유형별 검색 결과 화면
![3-1 시_군구_유형별검색_결과](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/e6931f82-566d-4df6-90fa-b1236c421e64)


### 4. 게시판
#### - 게시판 글 작성: 로그인 안할 시, 글을 작성하지 못한다.
![4-1 로그인안하면글못씀](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/d2bf7710-dc03-41e4-9d4c-182d7332eaca)


#### - 게시판 글 작성: 로그인 시, 글을 작성할 수 있다.
![4-2 로그인하면글씀](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/4bb35c03-0c7e-4190-9d4a-70adf6c80e48)


#### - 게시판 글 목록화면
![4-2 로그인하면글씀_결과](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/a3cde4dc-a2e9-4234-bd1d-953ab33ad6ed)

### 5. 핫플레이스
#### - 핫플레이스 목록
![5-1 핫플레이스_목록](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/dd7503a8-8baa-4e84-90a0-91349aeb5a18)


#### - 핫플레이스 글 보기
![5-3 핫플레이스_글보기](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/d6466904-f5ba-4748-ba9f-e80af1bcda8f)


#### - 핫플레이스 글 작성: 로그인 시, 글을 작성할 수 있다.
![5-2 핫플레이스_글작성](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/b9599eeb-14e2-4c4b-a229-0ce5b29b624b)


#### - 핫플레이스 글 수정: 로그인 시, 자신이 작성한 글을 수정할 수 있다.
![5-4 핫플레이스_글수정](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/7cc23e30-8e67-43ff-90b6-cc5bc9b38cf7)


#### - 핫플레이스 글 수정: 로그인 시, 자신이 작성한 글을 삭제할 수 있다.
![5-5 핫플레이스_글삭제](https://github.com/sorryday/Third-Penetrated-Project/assets/49806698/f75cbc31-5bb5-4043-97df-05e73a14a203)


