<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sales</title>
</head>
<body>
  <table id="sales_Table">
                <tr>
                    <td id="title"><b>펀딩매출 상세페이지</b></td>
                    <td ></td>
                </tr>
                <tr>
                    <td id="title">상품번호 : </td>
                    <td ><input type="text" name="p_no"  class="in_box" value="${product.p_no}" ></td>
                </tr>
                 <tr>
                    <td id="title">메이커명 : </td>
                    <td ><input type="text" name="maker_name"  class="in_box" value="${product.p_name}" ></td>
                </tr>
                 <tr>
                    <td id="title">카테고리 : </td>
                    <td ><input type="text" name="category_id"  class="in_box" value="${option.option_name}" ></td>
                </tr>
                <tr>
                    <td id="title">상품명 : </td>
                    <td ><input type="text" name="p_name"  class="in_box" value="${product.p_name}" ></td>
                </tr>
                <tr>
                    <td id="title">펀딩시작일 : </td>
                    <td ><input type="text" name="start_day"  class="in_box" value="${product.start_day}" ></td>
                </tr>
                 <tr>
                    <td id="title">펀딩마감일 : </td>
                    <td ><input type="text" name="end_day"  class="in_box" value="${product.end_day}" ></td>
                </tr>
                 <tr>
                    <td id="title">목표금액 : </td>
                    <td ><input type="text" name="p_goal"  class="in_box" value="${product.p_goal}" ></td>
                </tr>
                <tr>
                    <td id="title">달성율 : </td>
                    <td ><input type="text" name=""  class="in_box" value="" ></td>
                </tr>
                 <tr>
                    <td id="title">총판매수량 : </td>
                    <td ><input type="text" name=""  class="in_box" value="" ></td>
                </tr>
                <tr>
                    <td id="title">총 펀딩금액 : </td>
                    <td ><input type="text" name=""  class="in_box" value="" ></td>
                </tr>
                 <tr>
                    <td id="title">수수료 : </td>
                    <td ><input type="text" name=""  class="in_box" value="" ></td>
                </tr>
                <hr>
                 <tr>
                    <td id="title">최종 정산금액 : </td>
                    <td ><input type="text" name=""  class="in_box" value="" ></td>
                </tr>
            </table>

</body>
</html>