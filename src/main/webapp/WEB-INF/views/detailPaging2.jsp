<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

                                  <div data-v-20ad18c6="" class="nav-paginate-wrap__mobile">
                                     <nav data-v-43f58a9c="" data-v-20ad18c6="" class="nav-paginate">
                                        <ul class="btn-group pagination">
										    <c:if test="${pageMaker.prev }">
											    <li>
											        <a href='<c:url value="/detail.do?page=${pageMaker.startPage-1 }"/>'>
														 <a data-v-43f58a9c="" href='detail.do?page=${pageMaker.startPage-1 }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}'>
											        <i class="fa fa-chevron-left"><img data-v-43f58a9c class="nav-arrow arrow-left" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_left_s.png"></i>
											        </a>
											    </li>
										    </c:if>
										    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
											    <li>
											        <a href='<c:url value="/detail.do?page=${pageNum }"/>'>
													<a data-v-43f58a9c="" href="#">
											        <i class="fa pageNum">
											        	<input type="hidden" value="${pageNum}" id="PageNumValue" >
											        	<input type="hidden" value="${detail.item_code}" id="ItemCodeValue" >
											        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValue" >
											        	${pageNum }  
											        </i> 
											        </a>
											    </li>
										    </c:forEach>
										    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
											    <li>
											        <a href='<c:url value="/detail.do?page=${pageMaker.endPage+1 }"/>'>
														 <a data-v-43f58a9c="" href='detail.do?page=${pageMaker.endPage+1 }&itemCode01=${detail.item_code}&tagMain01=${detail.item_tag_main}'>
											        <i class="fa fa-chevron-right"><img data-v-43f58a9c class="nav-arrow arrow-right" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_right(s).png"></i>
											        </a>
											    </li>
										    </c:if>
										</ul>
                                     </nav>
                                  </div>
                                  <div data-v-20ad18c6 class="nav-paginate-wrap__desktop">
                                     <nav data-v-43f58a9c data-v-20ad18c6 class="nav-paginate">
										<ul class="btn-group pagination">
										    <c:if test="${pageMaker.prev }">
											    <li>
													<button>
											        	<i class="fa fa-chevron-left">
											        		<input type="hidden" value="${pageMaker.startPage-1}" id="PageNumValuePrev" >
												        	<input type="hidden" value="${detail.item_code}" id="ItemCodeValuePrev" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValuePrev" >
											        		<img data-v-43f58a9c class="nav-arrow arrow-left" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_left_s.png">
											        	</i>
											        </button>
											    </li>
										    </c:if>
										    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
											    <li>
													<button >
											        	<i class="fa pageNum">
												        	<input type="hidden" value="${pageNum}" id="PageNumValue" >
												        	<input type="hidden" value="${detail.item_code}" id="ItemCodeValue" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValue" >
												        	${pageNum }
											        	 </i> 
											   		</button>
											    </li>
											    &nbsp;&nbsp;&nbsp;
										    </c:forEach>
										    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
											    <li>
													<button>
											        	<i class="fa fa-chevron-right">
											        		<input type="hidden" value="${pageMaker.endPage + 1}" id="PageNumValueNext" >
											        		<input type="hidden" value="${detail.item_code}" id="ItemCodeValueNext" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValueNext" >
											        		<img data-v-43f58a9c class="nav-arrow arrow-right" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_right(s).png">
											        	</i>
											        </button>
											    </li>
										    </c:if>
										</ul>
										</nav>
                                  </div>
                               </div>
                            </section>