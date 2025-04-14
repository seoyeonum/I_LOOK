/*=================================================
	EmgPointUsedDTO.java
	- 긴급 돌봄 포인트 적립 데이터 자료형 클래스
	  (포인트 적립)
=================================================*/

package com.team1.dto;

public class EmgPointDTO
{
	// 주요 속성 구성
	private String emg_point_id, emg_confirmed_id;		// 긴급 돌봄 포인트 적립 코드, 긴급 돌봄 예약 확정 코드
	private String point_subject;						// 포인트 대상자
	
	private int point, used_time;						// 포인트 적립액, 이용 시간
	
	private String saved_date, par_read_date;			// 포인트 적립일, 부모가 읽은 날짜

	// 속성 추가
	private String emg_req_id, par_name;				// 긴급 돌봄 예약 요청 코드, 부모 이름


	// getter / setter 구성
	public String getEmg_point_id() {
		return emg_point_id;
	}

	public void setEmg_point_id(String emg_point_id) {
		this.emg_point_id = emg_point_id;
	}

	public String getEmg_confirmed_id() {
		return emg_confirmed_id;
	}

	public void setEmg_confirmed_id(String emg_confirmed_id) {
		this.emg_confirmed_id = emg_confirmed_id;
	}

	public String getPoint_subject() {
		return point_subject;
	}

	public void setPoint_subject(String point_subject) {
		this.point_subject = point_subject;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getUsed_time() {
		return used_time;
	}

	public void setUsed_time(int used_time) {
		this.used_time = used_time;
	}

	public String getSaved_date() {
		return saved_date;
	}

	public void setSaved_date(String saved_date) {
		this.saved_date = saved_date;
	}

	public String getPar_read_date() {
		return par_read_date;
	}

	public void setPar_read_date(String par_read_date) {
		this.par_read_date = par_read_date;
	}

	public String getEmg_req_id() {
		return emg_req_id;
	}

	public void setEmg_req_id(String emg_req_id) {
		this.emg_req_id = emg_req_id;
	}

	public String getPar_name() {
		return par_name;
	}

	public void setPar_name(String par_name) {
		this.par_name = par_name;
	}
	
}
