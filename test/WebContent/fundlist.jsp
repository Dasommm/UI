<%@page import="com.everyfarm.fundproduct.dto.FundDto"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>funding list</title>
    <link href="../resources/css/fund/fundlist.css" rel="stylesheet" type="text/css">
</head>

<body>

    <%
	List<FundDto> list = (List<FundDto>)session.getAttribute("allList");
	List<FundDto> bestlist = (List<FundDto>)session.getAttribute("bestList");
	
%>

    <%@ include file="../home/header.jsp" %>
    <section>
        <img id="fundIntro" alt="fundIntroImage" src="../resources/images/fund/fundintro.jpg">

        <!-- 펀드 검색 -->
        <div>
            <span id="titleone">펀드 상태 :</span>
            <select>
                <option>모두</option>
                <option selected="selected">진행중</option>
                <option>종료</option>
            </select>
            <input type="button" class="btn" value="검색">
        </div>
        <br><br><br>

        <!-- best 펀드 상품  -->
        <article>
            <div id="">
                <h1 class="bestproduct"><span style="color:darkorange;">Best</span> 펀드 상품</h1>
                <div class="fixed-container">
                    <div class="shop-list">
                        <%
						for(int i = 0; i < bestlist.size();i++){				
		%>
                        <!-- for문 돌려서 best 뽑기 -->
                        <div class="shop-list__item">
                            <a href="../fund.do?command=fundDetail&stock_no=<%=bestlist.get(i).getStock_no() %>">
                                <img alt="" src="" style="width:300px; height: 250px; cursor:pointer;">
                            </a>

                            <div class="item-disc">
                                <img alt="" src="">
                                <div id="item-title"><%=bestlist.get(i).getStock_name() %></div>
                                <h2 class="seller">
                                    <%=bestlist.get(i).getMem_id() %>
                                    <img alt="" src="" style="width:8%; margin:0% 0% -2% 70%; cursor:pointer;"><br>
                                </h2>
                                <span id="productprice"><%=bestlist.get(i).getFund_currentprice() %></span>
                            </div>

                            <div class="item-price-block">
                                <div class="item-price">
                                    <table border="1">
                                        <tr>
                                            <td><%=bestlist.get(i).getFund_join() %></td>
                                            <td><%=bestlist.get(i).getFund_enddate() %></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <%					
						}
		
		%>
                    </div>
                </div>
            </div>
            <br><br><br>
            <hr><br>

            <!-- 진행중인 모든 펀드 상품(등록일 별) -->
            <div>
                <h1 class="bestproduct">펀드 상품</h1>
                <div class="fixed-container">
                    <div class="shop-list">
                        <%
					for(int i = 0; i <list.size() ; i++ ){
%>
                        <div class="shop-list__item">
                            <a href="../fund.do?command=fundDetail&stock_no=" <%=list.get(i).getStock_no() %>>
                                <img alt="" src="" style="width:300px; height: 250px; cursor:pointer;">
                            </a>
                            <div class="item-disc">
                                <img alt="" src="">
                                <div id="item-title"><%=list.get(i).getStock_name() %></div>
                                <h2 class="seller">
                                    <%=list.get(i).getMem_id() %>
                                    <img alt="" src="" style="width:8%; margin:0% 0% -2% 70%; cursor:pointer;"><br>
                                </h2>
                                <span id="productprice"><%=list.get(i).getFund_currentprice() %></span>
                            </div>

                            <div class="item-price-block">
                                <div class="item-price">
                                    <table border="1">
                                        <tr>
                                            <td><%=list.get(i).getFund_currentprice() %></td>
                                            <td><%=list.get(i).getFund_enddate() %></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <%						
					}

%>
                    </div>
                </div>
            </div>

            <!-- 페이징 -->

        </article>
    </section>


    <%@ include file="../home/footer.jsp" %>


</body>

</html>