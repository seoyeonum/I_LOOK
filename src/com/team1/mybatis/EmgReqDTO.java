/*==================================================
	EmgReqDTO.java
	- 긴급 돌봄 요청 등록 데이터 자료형 클래스
	  (긴급 돌봄 등록 요청, 긴급 돌봄 요청 삭제)
==================================================*/

package com.team1.mybatis;

public class EmgReqDTO
{
	// 주요 속성 구성
	String emg_req_id, child_backup_id;				// 긴급 돌봄 요청 등록 코드, 아이 백업 코드
	String start_date, end_date;					// 긴급 돌봄 시작일, 긴급 돌봄 종료일

	int start_time, end_time;						// 긴급 돌봄 이용 시작 시간, 긴급 돌봄 이용 종료 시간
	
	String par_message;								// 긴급 돌봄 요청 등록 시 부모 전달 메시지
	String req_date;								// 긴급 돌봄 요청 등록 일자
	
	String emg_delete_id;							// 긴급 돌봄 요청 삭제 코드
	String emg_delete_date, par_read_date;			// 긴급 돌봄 요청 삭제 날짜, 부모가 삭제에 대해 읽은 날짜
	
	// getter / setter 구성
	public String getEmg_req_id()
	{
		return emg_req_id;
	}
	public void setEmg_req_id(String emg_req_id)
	{
		this.emg_req_id = emg_req_id;
	}
	public String getChild_backup_id()
	{
		return child_backup_id;
	}
	public void setChild_backup_id(String child_backup_id)
	{
		this.child_backup_id = child_backup_id;
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
	public String getPar_message()
	{
		return par_message;
	}
	public void setPar_message(String par_message)
	{
		this.par_message = par_message;
	}
	public String getReq_date()
	{
		return req_date;
	}
	public void setReq_date(String req_date)
	{
		this.req_date = req_date;
	}
	public String getEmg_delete_id()
	{
		return emg_delete_id;
	}
	public void setEmg_delete_id(String emg_delete_id)
	{
		this.emg_delete_id = emg_delete_id;
	}
	public String getEmg_delete_date()
	{
		return emg_delete_date;
	}
	public void setEmg_delete_date(String emg_delete_date)
	{
		this.emg_delete_date = emg_delete_date;
	}
	public String getPar_read_date()
	{
		return par_read_date;
	}
	public void setPar_read_date(String par_read_date)
	{
		this.par_read_date = par_read_date;
	}
}
