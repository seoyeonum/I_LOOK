package com.team1.dto;

import java.util.List;

// 일반 돌봄 근무 등록 데이터 자료형 클래스

public class GenRegDTO
{
	// GEN_REG_ID, SIT_BACKUP_ID, TITLE, START_DATE, END_DATE
	// START_TIME, END_TIME
	// REG_DATE, INTRODUCTION
	
	// 주요 속성 구성 	
	// 근무 등록 코드, 시터 백업 코드, 제목 
	private String gen_reg_id, sit_backup_id, title;
	// 근무 시작 가능 날짜, 근무 종료 가능 날짜, 근무 등록 날짜, 자기소개
	private String start_date, end_date, reg_date, introduction;
	// 근무 시작 가능 시간, 근무 
	private int start_time, end_time;
	
	// 속성 추가
	private String name, gender, age, grade;			//-- 시터 이름, 성별, 연령대, 시터 등급
	private String photo_file_path, grade_file_path;	//-- 시터 사진 저장경로, 등급 이미지 저장경로 
	private double avg_rating, recent_avg_rating;		//-- 전체 평점, 최근 전체 평점
	private int review_count, recent_review_count;		//-- 전체 리뷰 건수, 최근 리뷰 건수
	private String status, region;						//-- 예약 상태, 선호 지역
	private List<String> certList;						//-- 시터의 보유 자격증 리스트
	private List<String> regionList;					//-- 시터의 선호 근무 지역 리스트
	
    private int start;									//-- 시작 페이지
    private int end;									//-- 끝 페이지
	
	// getter / setter 구성
	public String getGen_reg_id()
	{
		return gen_reg_id;
	}
	public void setGen_reg_id(String gen_reg_id)
	{
		this.gen_reg_id = gen_reg_id;
	}
	public String getSit_backup_id()
	{
		return sit_backup_id;
	}
	public void setSit_backup_id(String sit_backup_id)
	{
		this.sit_backup_id = sit_backup_id;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
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
	public String getReg_date()
	{
		return reg_date;
	}
	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
	}
	public String getIntroduction()
	{
		return introduction;
	}
	public void setIntroduction(String introduction)
	{
		this.introduction = introduction;
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
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getPhoto_file_path() {
		return photo_file_path;
	}
	public void setPhoto_file_path(String photo_file_path) {
		this.photo_file_path = photo_file_path;
	}
	public String getGrade_file_path() {
		return grade_file_path;
	}
	public void setGrade_file_path(String grade_file_path) {
		this.grade_file_path = grade_file_path;
	}
	public double getAvg_rating() {
		return avg_rating;
	}
	public void setAvg_rating(double avg_rating) {
		this.avg_rating = avg_rating;
	}
	public double getRecent_avg_rating() {
		return recent_avg_rating;
	}
	public void setRecent_avg_rating(double recent_avg_rating) {
		this.recent_avg_rating = recent_avg_rating;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public int getRecent_review_count() {
		return recent_review_count;
	}
	public void setRecent_review_count(int recent_review_count) {
		this.recent_review_count = recent_review_count;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public List<String> getCertList() {
		return certList;
	}
	public void setCertList(List<String> certList) {
		this.certList = certList;
	}
	public List<String> getRegionList() {
		return regionList;
	}
	public void setRegionList(List<String> regionList) {
		this.regionList = regionList;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	
}
