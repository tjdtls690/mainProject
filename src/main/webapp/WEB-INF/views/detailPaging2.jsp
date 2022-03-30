<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

                                  <div data-v-20ad18c6="" class="nav-paginate-wrap__mobile">
                                     <nav data-v-43f58a9c="" data-v-20ad18c6="" class="nav-paginate">
                                        <ul class="btn-group pagination">
										     <c:if test="${pageMaker.prev }">
											    <li>
											    	<button>
											        	<i class="fa fa-chevron-left Mobile">
											        		<input type="hidden" value="${pageMaker.startPage-1}" id="PageNumValuePrevMobile" >
												        	<input type="hidden" value="${detail.item_code}" id="ItemCodeValuePrevMobile" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValuePrevMobile" >
											        		<img data-v-43f58a9c class="nav-arrow arrow-left" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_left_s.png">
											        	</i>
											        </button>
											    </li>
										    </c:if>
										     <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
											    <li>
													<button >
											        	<i class="fa pageNum Mobile">
												        	<input type="hidden" value="${pageNum}" id="PageNumValueMobile" >
												        	<input type="hidden" value="${detail.item_code}" id="ItemCodeValueMobile" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValueMobile" >
												        	${pageNum }
											        	 </i> 
											   		</button>
											    </li>
											    &nbsp;&nbsp;&nbsp;
										    </c:forEach>
										     <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
											    <li>
													<button>
											        	<i class="fa fa-chevron-right Mobile">
											        		<input type="hidden" value="${pageMaker.endPage + 1}" id="PageNumValueNextMobile" >
											        		<input type="hidden" value="${detail.item_code}" id="ItemCodeValueNextMobile" >
												        	<input type="hidden" value="${detail.item_tag_main}" id="TagMainValueNextMobile" >
											        		<img data-v-43f58a9c class="nav-arrow arrow-right" src="https://saladits3.s3.ap-northeast-2.amazonaws.com/Logo/icon_arrow_right(s).png">
											        	</i>
											        </button>
											    </li>
										    </c:if>
										</ul>
                                     </nav>
                                  </div>
                                  <div data-v-20ad18c6 class="nav-paginate-wrap__desktop">
                                     <nav data-v-43f58a9c data-v-20ad18c6 class="nav-paginate">
<!--                                         <a data-v-43f58a9c href="#" class="nav-paginate__dir nav-paginate-dir-prev" style="opacity: 0.2;"> -->
<!--                                             <img data-v-43f58a9c src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-left%402x.png"  class="nav-arrow arrow-left"> -->
<!--                                         </a> -->
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
<!--                                         <a data-v-43f58a9c="" href="#" class="nav-paginate__dir nav-paginate-dir-next" style="opacity: 1;"> -->
<!--                                            <img data-v-43f58a9c src="https://saladits3.s3.ap-northeast-2.amazonaws.com/productsdetailpage/images/arrow-right%402x.png"  class="nav-arrow arrow-right"> -->
<!--                                         </a> -->
                                     </nav>
                                  </div>
                               </div>
                            </section>