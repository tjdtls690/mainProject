# :pushpin: Saladit!
>건강식 품목별 판매 서비스 
>[demo site link](http://ec2-13-125-186-247.ap-northeast-2.compute.amazonaws.com/lastSalad/main.do)

</br>

## 1. 제작 기간 & 참여 인원
- 2022.2.18 ~ 2022.3.30
- 팀 프로젝트 (6명)

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 8
  - Spring Framework
  - Spring MVC
  - MySQL 5.7
  - Mybatis 
  - SQL Developer
  - mobaxterm
#### `Front-end`
  - HTML 
  - CSS 
  - JS
  - JQuery
  - JSON
  - BootStrap

</br>

## 3. 핵심 ERD

**사진을 클릭하여 크게 보실 수 있습니다.**

- **첫번째 사진의 payment_item_mapping 테이블의 payment_item_mapping_item_code(결제 상품 고유 번호) 컬럼**과 
- **두번째 사진의 item, subscribe 테이블의 각각의 Primary key인 고유번호 컬럼들**이 외래키로 묶여있지만 한 이미지에 전부 넣을 수 없어 불가피하게 두 개의 이미지로 나눠놓았습니다.

![](https://tjdtls690.github.io/assets/img/github_img/main_erd.PNG)

![](https://tjdtls690.github.io/assets/img/github_img/sub_erd.PNG)


## 4. 핵심 기능
이 서비스의 핵심 기능은 **'고객의 상품 주문 / 결제'**와 **'관리자의 통계 시스템'**입니다.  

1. **고객**은 **상품의 주문 및 결제**를 하고, 결제한 상품에 한해서 **이미지 첨부가 가능한 리뷰를 댓글 형식으로 작성**할 수 있습니다. 
2. **관리자**는 **매출 통계 표시 및 파일로 다운로드(PDF, Excel)** 가 가능하고,  **회원 관리와 쿠폰 관리 등등**이 있습니다.

핵심 기능 설명을 펼쳐서 기능의 흐름을 보면, 서비스가 어떻게 동작하는지 알 수 있습니다.  

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름
![](https://tjdtls690.github.io/assets/img/github_img/important_flow01.PNG)

### 4.2. 사용자 요청 (JSP < - > Controller)

- #### 주문 페이지로 이동 (3가지 루트를 전부 감안하여 만든 메서드) (Controller) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/java/project/spring/web/order/OrderController.java#L32)

  1. ###### 상품 상세페이지에서 구매 버튼 클릭

  2. ###### 장바구니에서 구매 버튼 클릭

  3. ###### 바로주문하기 버튼 클릭

     - ##### 3가지 루트를 커버하기 위해, 필요한 데이터들은 전부 배열 형식으로 받아서 처리.

       

- #### 주문 페이지 (주문하기 버튼 클릭 후) -> 결제 페이지로 이동

  - ###### 여러개가 나오는 데이터 종류들은 List VO에, 하나씩 나오는 데이터는 단일 데이터 VO에 넣어서 컨트롤러에 전달 (화면단 : Javascript) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/webapp/WEB-INF/views/order.jsp#L2593)

  - ###### 리스트 VO(PaymentSingleListVO), 단일 데이터 VO(PaymentSingleSideInfoVO) 를 통해 결제 페이지에 데이터 전달 (Controller) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/java/project/spring/web/paymentSingle/PaymentSingleController.java#L33)

    - 리스트 형식으로 받는 클래스 코드 (PaymentSingleListVO) (Java) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/java/project/spring/web/paymentSingle/PaymentSingleListVO.java#L5)

      

- #### 결제 페이지 -> 결제 완료 페이지

  1. ##### 결제하기 버튼 클릭 시

     - ###### 가격이 0원 이상일 때 (iamport API 를 이용해서 결제 진행 후 데이터 넘기기) (화면단 : Javascript) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/webapp/WEB-INF/views/paymentSingle.jsp#L493)

     - ###### 포인트, 쿠폰으로 인해 가격이 0원일 때 (API 는 진행하지 않고 바로 데이터 넘기기) (화면단 : Javascript) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/webapp/WEB-INF/views/paymentSingle.jsp#L218)

  2. ##### 결제 데이터 전달, 장바구니 목록 갱신, 쿠폰 갱신, 포인트 갱신의 역할을 담당하는 메서드 (Controller) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/java/project/spring/web/paymentComplete/PaymentCompleteController.java#L37)

     

- #### 구매한 상품 리뷰 작성 (댓글) - AWS S3에 이미지 파일 업로드 포함

  - ##### 리뷰 정보 (별점, 내용, 이미지 파일 업로드, 해당 상품 정보 등등) 를 DB에 저장 후, 리뷰 작성 혜택인 포인트 적립하는 메서드 (Controller) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/java/project/spring/web/my_review_write/MyReviewWriteController.java#L126)

  - ##### 이미지 파일을 AWS S3 에 업로드할 때 사용되는 AwsS3 클래스 코드

    - createS3Client() 메서드로 AmazonS3 객체 생성 후 **(Service) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/java/project/spring/web/s3/AwsS3.java#L70)**

    - upload(InputStream is, String key, String contentType, long contentLength) 메서드로 S3 에 이미지 파일 업로드 실행 **(Service) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/java/project/spring/web/s3/AwsS3.java#L94)**

      

- #### 카카오 우편번호 (주소) 서비스 API

  - ##### 먼저 카카오 주소 서비스 API 의 iframe 을 담기 위한 모달창을 띄웁니다. (화면단 : JavaScript) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/webapp/WEB-INF/views/order.jsp#L2262)
  - ##### 띄워진 모달창 안에 API iframe 을 껴맞춰 넣어서 띄웁니다. (화면단 : JavaScript) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/webapp/WEB-INF/views/order.jsp#L87)
  
  
  
- #### 회원가입

  - ##### 이메일 정규식, 이미 존재하는지 여부 체크 (Controller) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/java/project/spring/web/signup/SignUpController.java#L48)

    - 이미 존재한다면 카카오, 구글, 샐러딧 중 어떤 타입으로 가입되어있는지 모달창을 띄워 알려줍니다.

  - **휴대폰 번호 인증** 

    - ##### 휴대폰 번호 정규식 체크 (Controller) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/java/project/spring/web/signup/SignUpController.java#L72)

    - ##### 문자 인증 과정

      1. ##### 인증번호 문자를 보내는 과정 (네이버 SMS API) (Controller) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/java/project/spring/web/naver_sms_api/NaverSensSMS.java#L68)

         - 랜덤 숫자 6자리를 뽑고 세션에 들어가있는 MemberVO에 저장해줍니다.
         - 네이버 SMS API 를 이용해 랜덤 숫자 6자리를 포함한 문자를 보냅니다.

      2. ##### 세션에 저장된 6자리 숫자와 사용자가 적은 숫자를 비교 (Controller) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/java/project/spring/web/signup/SignUpController.java#L123)

         

- #### 로그인
  
  - ##### 카카오 로그인 API (화면단 : JavaScript) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/webapp/WEB-INF/views/kakaoLogin.jsp#L18)

    - 카카오 로그인 팝업창을 띄워서 로그인 정보를 **로그인 타입 체크 메서드**에 전달
  
  - ##### 로그인 타입 체크 (Controller) - 카카오로 로그인 시 :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/java/project/spring/web/login/LoginController.java#L65)
  
    - 이메일이 구글이거나 샐러딧 전용 이메일이라면 다시 로그인 화면으로 돌려보내며 경고창을 띄웁니다.
  
    - 카카오 이메일이 맞다면, 세션에 회원 정보를 DB에서 가져와서 넣고 메인페이지로 이동합니다.
  
      
  

### 4.3. Controller < - > Service

- ##### 상품(데이터) 목록 요청 (대부분의 Controller < - > Service 계층은 이러한 구조를 가지고 있습니다.)

  - ##### 요청 확인 (Controller) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/java/project/spring/web/order/OrderController.java#L123)

    - 화면단에서 태그 정보(DetailVO.item_tag_main)와 모달창 상품 목록 요청을 함께 받고, 그 정보들을 Service 로 넘깁니다. 

  - ##### 결과 응답 (Service) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/java/project/spring/web/order/impl/OrderServiceImpl.java#L18)

    - Service 계층에서 Controller에서 넘어온 데이터를 통해 단품, 구독 상품간의 분류를 거치고 Repository 로 넘겨서 데이터를 받아옵니다.

      


### 4.4. Repository (DAO) - 4.3 과 이어진 구조로 설명

- **Service 의 요청을 처리  (Repository) :pushpin: [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/java/project/spring/web/order/impl/OrderDAO.java#L17)**

  - Service로부터 넘어온 데이터를 SqlSessionTemplate 을 통해 Mybatis로 넘깁니다.

  - Mybatis에서 반환 된 상품 리스트(데이터) 를 받아서 자신을 호출한 Service로 응답합니다.

    

### 4.5. MyBatis

- ##### Repository -> MyBatis - 4.4 와 이어진 구조로 설명

  1. applicationContext.xml 에서 sqlSessionTemplate 의 bean 객체 생성 **(xml 설정파일) :pushpin:  [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/webapp/WEB-INF/spring/applicationContext.xml#L42)**

  2. mybatis 환경설정 파일(mybatis-config.xml) 에 SQL 매퍼파일 등록 **(xml 설정 파일) :pushpin:  [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/resources/mybatis-config.xml#L44)**

  3. 매퍼파일에서 SQL 문을 통해 상품 데이터를 반환 **(xml 매퍼 파일) :pushpin:  [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/resources/mappings/order-mapping.xml#L38)**

     

- ##### 상품 검색 요청에 대한 응답 SQL문 :pushpin:  [코드 확인](https://github.com/tjdtls690/mainProject/blob/dev/src/main/resources/mappings/search-mapping.xml#L39)

  - 두 테이블을 left join으로 합쳐서 데이터를 가공 및 리스트로 반환

</div>
</details>

</br>
