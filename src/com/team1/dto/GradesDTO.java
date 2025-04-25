package com.team1.dto;

public class GradesDTO
{
	// 주요 속성 구성 
	// 공통 -- 변경일
	private String changed_date;
	
	// 등급 -- 등급 코드, 이름, 등급 이미지 사진 경로, 변경일
	private String grade_id, name, file_path;
	
	// 최소시간, 최대시간, 일일 최대 근무 시간
	private int min_range, max_range, daily_max_time;
	
	// 등급별 시급배수
	private double grade_pay;
	
	// 긴급돌봄 시급 -- 긴급돌봄 시급 코드, 긴급돌봄 시급, 변경일
	private String emg_min_wage_id;
	private int emg_min_wage;
	
	// 일반돌봄 시급 -- 일반돌봄 시급 코드, 일반돌봄 시급, 변경일
	private String gen_min_wage_id;
	private int gen_min_wage;
	
	// getter / setter 구성
	public String getChanged_date()
	{
		return changed_date;
	}
	public void setChanged_date(String changed_date)
	{
		this.changed_date = changed_date;
	}
	public String getGrade_id()
	{
		return grade_id;
	}
	public void setGrade_id(String grade_id)
	{
		this.grade_id = grade_id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getFile_path()
	{
		return file_path;
	}
	public void setFile_path(String file_path)
	{
		this.file_path = file_path;
	}
	public int getMin_range()
	{
		return min_range;
	}
	public void setMin_range(int min_range)
	{
		this.min_range = min_range;
	}
	public int getMax_range()
	{
		return max_range;
	}
	public void setMax_range(int max_range)
	{
		this.max_range = max_range;
	}
	public int getDaily_max_time()
	{
		return daily_max_time;
	}
	public void setDaily_max_time(int daily_max_time)
	{
		this.daily_max_time = daily_max_time;
	}
	public String getEmg_min_wage_id()
	{
		return emg_min_wage_id;
	}
	public void setEmg_min_wage_id(String emg_min_wage_id)
	{
		this.emg_min_wage_id = emg_min_wage_id;
	}
	public int getEmg_min_wage()
	{
		return emg_min_wage;
	}
	public void setEmg_min_wage(int emg_min_wage)
	{
		this.emg_min_wage = emg_min_wage;
	}
	public String getGen_min_wage_id()
	{
		return gen_min_wage_id;
	}
	public void setGen_min_wage_id(String gen_min_wage_id)
	{
		this.gen_min_wage_id = gen_min_wage_id;
	}
	public int getGen_min_wage()
	{
		return gen_min_wage;
	}
	public void setGen_min_wage(int gen_min_wage)
	{
		this.gen_min_wage = gen_min_wage;
	}
	public double getGrade_pay()
	{
		return grade_pay;
	}
	public void setGrade_pay(double grade_pay)
	{
		this.grade_pay = grade_pay;
	}
	
	
	
}
