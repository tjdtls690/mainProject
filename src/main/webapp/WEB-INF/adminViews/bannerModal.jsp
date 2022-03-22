                                          <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Modal</title>
    <style>
       .modal-header{
       background: #F7941E;
       color: #fff;
       }
    </style>
    <script>
		$(function (){
		$(document).on('click','.btn.btn-primary.submit', function(){
			alert("modaljsp");
// 					var url = $('.table.table-bordered.dataTable').children('#banner_url').innerHTML;
// 					alert(url);
			var url = document.getElementById("banner_url").value;
			var name = document.getElementById("banner_name").value;
			var id = document.getElementById("banner_id").value;
			var content = document.getElementById("banner_content").value;
			var mobile = document.getElementById("banner_mobile").value;
			
			$.ajax({
				url : 'bannerInsert.mdo',
				type : 'post',
				datatype : 'html',
				data : {
					"url" : url,
					"name" : name,
					"id" : id,
					"content" : content,
					"mobile" : mobile
				},
				success : function(data){
					 alert("등록 성공");
					 location.href="bannerManagement.mdo";
				}
			});
		});
	});
    </script>
  </head>
  <body>
   <div class="container mt-5">
   <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">Contact Us</button>
   <div class="modal" id="myModal">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title">Banner 등록</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
         </div>
         <div class="modal-body">
            <!-- form -->
	           						<form action = "admin_bannerInsert.mdo" method = "POST" enctype = "multipart/form-data" id="frm1">
	           							
	           							<!-- table -->
	           							<table class = "table table-bordered dataTable" cellspacing = "0" >
	           						
<!-- 	           								<tr> -->
<!-- 												<th scope="row" width=70> -->
<!-- 													TAG -->
<!-- 												</th> -->
<!-- 												<td width=150> -->
<!-- 													<div class="row"> -->
<!-- 													  <div class="col" style = "margin-right : 0%;"> -->
<!-- 													    <select class="form-select" id="floatingSelect" aria-label="Floating label select example"> -->
<!-- 													    <option selected>main</option> -->
<!-- 													    <option value="1">100</option> -->
<!-- 													    <option value="2">200</option> -->
<!-- 													    <option value="3">300</option> -->
<!-- 													    <option value="3">400</option> -->
<!-- 													    <option value="3">500</option> -->
<!-- 													    <option value="3">600</option> -->
<!-- 													    <option value="3">700</option> -->
<!-- 													  </select> -->
<!-- 													  </div> -->
<!-- 													  <div class="col" > -->
<!-- 													    <select class="form-select" id="floatingSelect" aria-label="Floating label select example"> -->
<!-- 													    <option selected>sub</option> -->
<!-- 													    <option value="1">101</option> -->
<!-- 													    <option value="2">102</option> -->
<!-- 													    <option value="3">103</option> -->
<!-- 													  </select> -->
<!-- 													  </div> -->
<!-- 													</div> -->
<!-- 												</td> -->
<!-- 											</tr> -->
											<!-- <tr>
												<th scope="row">
													상품명
												</th>
												<td>
													<input type="text" name="banner_contents"/>
												</td>
											</tr> -->
											<tr>
												<th scope="row">
													MAIN
												</th>
												<td>
													<input type="file" name="uploadFile" id="uploadFileDesk" />
												</td>
											</tr>
											<tr>
												<th scope="row">
													MOBILE
												</th>
												<td>
													<input type="file" name="uploadFile" id="uploadFileMobile"/>
												</td>
											</tr>
											<tr>
												<th scope="row">
													DESK URL
												</th>
												<td>
													<input type="text" name="banner_url" id="banner_url" placeholder="서버에 저장된 url 입력"/>
												</td>
											</tr>
											<tr>
												<th scope="row">
													MOBILE URL
												</th>
												<td>
													<input type="text" name="banner_url" id="banner_mobile" placeholder="서버에 저장된 url 입력"/>
												</td>
											</tr>
											<tr>
												<th scope="row">
													NAME
												</th>
												<td>
													<input type="text" name="banner_name" id="banner_name" placeholder="상품 이름"/>
												</td>
											</tr>
											<tr>
												<th scope="row">
													ID
												</th>
												<td>
													<input type="text" name="banner_id" id="banner_id" placeholder="slide00"/>
												</td>
											</tr>
											<tr>
												<th scope="row">
													Banner Content
												</th>
												<td>
													<input type="text" name="banner_content" id="banner_content" placeholder="배너 내용"/>
												</td>
											</tr>
											<!-- <tr>
												<th scope="row">
													상품설명
												</th>
												<td>
													<textarea name="banner_subcontents" ></textarea>
												</td>
											</tr>
	           								<tr>
												<th scope="row">
													영양정보
												</th>
												<td>
													<textarea name="banner_subcontents" ></textarea>
												</td>
											</tr>
											<tr>
												<th scope="row">
													상품정보
												</th>
												<td>
													<textarea name="banner_subcontents" ></textarea>
												</td>
											</tr>
											
											<tr>
												<th scope="row">
													이미지
												</th>
												<td>
													<input type="file" name="uploadFile" />
												</td>
											</tr>
											<tr>
												<th scope="row">
													상품 상세 정보 이미지
												</th>
												<td>
													<input type="file" name="uploadFile" />
												</td>
											</tr> -->
	           							</table>
	           							
	           							<!--// table -->
	           							
	           					
	           							
	           						</form>
	           						
         </div>
         <div class="modal-footer">
         <button type="submit" class="btn btn-primary">Cancel</button>
         <button type="submit" class="btn btn-primary submit">Upload</button>
         </div>
         </div>
         </div>
         </div>
   </div>

 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  </body>
</html>