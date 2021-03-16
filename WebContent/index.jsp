<%@page import="java.text.DecimalFormat"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.covid19.statusBoardApi.StatusBoard"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>코로나19 선별진료소 안내 및 예약 시스템</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <!-- status Board1 -->
  <link rel="shortcut icon" type="image/x-icon" href="assets/img/g_logo.png">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  
  <!-- status Board2 -->
  <!-- fontawesome -->
  <script src="https://kit.fontawesome.com/41caffd54e.js" crossorigin="anonymous"></script>
  
  <!-- XEICON -->
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
  
  <!-- Custom CSS -->
  <link href="assets/css/style.min.css" rel="stylesheet">

  <!-- SweetAlert -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 
	<script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="dist/js/app-style-switcher.js"></script>
    <script src="dist/js/feather.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <!-- themejs -->
    <!--Menu sidebar -->
    <script src="dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="dist/js/custom.min.js"></script>
    
	<!-- Chart JS -->
    <script src="dist/js/pages/chartjs/chartjs.init.js"></script>
    <script src="assets/libs/chart.js/dist/Chart.min.js"></script>
    
    <!-- c3 CDN -->
   	<!-- Load c3.css -->
	<link href="assets/css/c3.css" rel="stylesheet">
	<script src="assets/js/c3.js"></script>
	<script src="https://d3js.org/d3.v5.min.js"></script>
	<script src="assets/js/c3.min.js"></script>
	<link href="assets/css/c3.css" rel="stylesheet">

	<!-- 현황판 api -->
	<%	
	JSONObject jsonKorea = StatusBoard.status_korea();
	
	JSONObject jsonCity = StatusBoard.status_city();
	JSONObject stringKorea = new JSONObject(jsonCity.get("korea").toString());
	JSONObject stringSeoul = new JSONObject(jsonCity.get("seoul").toString());
	JSONObject stringBusan = new JSONObject(jsonCity.get("busan").toString());
	JSONObject stringDaegu = new JSONObject(jsonCity.get("daegu").toString());
	JSONObject stringIncheon = new JSONObject(jsonCity.get("incheon").toString());
	JSONObject stringGwangju = new JSONObject(jsonCity.get("gwangju").toString());
	JSONObject stringDaejeon = new JSONObject(jsonCity.get("daejeon").toString());
	JSONObject stringUlsan = new JSONObject(jsonCity.get("ulsan").toString());
	JSONObject stringSejong = new JSONObject(jsonCity.get("sejong").toString());
	JSONObject stringGyeonggi = new JSONObject(jsonCity.get("gyeonggi").toString());
	JSONObject stringGangwon = new JSONObject(jsonCity.get("gangwon").toString());
	JSONObject stringChungbuk = new JSONObject(jsonCity.get("chungbuk").toString());
	JSONObject stringChungnam = new JSONObject(jsonCity.get("chungnam").toString());
	JSONObject stringJeonbuk = new JSONObject(jsonCity.get("jeonbuk").toString());
	JSONObject stringJeonnam = new JSONObject(jsonCity.get("jeonnam").toString());
	JSONObject stringGyeongbuk = new JSONObject(jsonCity.get("gyeongbuk").toString());
	JSONObject stringGyeongnam = new JSONObject(jsonCity.get("gyeongnam").toString());
	JSONObject stringJeju = new JSONObject(jsonCity.get("jeju").toString());
	JSONObject stringQuarantine = new JSONObject(jsonCity.get("quarantine").toString());
	
	// 확진율 계산
	String a = jsonKorea.get("TotalCase").toString();
	a = a.replace(",", "");
	String b = jsonKorea.get("TotalChecking").toString();
	b = b.replace(",", "");
	
	double i = Double.parseDouble(a);
	int j = Integer.parseInt(b);
	
	double per = (i / j * 100);
	String domesticConfirm = String.format("%.2f", per);
	
	// 국내 확진자 계산
	String c = stringKorea.get("newCase").toString();
	c = c.replace(",", "");
	
	String d = stringQuarantine.get("newCase").toString();
	d = d.replace(",", "");
	
	int o = Integer.parseInt(c);
	int p = Integer.parseInt(d);

	int domestic = (o - p);
	
	// 국내 치료중 계산
	
	String e = jsonKorea.getString("TotalCase").toString();
	String f = jsonKorea.getString("TotalRecovered").toString();
	String g = jsonKorea.getString("TotalDeath").toString();
	e = e.replace(",", "");
	f = f.replace(",", "");
	g = g.replace(",", "");

	int tc = Integer.parseInt(e);
	int tr = Integer.parseInt(f);
	int td = Integer.parseInt(g);
	
	int domesticTreatment = (tc-tr) - td;
	
	DecimalFormat format = new DecimalFormat("###,###");
	
	%>
	
</head>

<body>

  <!-- ======= Top Bar ======= -->
  <section id="topbar" class="d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="social-links d-none d-md-flex align-items-center">
        <a href="http://ncv.kdca.go.kr/" class="link1"><img src="assets/img/g_logo.png" width="20px" height="20px"> 코로나19 백신 및 예방접종</a>
        <a href="http://www.mohw.go.kr/" class="link2"><img src="assets/img/g_logo.png" width="20px" height="20px"> 중앙사고수습본부</a>
        <a href="http://www.kdca.go.kr/" class="link3"><img src="assets/img/g_logo.png" width="20px" height="20px"> 중앙방역대책본부</a>
      </div>
    </div>
  </section>

  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="#" class="logo"><img src="assets/img/g_logo.png" alt=""></a><a href="#"> 코로나바이러스감염증-19<span> (COVID-19)</span></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->

      <nav id="navbar" class="navbar">
        <ul>
         <li><a class="nav-link scrollto active" href="#hero">안내</a></li>
          <li><a class="nav-link scrollto" href="#about">진료소 찾기</a></li>
          <li><a class="nav-link scrollto" href="#services">국내 현황판</a></li>
          <!-- <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
          -->
          <li><a class="nav-link scrollto" href="#contact">관리자</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container" data-aos="zoom-out" data-aos-delay="100">
      <h1>코로나19 선별진료소 <span>안내</span> 및 <span>예약 </span>시스템</h1>
      <h2>찾고자 하는 선별진료소의 시, 군, 구를 입력해주세요</h2>
      <div class="d-flex">
        <a href="#about" class="btn-get-started scrollto">진료소 찾기</a>
        <a href="https://www.youtube.com/watch?v=vZAtsL6t_4Y" class="glightbox btn-watch-video"><i class="bi bi-play-circle"></i><span>코로나19 정부 브리핑</span></a> 
      </div>
    </div>
  </section><!-- End Hero -->

    <!-- ======= About Section ======= -->
    <section id="about" class="about section-bg">
      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h3>코로나19 선별진료소 <span>검색</span></h3>
    <footer id="footer">
     <div class="footer-newsletter">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-6">
            <form onsubmit="searchPlaces(); return false;" >
              <input type="search" name="keyword" id="keyword"><input type="submit" value="찾기">
            </form>
          </div>
        </div>
      </div>
    </div>
    <p> 자신의 위치를 입력해주세요. </p>
    </footer>
        </div>
        <div style="weight:1300px; height:600px;">
        <jsp:include page="kakaomapapi.jsp" flush="false" />
        </div>
        </div>
    </section><!-- End About Section -->

    <!-- ======= 현황판, services Section ======= -->
    <section id="services" class="services">
      <div class="container" data-aos="fade-up">

            <div class="page-breadcrumb">
                <div class="section-title">
                					<% String upTime = jsonKorea.get("updateTime").toString();
									String after = upTime.substring(22);
									%>
									<h3>코로나바이러스감염증-19 국내 발생현황 </h3><h4><span><%=after%></span></h4>
									<p>오전 <span>9시~10시</span> 사이에 00시 데이터 기준으로 자동 업데이트 됩니다.</p>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                        <div class="customize-input float-right">
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="card-group">
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div class="test" style="margin-right:130px;">
                                <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">
										<span style="color: #f89009;">
										<!-- 국내 확진자 -->
										<%=jsonKorea.get("TotalCase")%>명
										</span>
										</h2>
                                        <span
                                            class="badge bg-warning font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">+
											<%=stringKorea.get("newCase")%>명										</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">국내 확진자</h6>   
                                </div>	
                                
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg></span>
                                </div>
                                
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="users"></i></span>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div class="test" style="margin-right:130px;">
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">
										<span style="color: #009a87;">
										<!-- 국내 완치자 -->
										<%=jsonKorea.get("TotalRecovered")%>명
										</span>
										</h2>
                                        <span
                                            class="badge bg-success font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">+
											<%=jsonKorea.get("TodayRecovered")%>명										</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">국내 완치자</h6>
                                </div>
                                
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-pocket"><path d="M4 3h16a2 2 0 0 1 2 2v6a10 10 0 0 1-10 10A10 10 0 0 1 2 11V5a2 2 0 0 1 2-2z"></path><polyline points="8 10 12 14 16 10"></polyline></svg></span>
                                </div>
                                
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="pocket"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div class="test" style="margin-right:130px;">
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">
										<span style="color: #ee2323;">
										<!-- 국내 사망자 -->
										<%=jsonKorea.get("TotalDeath")%>명
										</span>
										</h2>
										<span class="badge bg-danger font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">
										+<%=jsonKorea.get("TodayDeath")%>명
										</span>                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">국내 사망자</h6>
                                </div>
                                
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clipboard"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg></span>
                                </div>
                                
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="clipboard"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div class="test" style="margin-right:130px;">
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">
										<span style="color: #006dd7;">
										<!-- 국내 치료 중 -->
										<%=format.format(domesticTreatment)%>명
										</span>
										</h2>
                                        <span
                                            class="badge bg-primary font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">
											+<%=jsonKorea.get("TotalCaseBefore")%>명										</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">국내 치료중</h6>
                                </div>
                                
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-activity"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline></svg></span>
                                </div>
                                
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i data-feather="activity"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
             
                </div>
		
                <div class="row">
       
                    <div class="col-lg-8 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" style="color:black" >
                                전일대비 확진환자 증감 비율
                                </h4>
                                
                                <div id="Day-status"></div>
        
								<script>
								var chart = c3.generate({
									bindto: "#Day-status",
								    data: { 
								       columns: [
								 		  ['서울 (+<%=stringSeoul.get("newCase")%>)',  <%=stringSeoul.get("newCase")%>],
										  ['부산 (+<%=stringBusan.get("newCase")%>)',  <%=stringBusan.get("newCase")%>],
										  ['대구 (+<%=stringDaegu.get("newCase")%>)',  <%=stringDaegu.get("newCase")%>],
										  ['인천 (+<%=stringIncheon.get("newCase")%>)', <%=stringIncheon.get("newCase")%>],
										  ['광주 (+<%=stringGwangju.get("newCase")%>)',  <%=stringGwangju.get("newCase")%>],
										  ['대전 (+<%=stringDaejeon.get("newCase")%>)',  <%=stringDaejeon.get("newCase")%>],
										  ['울산 (+<%=stringUlsan.get("newCase")%>)',  <%=stringUlsan.get("newCase")%>],
										  ['세종 (+<%=stringSejong.get("newCase")%>)',  <%=stringSejong.get("newCase")%>],
										  ['경기 (+<%=stringGyeonggi.get("newCase")%>)',  <%=stringGyeonggi.get("newCase")%>],
										  ['강원 (+<%=stringGangwon.get("newCase")%>)',  <%=stringGangwon.get("newCase")%>],
										  ['충북 (+<%=stringChungbuk.get("newCase")%>)',  <%=stringChungbuk.get("newCase")%>],
										  ['충남 (+<%=stringChungnam.get("newCase")%>)',  <%=stringChungnam.get("newCase")%>],
										  ['전북 (+<%=stringJeonbuk.get("newCase")%>)',  <%=stringJeonbuk.get("newCase")%>],
										  ['전남 (+<%=stringJeonnam.get("newCase")%>)',  <%=stringJeonnam.get("newCase")%>],
										  ['경북 (+<%=stringGyeongbuk.get("newCase")%>)',  <%=stringGyeongbuk.get("newCase")%>],
										  ['경남 (+<%=stringGyeongnam.get("newCase")%>)',  <%=stringGyeongnam.get("newCase")%>],
										  ['제주 (+<%=stringJeju.get("newCase")%>)',  <%=stringJeju.get("newCase")%>],
										  ['검역 (+<%=stringQuarantine.get("newCase")%>)',  <%=stringQuarantine.get("newCase")%>],
								        ],
								     
								    type: 'donut'
								    },
								    donut: {
										label: {
											show: false
										},
										title: '전일대비 확진자수: <%=stringKorea.get("newCase")%>명',
										width: 18
									},
									
								});
						
								</script>
	
                                <ul class="list-inline text-center mt-2 mb-12">
                                    <li class="list-inline-item text-muted">당일 00시 데이터가 아직 없는 경우 전날의 데이터가 연계됩니다.</li>
									<br><br>
                                    <li class="list-inline-item text-muted">해외입국확진(검역)은 <b><%=stringQuarantine.get("newCase")%>명</b>, 국내 확진자는 <b><%=domestic%>명</b> 입니다.</li>
									<br><br>
                                </ul>
                            </div>
						</div>
                    </div>
			
					<div class="col-lg-4 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">국내 부가 정보</h4>
								<div class="card border-right">
									<div class="card-body">
										<div class="d-flex d-lg-flex d-md-block align-items-center">
											<div class="test" style="margin-right:300px;">
												<div class="d-inline-flex align-items-center">
													<h2 class="text-dark mb-1 font-weight-medium">
													<span style="color: #f89009;">
													<!-- 국내 확진자 -->
													<%=domesticConfirm%>%
													</span>
													</h2>
												</div>
												<h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">국내 확진율</h6>
											</div>
											
											<div class="ml-auto mt-md-3 mt-lg-0" id="icon1">
												<span class="opacity-7 text-muted"><svg xmlns="http://www.w3.org/2000/svg" x="100" y="100" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg></span>
											</div>
											
											<div class="ml-auto mt-md-3 mt-lg-0">
												<span class="opacity-7 text-muted"><i data-feather="users"></i></span>
											</div>
										</div>
									</div>
								</div>
								<div class="card border-right">
									<div class="card-body">
										<div class="d-flex d-lg-flex d-md-block align-items-center">
											<div class="test" style="margin-right:280px;">
													<h2 class="text-dark mb-1 font-weight-medium">
													<span style="color: #009a87;">
													<!-- 국내 완치율 -->
													<%=jsonKorea.get("recoveredPercentage")%>%
													</span>
													</h2>
												<h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">국내 완치율</h6>
											</div>
											
											<div class="ml-auto mt-md-3 mt-lg-0">
												<span class="opacity-7 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-pocket"><path d="M4 3h16a2 2 0 0 1 2 2v6a10 10 0 0 1-10 10A10 10 0 0 1 2 11V5a2 2 0 0 1 2-2z"></path><polyline points="8 10 12 14 16 10"></polyline></svg></span>
											</div>
											
											<div class="ml-auto mt-md-3 mt-lg-0">
												<span class="opacity-7 text-muted"><i data-feather="pocket"></i></span>
											</div>
										</div>
									</div>
								</div>
								<div class="card border-right">
									<div class="card-body">
										<div class="d-flex d-lg-flex d-md-block align-items-center">
											<div class="test" style="margin-right:300px;">
												<div class="d-inline-flex align-items-center">
													<h2 class="text-dark mb-1 font-weight-medium">
													<span style="color: #ee2323;">
													<!-- 국내 사망률 -->
													<%=jsonKorea.get("deathPercentage")%>%
													</span>
													</h2>
													<!-- <span
														class="badge bg-danger font-12 text-white font-weight-medium badge-pill ml-2 d-md-none d-lg-block">-18.33%</span> -->
												</div>
												<h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">국내 사망률</h6>
											</div>
											
											<div class="ml-auto mt-md-3 mt-lg-0">
												<span class="opacity-7 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clipboard"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg></span>
											</div>
											
											<div class="ml-auto mt-md-3 mt-lg-0">
												<span class="opacity-7 text-muted"><i data-feather="clipboard"></i></span>
											</div>
										</div>
									</div>
								</div>

                                <ul class="list-inline text-center mt-5 mb-2">
                                    <li class="list-inline-item text-muted">당일 데이터가 없는 경우 전날의 데이터가 연계됩니다.</li>
									<br>
                                    <li class="list-inline-item text-muted">확진율 = 결과양성(<%=jsonKorea.get("caseCount")%>) / 총 검사완료수(<%=jsonKorea.get("TotalChecking")%>) * 100%</li>
                                </ul>
                            </div>
                        </div>
                    </div>
         
					<div class="col-md-6 col-lg-12">
                        <div class="card">
                            <div class="card-body">
							<h4 class="card-title"><b><strong>대한민국 시도별 발생동향 한눈에 보기</strong></b></h4>
							<hr>
							<div class="row">
								<div class="col-sm-4">
								<br><br>
									<div class="gray" style="color:gray;">
									대한민국 시도별 발생동향을 확인하실 수 있습니다.<br><br>
									발생률: 인구 10만명당 (지역별 인구 출처 : 행정안전부, 주민등록인구현황 (’20.1월 기준))<br><br>
									※ 지역구분은 신고지를 기준으로 하며, 초기 신고 이후 소관지역이 변경된 경우 변동 가능<br><br>
									※ 발생률은 반올림되어 표기되었습니다.
									</div>
								</div>

								<div class="col-sm-4">
								<br><br>
									<!-- 시도별 발생동향 그래프 -->
									<div id="City-status"></div>
									<script>
									var chart = c3.generate({
										bindto: "#City-status",
									    data: { 
									       columns: [
									 			['<%=jsonKorea.get("city1n")%>',  <%=jsonKorea.get("city1p")%>],
									 			['<%=jsonKorea.get("city2n")%>',  <%=jsonKorea.get("city2p")%>],
									 			['<%=jsonKorea.get("city3n")%>',  <%=jsonKorea.get("city3p")%>],
									 			['<%=jsonKorea.get("city4n")%>',  <%=jsonKorea.get("city4p")%>],
									 			['<%=jsonKorea.get("city5n")%>',  <%=jsonKorea.get("city5p")%>],
									        ],
										    type: 'donut'
										    },
										    donut: {
												label: {
													show: false
												},
												title: '시도별 확진환자 현황 / 단위:%',
												width: 18
											},
										
									});
									</script>
									</div>
						
								<div class="col-sm-4">
								<br><br>
									<ul class="list-style-none mb-0">
										<li>
											<i class="fas fa-circle text-primary font-10 mr-2" style="color: tomato;"></i>
											<span class="text-muted"><%=jsonKorea.get("city1n")%></span>
											<span class="text-dark float-right font-weight-medium">
											<%=jsonKorea.get("city1p")%>%
											</span>
										</li>
										<li class="mt-3">
											<i class="fas fa-circle text-danger font-10 mr-2"></i>
											<span class="text-muted"><%=jsonKorea.get("city2n")%></span>
											<span class="text-dark float-right font-weight-medium">
											<%=jsonKorea.get("city2p")%>%
											</span>
										</li>
										<li class="mt-3">
											<i class="fas fa-circle text-cyan font-10 mr-2"></i>
											<span class="text-muted"><%=jsonKorea.get("city3n")%></span>
											<span class="text-dark float-right font-weight-medium">
											<%=jsonKorea.get("city3p")%>%
											</span>
										</li>
										<li class="mt-3">
											<i class="fas fa-circle text-success font-10 mr-2"></i>
											<span class="text-muted"><%=jsonKorea.get("city4n")%></span>
											<span class="text-dark float-right font-weight-medium">
											<%=jsonKorea.get("city4p")%>%
											</span>
										</li>
										<li class="mt-3">
											<i class="fas fa-circle text-light font-10 mr-2"></i>
											<span class="text-muted"><%=jsonKorea.get("city5n")%></span>
											<span class="text-dark float-right font-weight-medium">
											<%=jsonKorea.get("city5p")%>%
											</span>
										</li>
									</ul>
									<ul class="list-inline text-center mt-5 mb-2">
										<li class="list-inline-item text-muted">차트에 마우스를 올리거나 클릭하면 정확한 수치를 확인할 수 있습니다.</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					</div>
					
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="http://ncov.mohw.go.kr/"target="_blank"><span style="color: #000000;"><u>대한민국</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringKorea.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringKorea.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringKorea.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringKorea.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringKorea.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="http://www.seoul.go.kr/coronaV/coronaStatus.do"target="_blank"><span style="color: #000000;"><u>서울</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringSeoul.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringSeoul.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringSeoul.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringSeoul.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringSeoul.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="http://www.busan.go.kr/corona19/index"target="_blank"><span style="color: #000000;"><u>부산</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringBusan.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringBusan.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringBusan.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringBusan.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringBusan.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="http://www.daegu.go.kr/"target="_blank"><span style="color: #000000;"><u>대구</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringDaegu.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringDaegu.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringDaegu.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringDaegu.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringDaegu.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="https://www.incheon.go.kr/"target="_blank"><span style="color: #000000;"><u>인천</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringIncheon.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringIncheon.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringIncheon.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringIncheon.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringIncheon.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="https://www.gwangju.go.kr/"target="_blank"><span style="color: #000000;"><u>광주</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringGwangju.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringGwangju.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringGwangju.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringGwangju.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringGwangju.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="https://www.daejeon.go.kr/corona19/index.do"target="_blank"><span style="color: #000000;"><u>대전</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringDaejeon.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringDaejeon.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringDaejeon.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringDaejeon.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringDaejeon.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="http://www.ulsan.go.kr/corona.jsp"target="_blank"><span style="color: #000000;"><u>울산</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringUlsan.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringUlsan.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringUlsan.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringUlsan.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringUlsan.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="https://www.sejong.go.kr/life/sub05_0704.do"target="_blank"><span style="color: #000000;"><u>세종</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringSejong.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringSejong.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringSejong.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringSejong.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringSejong.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="https://www.gg.go.kr/bbs/boardView.do?bsIdx=464&bIdx=2296956&menuId=1535"target="_blank"><span style="color: #000000;"><u>경기</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringGyeonggi.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringGyeonggi.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringGyeonggi.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringGyeonggi.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringGyeonggi.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="http://www.provin.gangwon.kr/"target="_blank"><span style="color: #000000;"><u>강원</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringGangwon.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringGangwon.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringGangwon.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringGangwon.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringGangwon.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="http://www.chungbuk.go.kr/"target="_blank"><span style="color: #000000;"><u>충북</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringChungbuk.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringChungbuk.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringChungbuk.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringChungbuk.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringChungbuk.get("percentage")%>%</span>	
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="http://www.chungnam.go.kr/coronaStatus.do"target="_blank"><span style="color: #000000;"><u>충남</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringChungnam.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringChungnam.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringChungnam.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringChungnam.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringChungnam.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="http://www.jeonbuk.go.kr/"target="_blank"><span style="color: #000000;"><u>전북</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringJeonbuk.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringJeonbuk.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringJeonbuk.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringJeonbuk.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringJeonbuk.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="https://www.jeonnam.go.kr/coronaMainPage.do"target="_blank"><span style="color: #000000;"><u>전남</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringJeonnam.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringJeonnam.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringJeonnam.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringJeonnam.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringJeonnam.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="http://www.gb.go.kr/Main/index.html"target="_blank"><span style="color: #000000;"><u>경북</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringGyeongbuk.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringGyeongbuk.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringGyeongbuk.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringGyeongbuk.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringGyeongbuk.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="http://www.gyeongnam.go.kr/corona.html"target="_blank"><span style="color: #000000;"><u>경남</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringKorea.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringGyeongnam.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringGyeongnam.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringGyeongnam.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringGyeongnam.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="https://jeju.go.kr/covid19.jsp"target="_blank"><span style="color: #000000;"><u>제주</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringJeju.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringJeju.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringJeju.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringJeju.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringJeju.get("percentage")%>%</span>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body collapse show">
										<h4 class="card-title"><a href="http://ncov.mohw.go.kr/"target="_blank"><span style="color: #000000;"><u>검역</u></span><u>(정보보기)</u></a></h4> 
										확진자: <span style="color: #f89009;"><%=stringQuarantine.get("totalCase")%>명</span> <span style="color: #ffbb33;">[+<%=stringQuarantine.get("newCase")%>명]</span>
										<br>
										완치자: <span style="color: #009a87;"><%=stringQuarantine.get("recovered")%>명</span><br>
										사망자: <span style="color: #ee2323;"><%=stringQuarantine.get("death")%>명</span><br>
										발생률: <span style="color: #006dd7;"><%=stringQuarantine.get("percentage")%>%</span>
									</div>
								</div>
							</div>				</div>
			</div>
    </section><!-- End Services Section -->
   <footer>
    <div class="container py-4">
      <div class="copyright">
        &copy; Copyright <strong><span>김진섭, 최재연, 석현일</span></strong>. All Rights Reserved
      </div>
    </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/purecounter/purecounter.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>
</html>