<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>결제 페이지</title>
    <link rel="stylesheet" type="text/css" href="css/payment.css">
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
<div class="container">
    <h1>결제하기</h1>

    <form class="payment-form" onsubmit="return requestCardPayment(event)">
        <label for="product">상품명</label>
        <input type="text" id="product" name="product" value="샘플 상품" required readonly>

        <label for="amount">금액 (₩)</label>
        <input type="number" id="amount" name="amount" value="10000" required readonly>

        <label for="card-company">카드사 선택</label>
        <select id="card-company" name="card-company" required>
            <option value="">카드사를 선택하세요</option>
            <option value="shinhan">신한카드</option>
            <option value="kb">KB국민카드</option>
            <option value="samsung">삼성카드</option>
            <option value="hyundai">현대카드</option>
            <option value="lotte">롯데카드</option>
        </select>

        <label for="card-number">카드 번호</label>
        <input type="text" id="card-number" name="card-number" placeholder="1234-5678-9012-3456" maxlength="19" required>

        <label for="expiry">유효기간 (MM/YY)</label>
        <input type="text" id="expiry" name="expiry" placeholder="MM/YY" maxlength="5" required>

        <label for="cvc">CVC</label>
        <input type="text" id="cvc" name="cvc" placeholder="123" maxlength="3" required>

        <button type="submit">신용카드로 결제</button>
    </form>

    <div class="other-payments">
        <p>다른 결제 수단</p>
        <button class="disabled-button" onclick="alertNotSupported()">카카오페이</button>
        <button class="disabled-button" onclick="alertNotSupported()">네이버페이</button>
    </div>

    <p class="info">※ 실제 결제는 이루어지지 않습니다. 데모 페이지입니다.</p>
</div>

<script>
    const IMP = window.IMP;
    IMP.init("imp00000000"); // 테스트용 가맹점 코드

    // 자동 하이픈 및 입력 제한
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('card-number').addEventListener('input', function (e) {
            let value = e.target.value.replace(/\D/g, '').substring(0, 16);
            let sections = value.match(/.{1,4}/g);
            e.target.value = sections ? sections.join('-') : '';
        });

        document.getElementById('expiry').addEventListener('input', function (e) {
            let value = e.target.value.replace(/\D/g, '').substring(0, 4);
            if (value.length >= 3) {
                value = value.substring(0, 2) + '/' + value.substring(2);
            }
            e.target.value = value;
        });

        document.getElementById('cvc').addEventListener('input', function (e) {
            e.target.value = e.target.value.replace(/\D/g, '').substring(0, 3);
        });
    });

    function requestCardPayment(event) {
        event.preventDefault();

        const amount = parseInt(document.getElementById('amount').value);
        const name = document.getElementById('product').value;
        const buyer_name = "홍길동";
        const buyer_email = "test@example.com";

        IMP.request_pay({
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: "order_" + new Date().getTime(),
            name: name,
            amount: amount,
            buyer_email: buyer_email,
            buyer_name: buyer_name
        }, function (rsp) {
            if (rsp.success) {
                alert("✅ 결제 성공!\n주문번호: " + rsp.merchant_uid + "\nimp_uid: " + rsp.imp_uid);
            } else {
                alert("❌ 결제 실패: " + rsp.error_msg);
            }
        });

        return false;
    }

    function alertNotSupported() {
        alert("이 결제 방식은 현재 지원되지 않습니다.");
    }
</script>
</body>
</html>
