package com.team1.dto;
// 일반 돌봄 취소 데이터 자료형 클래스 (취소 사유, 취소, 환불)

public class GenCanceledDTO
{
	// 일반 돌봄 예약 확정 후 취소 (부모)
	private String gen_par_confirmed_canceled_id, gen_confirmed_id, canceled_date, par_read_date, sit_read_date;
	
	// 일반 돌봄 예약 확정 후 취소 환불
	private String gen_par_confirmed_refunded_id, refunded_date, pg_code;
	private int amount;		//-- 환불 금액
	
	// 일반 돌봄 예약 확정 후 취소 (시터)
	private String gen_sit_confirmed_canceled_id;
	
	// 일반 돌봄 예약 확정 후 취소 환불 
	private String gen_sit_confirmed_refunded_id;
	
	// 일반 돌봄 예약 취소
	private String gen_canceled_id, gen_pay_rec_id;
	
	// 일반 돌봄 환불 내역
	private String gen_refunded_id;
	
	// 취소 사유 분류
	private String reason_canceled_id, type;
	
	// 속성 추가
	
	private String gen_req_id, status, par_name, req_date;
	//-- 일반 돌봄 예약 신청 코드, 예약상태, 부모이름, 요청일
	private String gen_reg_id, par_backup_id, name, message;
	//-- 일반 돌봄 근무 등록 코드, 부모 백업 코드, (아이) 이름, 메시지
	private int pay_amount, point;
	//-- 결제 금액, 포인트 차감액
	private String start_date, end_date, start_time, end_time;
	//-- 돌봄 시작일, 돌봄 종료일, 돌봄 시작시, 돌봄 종료시
	
	

	// getter / setter 구성
	public String getGen_par_confirmed_canceled_id() {
		return gen_par_confirmed_canceled_id;
	}
	public void setGen_par_confirmed_canceled_id(String gen_par_confirmed_canceled_id) {
		this.gen_par_confirmed_canceled_id = gen_par_confirmed_canceled_id;
	}
	public String getGen_confirmed_id() {
		return gen_confirmed_id;
	}
	public void setGen_confirmed_id(String gen_confirmed_id) {
		this.gen_confirmed_id = gen_confirmed_id;
	}
	public String getCanceled_date() {
		return canceled_date;
	}
	public void setCanceled_date(String canceled_date) {
		this.canceled_date = canceled_date;
	}
	public String getPar_read_date() {
		return par_read_date;
	}
	public void setPar_read_date(String par_read_date) {
		this.par_read_date = par_read_date;
	}
	public String getSit_read_date() {
		return sit_read_date;
	}
	public void setSit_read_date(String sit_read_date) {
		this.sit_read_date = sit_read_date;
	}
	public String getGen_par_confirmed_refunded_id() {
		return gen_par_confirmed_refunded_id;
	}
	public void setGen_par_confirmed_refunded_id(String gen_par_confirmed_refunded_id) {
		this.gen_par_confirmed_refunded_id = gen_par_confirmed_refunded_id;
	}
	public String getRefunded_date() {
		return refunded_date;
	}
	public void setRefunded_date(String refunded_date) {
		this.refunded_date = refunded_date;
	}
	public String getPg_code() {
		return pg_code;
	}
	public void setPg_code(String pg_code) {
		this.pg_code = pg_code;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getGen_sit_confirmed_canceled_id() {
		return gen_sit_confirmed_canceled_id;
	}
	public void setGen_sit_confirmed_canceled_id(String gen_sit_confirmed_canceled_id) {
		this.gen_sit_confirmed_canceled_id = gen_sit_confirmed_canceled_id;
	}
	public String getGen_sit_confirmed_refunded_id() {
		return gen_sit_confirmed_refunded_id;
	}
	public void setGen_sit_confirmed_refunded_id(String gen_sit_confirmed_refunded_id) {
		this.gen_sit_confirmed_refunded_id = gen_sit_confirmed_refunded_id;
	}
	public String getGen_canceled_id() {
		return gen_canceled_id;
	}
	public void setGen_canceled_id(String gen_canceled_id) {
		this.gen_canceled_id = gen_canceled_id;
	}
	public String getGen_pay_rec_id() {
		return gen_pay_rec_id;
	}
	public void setGen_pay_rec_id(String gen_pay_rec_id) {
		this.gen_pay_rec_id = gen_pay_rec_id;
	}
	public String getGen_refunded_id() {
		return gen_refunded_id;
	}
	public void setGen_refunded_id(String gen_refunded_id) {
		this.gen_refunded_id = gen_refunded_id;
	}
	public String getReason_canceled_id() {
		return reason_canceled_id;
	}
	public void setReason_canceled_id(String reason_canceled_id) {
		this.reason_canceled_id = reason_canceled_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getGen_req_id() {
		return gen_req_id;
	}
	public void setGen_req_id(String gen_req_id) {
		this.gen_req_id = gen_req_id;
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
	public String getGen_reg_id() {
		return gen_reg_id;
	}
	public void setGen_reg_id(String gen_reg_id) {
		this.gen_reg_id = gen_reg_id;
	}
	public String getPar_backup_id() {
		return par_backup_id;
	}
	public void setPar_backup_id(String par_backup_id) {
		this.par_backup_id = par_backup_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
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
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

}
