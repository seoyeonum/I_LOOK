/*============================================
	EmgCanceledDTO.java
	- 긴급 돌봄 취소 데이터 자료형 클래스
	  (긴급 돌봄 요청 취소, 취소 사유
	 , 긴급 돌봄 환불 내역)
============================================*/

package com.team1.mybatis;

public class EmgCanceledDTO
{
	// 주요 속성 구성
	String emg_canceled_id;				// 긴급 돌봄 요청 취소 코드
	String emg_pay_rec_id;				// 긴급 돌봄 결제 코드
	String canceled_date;				// 긴급 돌봄 요청 취소 일자
	String par_read_date;				// 부모가 읽은 날짜

	String reason_canceled_id, type;	// 취소 사유 코드, 취소 타입
	
	String emg_refunded_id;				// 긴급 요청 환불 코드
	String refunded_date;				// 환불 일시
	int amount, point;					// 환불 금액, 환불 포인트
	String pg_code;						// 전자 결제 코드
	
	// getter / setter 구성
	public String getEmg_canceled_id()
	{
		return emg_canceled_id;
	}
	public void setEmg_canceled_id(String emg_canceled_id)
	{
		this.emg_canceled_id = emg_canceled_id;
	}
	public String getEmg_pay_rec_id()
	{
		return emg_pay_rec_id;
	}
	public void setEmg_pay_rec_id(String emg_pay_rec_id)
	{
		this.emg_pay_rec_id = emg_pay_rec_id;
	}
	public String getCanceled_date()
	{
		return canceled_date;
	}
	public void setCanceled_date(String canceled_date)
	{
		this.canceled_date = canceled_date;
	}
	public String getPar_read_date()
	{
		return par_read_date;
	}
	public void setPar_read_date(String par_read_date)
	{
		this.par_read_date = par_read_date;
	}
	public String getReason_canceled_id()
	{
		return reason_canceled_id;
	}
	public void setReason_canceled_id(String reason_canceled_id)
	{
		this.reason_canceled_id = reason_canceled_id;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public String getEmg_refunded_id()
	{
		return emg_refunded_id;
	}
	public void setEmg_refunded_id(String emg_refunded_id)
	{
		this.emg_refunded_id = emg_refunded_id;
	}
	public String getRefunded_date()
	{
		return refunded_date;
	}
	public void setRefunded_date(String refunded_date)
	{
		this.refunded_date = refunded_date;
	}
	public int getAmount()
	{
		return amount;
	}
	public void setAmount(int amount)
	{
		this.amount = amount;
	}
	public int getPoint()
	{
		return point;
	}
	public void setPoint(int point)
	{
		this.point = point;
	}
	public String getPg_code()
	{
		return pg_code;
	}
	public void setPg_code(String pg_code)
	{
		this.pg_code = pg_code;
	}
	
	
	
}
