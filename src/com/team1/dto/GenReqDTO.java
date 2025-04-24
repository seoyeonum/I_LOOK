package com.team1.dto;

// 일반 돌봄 신청 데이터 자료형 클래스 (신청**, 삭제**)
public class GenReqDTO
{
	// 기본 예약 정보
	private String gen_req_id, gen_reg_id, child_backup_id, message;
	private String start_date, end_date;
	private int start_time, end_time;
	private String req_date, sit_read_date;
	private String child_name;
	private String sitter_name;
	private String sitter_level;
	private String total_hours;
	private String status;
	private String par_name;
	private String pay_status;
	private String par_backup_id;

	// 결제 관련
	private String gen_pay_rec_id, gen_point_used_id;
	private String pg_code;
	private int pay_amount, point;

	// ✅ 뷰(V_PAR_CARE)에서 사용하는 필드 추가
	private String care_status; // 돌봄 상태 (예: 돌봄 중, 돌봄 완료 등)
	private String care_type; // 돌봄 유형 (예: 일반돌봄, 긴급돌봄)
	private int work_hours; // 근무 시간 (시간 단위)

	// ---------- Getter / Setter ----------
	public String getGen_req_id()
	{
		return gen_req_id;
	}

	public void setGen_req_id(String gen_req_id)
	{
		this.gen_req_id = gen_req_id;
	}

	public String getGen_reg_id()
	{
		return gen_reg_id;
	}

	public void setGen_reg_id(String gen_reg_id)
	{
		this.gen_reg_id = gen_reg_id;
	}

	public String getChild_backup_id()
	{
		return child_backup_id;
	}

	public void setChild_backup_id(String child_backup_id)
	{
		this.child_backup_id = child_backup_id;
	}

	public String getMessage()
	{
		return message;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}

	public String getStart_date()
	{
		return start_date;
	}

	public void setStart_date(String start_date)
	{
		this.start_date = start_date;
	}

	public String getEnd_date()
	{
		return end_date;
	}

	public void setEnd_date(String end_date)
	{
		this.end_date = end_date;
	}

	public int getStart_time()
	{
		return start_time;
	}

	public void setStart_time(int start_time)
	{
		this.start_time = start_time;
	}

	public int getEnd_time()
	{
		return end_time;
	}

	public void setEnd_time(int end_time)
	{
		this.end_time = end_time;
	}

	public String getReq_date()
	{
		return req_date;
	}

	public void setReq_date(String req_date)
	{
		this.req_date = req_date;
	}

	public String getSit_read_date()
	{
		return sit_read_date;
	}

	public void setSit_read_date(String sit_read_date)
	{
		this.sit_read_date = sit_read_date;
	}

	public String getChild_name()
	{
		return child_name;
	}

	public void setChild_name(String child_name)
	{
		this.child_name = child_name;
	}

	public String getSitter_name()
	{
		return sitter_name;
	}

	public void setSitter_name(String sitter_name)
	{
		this.sitter_name = sitter_name;
	}

	public String getSitter_level()
	{
		return sitter_level;
	}

	public void setSitter_level(String sitter_level)
	{
		this.sitter_level = sitter_level;
	}

	public String getTotal_hours()
	{
		return total_hours;
	}

	public void setTotal_hours(String total_hours)
	{
		this.total_hours = total_hours;
	}

	public String getStatus()
	{
		return status;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}

	public String getPar_name()
	{
		return par_name;
	}

	public void setPar_name(String par_name)
	{
		this.par_name = par_name;
	}

	public String getPay_status()
	{
		return pay_status;
	}

	public void setPay_status(String pay_status)
	{
		this.pay_status = pay_status;
	}

	public String getGen_pay_rec_id()
	{
		return gen_pay_rec_id;
	}

	public void setGen_pay_rec_id(String gen_pay_rec_id)
	{
		this.gen_pay_rec_id = gen_pay_rec_id;
	}

	public String getGen_point_used_id()
	{
		return gen_point_used_id;
	}

	public void setGen_point_used_id(String gen_point_used_id)
	{
		this.gen_point_used_id = gen_point_used_id;
	}

	public String getPg_code()
	{
		return pg_code;
	}

	public void setPg_code(String pg_code)
	{
		this.pg_code = pg_code;
	}

	public int getPay_amount()
	{
		return pay_amount;
	}

	public void setPay_amount(int pay_amount)
	{
		this.pay_amount = pay_amount;
	}

	public int getPoint()
	{
		return point;
	}

	public void setPoint(int point)
	{
		this.point = point;
	}

	// ✅ 추가된 필드의 Getter / Setter
	public String getCare_status()
	{
		return care_status;
	}

	public void setCare_status(String care_status)
	{
		this.care_status = care_status;
	}

	public String getCare_type()
	{
		return care_type;
	}

	public void setCare_type(String care_type)
	{
		this.care_type = care_type;
	}

	public int getWork_hours()
	{
		return work_hours;
	}

	public void setWork_hours(int work_hours)
	{
		this.work_hours = work_hours;
	}

	public String getPar_backup_id()
	{
		return par_backup_id;
	}

	public void setPar_backup_id(String par_backup_id)
	{
		this.par_backup_id = par_backup_id;
	}
	
	
	
	
}
