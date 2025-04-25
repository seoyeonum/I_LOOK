/*============================================
	EmgPayDTO.java
	- 긴급 돌봄 결제 데이터 자료형 클래스
	  (긴급 돌봄 결제, 포인트 차감)
============================================*/

package com.team1.dto;

public class EmgPayDTO
{
	// 주요 속성 구성
	private String emg_pay_rec_id;						// 긴급 돌봄 결제 코드
	private String emg_req_id;							// 긴급 돌봄 요청 등록 코드
	private String pg_code;								// 전자 결제 코드
	private String par_read_date;						// 부모가 읽은 날짜
	
	private String payed_date, used_date;				// 결제 일시, 포인트 차감 일자
	private int amount, point;							// 결제 금액, 포인트 차감액
	
	private String emg_point_used_id;					// 포인트 차감 코드
	private String point_subject;						// 포인트 차감 대상자
	
	// 속성 추가
	private String type, status, par_name, req_date;	// 돌봄유형, 예약상태, 부모이름, 예약요청일


	// getter / setter 구성
	public String getEmg_pay_rec_id() {
		return emg_pay_rec_id;
	}

	public void setEmg_pay_rec_id(String emg_pay_rec_id) {
		this.emg_pay_rec_id = emg_pay_rec_id;
	}

	public String getEmg_req_id() {
		return emg_req_id;
	}

	public void setEmg_req_id(String emg_req_id) {
		this.emg_req_id = emg_req_id;
	}

	public String getPg_code() {
		return pg_code;
	}

	public void setPg_code(String pg_code) {
		this.pg_code = pg_code;
	}

	public String getPar_read_date() {
		return par_read_date;
	}

	public void setPar_read_date(String par_read_date) {
		this.par_read_date = par_read_date;
	}

	public String getPayed_date() {
		return payed_date;
	}

	public void setPayed_date(String payed_date) {
		this.payed_date = payed_date;
	}

	public String getUsed_date() {
		return used_date;
	}

	public void setUsed_date(String used_date) {
		this.used_date = used_date;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getEmg_point_used_id() {
		return emg_point_used_id;
	}

	public void setEmg_point_used_id(String emg_point_used_id) {
		this.emg_point_used_id = emg_point_used_id;
	}

	public String getPoint_subject() {
		return point_subject;
	}

	public void setPoint_subject(String point_subject) {
		this.point_subject = point_subject;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPar_name() {
		return par_name;
	}

	public void setPar_name(String par_name) {
		this.par_name = par_name;
	}

	public String getReq_date() {
		return req_date;
	}

	public void setReq_date(String req_date) {
		this.req_date = req_date;
	}
	
}
