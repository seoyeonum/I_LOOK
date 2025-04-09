package com.team1.mybatis;
// 일반 돌봄 취소 데이터 자료형 클래스 (취소 사유, 취소, 환불)

public class GenCanceledDTO
{
	// 일반 돌봄 예약 확정 후 취소 (부모)
	private String gen_par_confirmed_canceled_id, gen_confirmed_id, canceled_date, par_read_date, sit_read_date;
	
	// 일반 돌봄 예약 확정 후 취소 환불
	private String gen_par_confirmed_refunded_id, amount, refunded_date, point, pg_code;
	
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

	// getter / setter 구성
	public String getGen_par_confirmed_canceled_id()
	{
		return gen_par_confirmed_canceled_id;
	}

	public void setGen_par_confirmed_canceled_id(String gen_par_confirmed_canceled_id)
	{
		this.gen_par_confirmed_canceled_id = gen_par_confirmed_canceled_id;
	}

	public String getGen_confirmed_id()
	{
		return gen_confirmed_id;
	}

	public void setGen_confirmed_id(String gen_confirmed_id)
	{
		this.gen_confirmed_id = gen_confirmed_id;
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

	public String getSit_read_date()
	{
		return sit_read_date;
	}

	public void setSit_read_date(String sit_read_date)
	{
		this.sit_read_date = sit_read_date;
	}

	public String getGen_par_confirmed_refunded_id()
	{
		return gen_par_confirmed_refunded_id;
	}

	public void setGen_par_confirmed_refunded_id(String gen_par_confirmed_refunded_id)
	{
		this.gen_par_confirmed_refunded_id = gen_par_confirmed_refunded_id;
	}

	public String getAmount()
	{
		return amount;
	}

	public void setAmount(String amount)
	{
		this.amount = amount;
	}

	public String getRefunded_date()
	{
		return refunded_date;
	}

	public void setRefunded_date(String refunded_date)
	{
		this.refunded_date = refunded_date;
	}

	public String getPoint()
	{
		return point;
	}

	public void setPoint(String point)
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

	public String getGen_sit_confirmed_canceled_id()
	{
		return gen_sit_confirmed_canceled_id;
	}

	public void setGen_sit_confirmed_canceled_id(String gen_sit_confirmed_canceled_id)
	{
		this.gen_sit_confirmed_canceled_id = gen_sit_confirmed_canceled_id;
	}

	public String getGen_sit_confirmed_refunded_id()
	{
		return gen_sit_confirmed_refunded_id;
	}

	public void setGen_sit_confirmed_refunded_id(String gen_sit_confirmed_refunded_id)
	{
		this.gen_sit_confirmed_refunded_id = gen_sit_confirmed_refunded_id;
	}

	public String getGen_canceled_id()
	{
		return gen_canceled_id;
	}

	public void setGen_canceled_id(String gen_canceled_id)
	{
		this.gen_canceled_id = gen_canceled_id;
	}

	public String getGen_pay_rec_id()
	{
		return gen_pay_rec_id;
	}

	public void setGen_pay_rec_id(String gen_pay_rec_id)
	{
		this.gen_pay_rec_id = gen_pay_rec_id;
	}

	public String getGen_refunded_id()
	{
		return gen_refunded_id;
	}

	public void setGen_refunded_id(String gen_refunded_id)
	{
		this.gen_refunded_id = gen_refunded_id;
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

	
}
