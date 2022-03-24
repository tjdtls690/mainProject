<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/admin"/>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
input {
  padding:10px;
	font-family: FontAwesome, "Open Sans", Verdana, sans-serif;
  font-style: normal;
  font-weight: normal;
  text-decoration: inherit;
  border-radius: 0 !important;
}

.form-control {
  border-radius: 0 !important;
  font-size: 12x;
}

.clickable { cursor: pointer; }
</style>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Saladit-admin</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="${path}/css/style.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script type="text/javascript">
       	$(function(){
       		var ctx = document.getElementById("myAreaChart");
   			var myLineChart = new Chart(ctx, {
   			  type: 'line',
   			  data: {
   			    labels: [ ${today}, "2021-04-02", "2021-04-03", "2021-04-04", 
   			    	      "2021-04-05", "2021-04-06", "2021-04-07", "2021-04-08", 
   			    	      "2021-04-09", "2021-04-10", "2021-04-11", "2021-04-12", "2021-04-13"],
   			    datasets: [{
   			      label: "Sessions",
   			      lineTension: 0.3,
   			      backgroundColor: "rgba(2,117,216,0.2)",
   			      borderColor: "rgba(2,117,216,1)",
   			      pointRadius: 5,
   			      pointBackgroundColor: "rgba(2,117,216,1)",
   			      pointBorderColor: "rgba(255,255,255,0.8)",
   			      pointHoverRadius: 5,
   			      pointHoverBackgroundColor: "rgba(2,117,216,1)",
   			      pointHitRadius: 50,
   			      pointBorderWidth: 2,
   			      data: [
   			    	  	${check0}, ${check1}, ${check2}, ${check3}, ${check4}, ${check5}, ${check6},
   			    	  	${check7}, ${check8}, ${check9}, ${check10}, ${check11}, ${check12}
 
   			    	  ],
   			    }],
   			  },
   			  options: {
   			    scales: {
   			      xAxes: [{
   			        time: {
   			          unit: 'date'
   			        },
   			        gridLines: {
   			          display: false
   			        },
   			        ticks: {
   			          maxTicksLimit: 7
   			        }
   			      }],
   			      yAxes: [{
   			        ticks: {
   			          min: 0,
   			          max: 400000,
   			          maxTicksLimit: 8
   			        },
   			        gridLines: {
   			          color: "rgba(0, 0, 0, .125)",
   			        }
   			      }],
   			    },
   			    legend: {
   			      display: false
   			    }
   			  }
   			});
       		
// 오른쪽 버튼 클릭시       		
			var check01 = 0;
       		$(document).on('click', '.bi.bi-chevron-right', function(){
       			var theDay = $("input[name='firstDay']").val();

       			$.ajax({ 
   			    	url : "next.mdo",
   			    	type : 'post',
   			    	dataType : 'html',
   			    	data : {
   			    		"theDay" : theDay	
   			    	},
   			    	success:function(html){

   			    	// 기존에 있던 input 애들 다 삭제.
   			    		$("input[name='day']").remove();
   			    		$("input[name='daySum']").remove();
   			    	// 데이터 들어가있는 input 추가
   			    		$('#input').append(html);
   			    	
   			    		$('.chartjs-size-monitor').detach();
   			    		$('#myAreaChart').detach()
   	   			    	$('#myAreaChart' + check01).detach();
   	   			    	check01++;
   	   			    	$('.card-body').eq(4).append('<canvas id="myAreaChart' + check01 + '" width="100%" height="40"></canvas>');
					//날짜 집어넣기.
						var day = [];
						for(var i = 0; i<13; i++){
							day[i] = $("input[name='day']").eq(i).val();
						}
					// 컨트롤러에 보내서 db쿼리 수행에 필요한 시작 날짜. 재 셋팅
						$("input[name='firstDay']").val($("input[name='day']").last().val());
						$("input[name='lastDay']").val($("input[name='day']").first().val());
						
				
						var daySum = [];
						for(var i =0; i<13; i++){
							daySum[i] = $("input[name='daySum']").eq(i).val();
						}
						

   			    		var ctx = document.getElementById("myAreaChart" + check01);
   	        			var myLineChart = new Chart(ctx, {
   	        			  type: 'line',
   	        			  data: {
   	        			    labels: [ day[0], day[1], day[2], day[3], day[4], day[5], day[6], day[7], day[8], day[9], day[10], day[11], day[12] ],
   	        			    datasets: [{
   	        			      label: "Sessions",
   	        			      lineTension: 0.3,
   	        			      backgroundColor: "rgba(2,117,216,0.2)",
   	        			      borderColor: "rgba(2,117,216,1)",
   	        			      pointRadius: 5,
   	        			      pointBackgroundColor: "rgba(2,117,216,1)",
   	        			      pointBorderColor: "rgba(255,255,255,0.8)",
   	        			      pointHoverRadius: 5,
   	        			      pointHoverBackgroundColor: "rgba(2,117,216,1)",
   	        			      pointHitRadius: 50,
   	        			      pointBorderWidth: 2,
   	        			      data: [ daySum[0], daySum[1], daySum[2], daySum[3], daySum[4], daySum[5], daySum[6], 
   	        			    	      daySum[7], daySum[8], daySum[9], daySum[10], daySum[11], daySum[12] ],
   	        			    }],
   	        			  },
   	        			  options: {
   	        			    scales: {
   	        			      xAxes: [{
   	        			        time: {
   	        			          unit: 'date'
   	        			        },
   	        			        gridLines: {
   	        			          display: false
   	        			        },
   	        			        ticks: {
   	        			          maxTicksLimit: 7
   	        			        }
   	        			      }],
   	        			      yAxes: [{
   	        			        ticks: {
   	        			          min: 0,
   	        			          max: 400000,
   	        			          maxTicksLimit: 8
   	        			        },
   	        			        gridLines: {
   	        			          color: "rgba(0, 0, 0, .125)",
   	        			        }
   	        			      }],
   	        			    },
   	        			    legend: {
   	        			      display: false
   	        			    }
   	        			  }
   	        			});
   			    		
   			    	
   			    	}

   			    }) // ajax 끝
       		})

// 왼쪽 버튼 클릭시       		
			
       		$(document).on('click', '.bi.bi-chevron-left', function(){
       			var theDay = $("input[name='lastDay']").val();
       			

       			$.ajax({ 
   			    	url : "prev.mdo",
   			    	type : 'post',
   			    	dataType : 'html',
   			    	data : {
   			    		"theDay" : theDay	
   			    	},
   			    	success:function(html){

   			    	// 기존에 있던 input 애들 다 삭제.
   			    		$("input[name='day']").remove();
   			    		$("input[name='daySum']").remove();
   			    	// 데이터 들어가있는 input 추가
   			    		$('#input').append(html);
   			    	
   			    		$('.chartjs-size-monitor').detach();
   			    	$('#myAreaChart').detach()
   			    	$('#myAreaChart' + check01).detach();
   			    	check01++;
   			    	$('.card-body').eq(4).append('<canvas id="myAreaChart' + check01 + '" width="100%" height="40"></canvas>');
   			    	
					//날짜 집어넣기.
						var day = [];
						for(var i = 0; i<13; i++){
							
							day[i] = $("input[name='day']").eq(12-i).val();
							
						}
					// 컨트롤러에 보내서 db쿼리 수행에 필요한 시작 날짜. 재 셋팅
 						$("input[name='lastDay']").val($("input[name='day']").last().val());
						$("input[name='firstDay']").val($("input[name='day']").first().val());
						
					// 가격 집어넣기.	
						var daySum = [];
						for(var i =0; i<13; i++){
							
							daySum[i] = $("input[name='daySum']").eq(12-i).val();
						}
						

   			    		var ctx = document.getElementById("myAreaChart" + check01);
   	        			var myLineChart = new Chart(ctx, {
   	        			  type: 'line',
   	        			  data: {
   	        			    labels: [ day[0], day[1], day[2], day[3], day[4], day[5], day[6], day[7], day[8], day[9], day[10], day[11], day[12] ],
   	        			    datasets: [{
   	        			      label: "Sessions",
   	        			      lineTension: 0.3,
   	        			      backgroundColor: "rgba(2,117,216,0.2)",
   	        			      borderColor: "rgba(2,117,216,1)",
   	        			      pointRadius: 5,
   	        			      pointBackgroundColor: "rgba(2,117,216,1)",
   	        			      pointBorderColor: "rgba(255,255,255,0.8)",
//    	        			      pointHoverRadius: 5,
   	        			      pointHoverBackgroundColor: "rgba(2,117,216,1)",
   	        			      pointHitRadius: 50,
   	        			      pointBorderWidth: 2,
   	        			      data: [ daySum[0], daySum[1], daySum[2], daySum[3], daySum[4], daySum[5], daySum[6], 
   	        			    	      daySum[7], daySum[8], daySum[9], daySum[10], daySum[11], daySum[12] ],
   	        			    }],
   	        			  },
   	        			  options: {
   	        			    scales: {
   	        			      xAxes: [{
   	        			        time: {
   	        			          unit: 'date'
   	        			        },
   	        			        gridLines: {
   	        			          display: false
   	        			        },
   	        			        ticks: {
   	        			          maxTicksLimit: 7
   	        			        }
   	        			      }],
   	        			      yAxes: [{
   	        			        ticks: {
   	        			          min: 0,
   	        			          max: 400000,
   	        			          maxTicksLimit: 8
   	        			        },
   	        			        gridLines: {
   	        			          color: "rgba(0, 0, 0, .125)",
   	        			        }
   	        			      }],
   	        			    },
   	        			    legend: {
   	        			      display: false
   	        			    }
   	        			  }
   	        			});
   			    		
   			    	
   			    	}

   			    }) // ajax 끝
       		})
       		
 // 바 차트      		
       		var ctx = document.getElementById("myBarChart");
       		var myLineChart = new Chart(ctx, {
       		  type: 'bar',
       		  data: {
       		    labels: ["January", "February", "March", "April", 
       		    		 "May", "June" , "July", "August", 
       		    		 "September", "October", "November", "December"],
       		    datasets: [{
       		      label: "Revenue",
       		      backgroundColor: "rgba(2,117,216,1)",
       		      borderColor: "rgba(2,117,216,1)",
       		      data: [${month0}, ${month4}, ${month5}, ${month6},
       		   			 ${month7}, ${month8}, ${month9}, ${month10},
       					 ${month11}, ${month1}, ${month2}, ${month3}],
       		    }],
       		  },
       		  options: {
       		    scales: {
       		      xAxes: [{
       		        time: {
       		          unit: 'month'
       		        },
       		        gridLines: {
       		          display: false
       		        },
       		        ticks: {
       		          maxTicksLimit: 12
       		        }
       		      }],
       		      yAxes: [{
       		        ticks: {
       		          min: 0,
       		          max: 10000000,
       		          maxTicksLimit: 5
       		        },
       		        gridLines: {
       		          display: true
       		        }
       		      }],
       		    },
       		    legend: {
       		      display: false
       		    }
       		  }
       		});
       		
       // 바차트 오른쪽		
       		var check02 = 0;
       		$(document).on('click','.bi.bar-chevron-right',function(){
       			var setYear =  $("input[name='month']").val();
       			var html ="";
       			$.ajax({
       				url : "nextMonth.mdo",
       				type : "post",
       				dataType : "html",
       				data : {
       					"setYear" : setYear
       				},
       				success : function(htmlOut){

       					$('.month-btn').children('.btn.btn-link').remove();
       					
       					html +='<button type="button" class="btn btn-link"  style="padding:5px 5px; margin-top:-8px;">';
       					html +='<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bar-chevron-left" viewBox="0 0 16 16">';
       					html +='<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>';
       					html +='</svg>';
       					html +='</button>';
       					$('.month-btn').append(html);
       					
//       			    	// 기존에 있던 input 애들 다 삭제.
   			    		$("input[name='monthSum']").remove();
   			    		// 데이터 들어가있는 input 추가
   			    		$('#input').append(htmlOut);
   			    		
   			    		var month = [];
   						//날짜 집어넣기.
						for(var i = 0; i<13; i++){
							
							month[i] = $("input[name='monthSum']").eq(i).val();
							
						}
       					
       					
       		       		var ctx = document.getElementById("myBarChart");
       		       		var myLineChart = new Chart(ctx, {
       		       		  type: 'bar',
       		       		  data: {
       		       		    labels: ["January", "February", "March", "April", 
       		       		    		 "May", "June" , "July", "August", 
       		       		    		 "September", "October", "November", "December"],
       		       		    datasets: [{
       		       		      label: "Revenue",
       		       		      backgroundColor: "rgba(2,117,216,1)",
       		       		      borderColor: "rgba(2,117,216,1)",
       		       		      data: [month[0], month[4], month[5], month[6],
       		       		   			 month[7], month[8], month[9], month[10],
       		       					 month[11], month[1], month[2], month[3] ],
       		       		    }],
       		       		  },
       		       		  options: {
       		       		    scales: {
       		       		      xAxes: [{
       		       		        time: {
       		       		          unit: 'month'
       		       		        },
       		       		        gridLines: {
       		       		          display: false
       		       		        },
       		       		        ticks: {
       		       		          maxTicksLimit: 12
       		       		        }
       		       		      }],
       		       		      yAxes: [{
       		       		        ticks: {
       		       		          min: 0,
       		       		          max: 10000000,
       		       		          maxTicksLimit: 5
       		       		        },
       		       		        gridLines: {
       		       		          display: true
       		       		        }
       		       		      }],
       		       		    },
       		       		    legend: {
       		       		      display: false
       		       		    }
       		       		  }
       		       		});
       					
       					
       				}
       			
       				
       			})// ajax 끝
       			
  
       		})
       // 바차트 왼쪽		
       		$(document).on('click','.bi.bar-chevron-left',function(){
       			var setYear =  $("input[name='month']").val();
       			var html ="";
       			$.ajax({
       				url : "prevMonth.mdo",
       				type : "post",
       				dataType : "html",
       				data : {
       					"setYear" : setYear
       				},
       				success : function(htmlOut){
 
       					$('.month-btn').children('.btn.btn-link').remove();
       					
       					html += '<button type="button" class="btn btn-link" style="padding:5px 5px; margin-top:-8px;">';
       					html += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bar-chevron-right" viewBox="0 0 16 16">';
       					html += '<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>';
       					html += '</svg>';
       					html += '</button>';      					
       					$('.month-btn').append(html);
       					
//   			    	// 기존에 있던 input 애들 다 삭제.
   			    		$("input[name='monthSum']").remove();
   			    		// 데이터 들어가있는 input 추가
   			    		$('#input').append(htmlOut);
   			    		
   			    		var month = [];
   						//날짜 집어넣기.
						for(var i = 0; i<13; i++){
							
							month[i] = $("input[name='monthSum']").eq(i).val();
							
						}
       					
       					var ctx = document.getElementById("myBarChart");
       		       		var myLineChart = new Chart(ctx, {
       		       		  type: 'bar',
       		       		  data: {
       		       		    labels: ["January", "February", "March", "April", 
       		       		    		 "May", "June" , "July", "August", 
       		       		    		 "September", "October", "November", "December"],
       		       		    datasets: [{
       		       		      label: "Revenue",
       		       		      backgroundColor: "rgba(2,117,216,1)",
       		       		      borderColor: "rgba(2,117,216,1)",
       		       		      data: [${month0}, ${month4}, ${month5}, ${month6},
       		       		   			 ${month7}, ${month8}, ${month9}, ${month10},
       		       					 ${month11}, ${month1}, ${month2}, ${month3}],
       		       		    }],
       		       		  },
       		       		  options: {
       		       		    scales: {
       		       		      xAxes: [{
       		       		        time: {
       		       		          unit: 'month'
       		       		        },
       		       		        gridLines: {
       		       		          display: false
       		       		        },
       		       		        ticks: {
       		       		          maxTicksLimit: 12
       		       		        }
       		       		      }],
       		       		      yAxes: [{
       		       		        ticks: {
       		       		          min: 0,
       		       		          max: 10000000,
       		       		          maxTicksLimit: 5
       		       		        },
       		       		        gridLines: {
       		       		          display: true
       		       		        }
       		       		      }],
       		       		    },
       		       		    legend: {
       		       		      display: false
       		       		    }
       		       		  }
       		       		});
       					
       					
       				}
       				
       			})// ajax 끝
       			
       			
       		})
       		


       		
 // 금주 매출  pdf 다운로드     		
       		$(document).on('click','.btn.btn-outline-danger:eq(0)',function(){	
       			alert("금주 pdf 다운");
       			$.ajax({
       				url : 'pdfDown.mdo',
       				success : function(htmlOut){
       					alert("pdf 다운 완료");
       					
       				}
       			})
       			
       		})
 // 금달 매출  pdf 다운로드     		
       		$(document).on('click','.btn.btn-outline-danger:eq(1)',function(){	
       			alert("금달 pdf 다운");
       			$.ajax({
       				url : 'pdfDown2.mdo',
       				success : function(htmlOut){
       					alert("pdf 다운 완료");
       					
       				}
       			})
       			
       		})


//      ------------------------  		
       	}) 

       	$(document).ready(function(){
    function alignModal(){
        var modalDialog = $(this).find(".modal-dialog");
        
        // Applying the top margin on modal dialog to align it vertically center
        modalDialog.css("margin-top", Math.max(0, ($(window).height() - modalDialog.height()) / 2));
//         modalDialog.css("margin-left", Math.max(0, ($(window).height() - modalDialog.height()) / 0.35));
    }
    // Align modal when it is displayed
    $(".modal").on("shown.bs.modal", alignModal);
    
    // Align modal when user resize the window
    $(window).on("resize", function(){
        $(".modal:visible").each(alignModal);
    });   
});
       	$(function(){
       	var nowTemp = new Date();
       	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

       	var checkin = $('#dp1').datepicker({

       	  beforeShowDay: function(date) {
       	    return date.valueOf() >= now.valueOf();
       	  },
       	  autoclose: true

       	}).on('changeDate', function(ev) {
       	  if (ev.date.valueOf() > checkout.datepicker("getDate").valueOf() || !checkout.datepicker("getDate").valueOf()) {

       	    var newDate = new Date(ev.date);
       	    newDate.setDate(newDate.getDate() + 1);
       	    checkout.datepicker("update", newDate);

       	  }
       	  $('#dp2')[0].focus();
       	});


       	var checkout = $('#dp2').datepicker({
       	  beforeShowDay: function(date) {
       	    if (!checkin.datepicker("getDate").valueOf()) {
       	      return date.valueOf() >= new Date().valueOf();
       	    } else {
       	      return date.valueOf() > checkin.datepicker("getDate").valueOf();
       	    }
       	  },
       	  autoclose: true

       	}).on('changeDate', function(ev) {});
        </script>
    </head>
    
    <body class="sb-nav-fixed">
    	<input type="hidden" name="firstDay" value="${startDay}">
    	<input type="hidden" name="lastDay" value="${startDay2}">
    	<input type="hidden" name="month" value="2022">
    	<input type="hidden" name="today" value="${today }">
<%--     	<input type="hidden" name="startDay2" value="${startDay2}"> --%>
	        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" id="input">
	        <!-- Navbar Brand-->
	            <a class="navbar-brand ps-3" href="index.html">Saladit - admin</a>
	        <!-- Sidebar Toggle-->
	            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
	        <!-- Navbar Search-->
	            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
	                <div class="input-group">
	                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
	                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
	                </div>
	            </form>
	        <!-- Navbar-->
	            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
	                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
	                        <li><a class="dropdown-item" href="#!">Settings</a></li>
	                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
	                        <li><hr class="dropdown-divider" /></li>
	                        <li><a class="dropdown-item" href="#!">Logout</a></li>
	                    </ul>
	                </li>
	            </ul>
	        </nav>
        
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav"> 
                            <a class="nav-link" href="adminMainChart.mdo">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Admin
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="adminCouponTypeManagement.mdo">쿠폰관리</a>
                                    <a class="nav-link" href="userCouponManage.mdo">발급쿠폰관리</a>
                                    <a class="nav-link" href="mdInfo.mdo">MD추천관리</a>
                                    <a class="nav-link" href="bannerManagement.mdo">배너관리</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                상품/판매
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        조회/등록/수정
                                    </a>  
                                </nav>
                            </div>
                            
                             <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseOrders" aria-expanded="false" aria-controls="collapseOrders">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                주문/배송
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseOrders" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionOrders">
                                    <a class="nav-link" href="#">주문목록</a>
                                    <a class="nav-link" href="#">배송중</a>
                                    <a class="nav-link" href="#">배송완료</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUser" aria-expanded="false" aria-controls="collapseUser">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                회원
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseUser" aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionUser">
                                    <a class="nav-link" href="memberManagement.mdo">회원관리</a>
                                    <a class="nav-link" href="#">리뷰관리</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link" href="#">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 매출/상품통계관리
							</a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>  
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                매출통계
                            </div>
                            <div class="card-body">
                            <div class="form-group">
							  <input id="dp1" type="text" class="form-control clickable input-md" id="DtChkIn" placeholder="&#xf133;  Check-In">
							</div>
							<div class="form-group">
							  <input id="dp2" type="text" class="form-control clickable input-md" id="DtChkOut" placeholder="&#xf133;  Check-Out">
							</div>
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>주문날짜</th>
                                            <th>판매금액</th>
                                            <th>뿅</th>
											<th>뿡</th>                                         
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>주문날짜</th>
                                            <th>판매금액</th>
                                            <th>뿅</th>
											<th>뿡</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>1위</td>
                                            <td>아쉬파 샐러드</td>
                                            <td>77</td>
                                            <td>999999999원</td>
                                        </tr>
                                        <tr>
                                            <td>2위</td>
                                            <td>잠봉 시저 샐러드</td>
                                            <td>73</td>
                                            <td>995657759원</td>
                                        </tr>
                                        <tr>
                                            <td>3위</td>
                                            <td>홀그레인 로스트비프 바게트 샌드</td>
                                            <td>68</td>
                                            <td>945274555원</td>
                                        </tr>
                                        <tr>
                                            <td>4위</td>
                                            <td>바베큐 풀드포크 바게트 샌드</td>
                                            <td>60</td>
                                            <td>934662453원</td>
                                        </tr>
                                        <tr>
                                            <td>5위</td>
                                            <td>[올가니카]플랜트 왕교자</td>                      
                                            <td>56</td>
                                            <td>457457388원</td>
                                        </tr>
                                        <tr>
                                            <td>6위</td>
                                            <td>[그리팅]땅콩호박스프</td>                      
                                            <td>50</td>
                                            <td>456453788원</td>
                                        </tr>
                                        <tr>
                                            <td>7위</td>
                                            <td>샐러드와 고구마 든든세트</td>                      
                                            <td>48</td>
                                            <td>453344336원</td>
                                        </tr>
                                        <tr>
                                            <td>8위</td>
                                            <td>샐러드와 계란 촉촉세트</td>                      
                                            <td>45</td>
                                            <td>421243235원</td>
                                        </tr>
                                        <tr>
                                            <td>9위</td>
                                            <td>딸기 바닐라 크림치즈 샐러드</td>                      
                                            <td>35</td>
                                            <td>234346555원</td>
                                        </tr>
                                        <tr>
                                            <td>10위</td>
                                            <td>들기름 메밀면 샐러드</td>                      
                                            <td>22</td>
                                            <td>212334555원</td>
                                        </tr>

                                     
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
               
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${path}/assets/demo/chart-area-demo.js?ver=1"></script>
<%--         <script src="${path}/assets/demo/chart-bar-demo.js"></script> --%>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/js/datatables-simple-demo.js"></script>
    </body>
</html>