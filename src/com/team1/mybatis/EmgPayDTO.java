/*============================================
	EmgPayDTO.java
	- 긴급 돌봄 결제 데이터 자료형 클래스
	  (긴급 돌봄 결제, 포인트 차감)
============================================*/

package com.team1.mybatis;

public class EmgPayDTO
{
	// 주요 속성 구성
	String emg_pay_rec_id;						// 긴급 돌봄 결제 코드
	String emg_req_id;							// 긴급 돌봄 요청 등록 코드
	String pg_code;								// 전자 결제 코드
	String par_read_date;						// 부모가 읽은 날짜
	
	String payed_date, used_date;				// 결제 일시, 포인트 차감 일자
	int amount, point_amount;					// 결제 금액, 포인트 차감액
	
	String emg_point_used_id;					// 포인트 차감 코드
	String point_subject;						// 포인트 차감 대상자
	
	
	// getter / setter 구성
	public String getEmg_pay_rec_id()
	{
		return emg_pay_rec_id;
	}
	public void setEmg_pay_rec_id(String emg_pay_rec_id)
	{
		this.emg_pay_rec_id = emg_pay_rec_id;
	}
	public String getEmg_req_id()
	{
		return emg_req_id;
	}
	public void setEmg_req_id(String emg_req_id)
	{
		this.emg_req_id = emg_req_id;
	}
	public String getPg_code()
	{
		return pg_code;
	}
	public void setPg_code(String pg_code)
	{
		this.pg_code = pg_code;
	}
	public String getPar_read_date()
	{
		return par_read_date;
	}
	public void setPar_read_date(String par_read_date)
	{
		this.par_read_date = par_read_date;
	}
	public String getPayed_date()
	{
		return payed_date;
	}
	public void setPayed_date(String payed_date)
	{
		this.payed_date = payed_date;
	}
	public String getUsed_date()
	{
		return used_date;
	}
	public void setUsed_date(String used_date)
	{
		this.used_date = used_date;
	}
	public int getAmount()
	{
		return amount;
	}
	public void setAmount(int amount)
	{
		this.amount = amount;
	}
	public int getPoint_amount()
	{
		return point_amount;
	}
	public void setPoint_amount(int point_amount)
	{
		this.point_amount = point_amount;
	}
	public String getEmg_point_used_id()
	{
		return emg_point_used_id;
	}
	public void setEmg_point_used_id(String emg_point_used_id)
	{
		this.emg_point_used_id = emg_point_used_id;
	}
	public String getPoint_subject()
	{
		return point_subject;
	}
	public void setPoint_subject(String point_subject)
	{
		this.point_subject = point_subject;
	}
	
	
}
