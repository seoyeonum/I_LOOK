/*=================================================
	GenPayDTO.java
	- 일반 돌봄 결제 데이터 자료형 클래스
	  (일반 돌봄 결제 내역, 일반 돌봄 포인트 차감)
=================================================*/

package com.team1.dto;

public class GenPayDTO
{
	// 주요 속성 구성
	private String gen_pay_rec_id, gen_req_id;					// 일반 돌봄 결제 코드, 일반 돌봄 예약 신청 코드
		
	private String pg_code;										// 전자 결제 코드
	private String pay_date, par_read_date, used_date;			// 결제 일자, 부모가 읽은 날짜, 포인트 차감 일자
	
	private int pay_amount, point;								// 결제 금액, 포인트 차감액
	
	private String gen_point_used_id;							// 포인트 차감 코드
	private String point_subject;								// 포인트 차감 대상자
	
	// 속성 추가
<<<<<<< HEAD
	String type, status, par_name, req_date;					// 돌봄유형, 예약상태, 부모이름, 예약신청일
=======
	private String type, status, par_name, req_date;			// 돌봄유형, 예약상태, 부모이름, 예약신청일
>>>>>>> origin/develop

	// getter / setter 구성
	public String getGen_pay_rec_id() {
		return gen_pay_rec_id;
	}

	public void setGen_pay_rec_id(String gen_pay_rec_id) {
		this.gen_pay_rec_id = gen_pay_rec_id;
	}

	public String getGen_req_id() {
		return gen_req_id;
	}

	public void setGen_req_id(String gen_req_id) {
		this.gen_req_id = gen_req_id;
	}

	public String getPg_code() {
		return pg_code;
	}

	public void setPg_code(String pg_code) {
		this.pg_code = pg_code;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public String getPar_read_date() {
		return par_read_date;
	}

	public void setPar_read_date(String par_read_date) {
		this.par_read_date = par_read_date;
	}

	public String getUsed_date() {
		return used_date;
	}

	public void setUsed_date(String used_date) {
		this.used_date = used_date;
	}

	public int getPay_amount() {
		return pay_amount;
	}

	public void setPay_amount(int pay_amount) {
		this.pay_amount = pay_amount;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getGen_point_used_id() {
		return gen_point_used_id;
	}

	public void setGen_point_used_id(String gen_point_used_id) {
		this.gen_point_used_id = gen_point_used_id;
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
