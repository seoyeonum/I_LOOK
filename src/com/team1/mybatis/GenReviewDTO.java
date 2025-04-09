package com.team1.mybatis;
// 일반 돌봄 리뷰 데이터 자료형 클래스 (리뷰, 객관식 응답, 응답 종류)

public class GenReviewDTO
{
	// 일반 돌봄 리뷰
	private String gen_review_id, gen_confirmed_id, rating, reviewd_date, point_subject, par_read_date;
	private int point_amount, used_time;
	
	// 일반 돌봄 객관식 응답
	private String gen_multiple_review_id;
	
	// 돌봄 객관식 응답 종류
	private String gen_multiple_type_id, type;

	// getter / setter 구성
	public String getGen_review_id()
	{
		return gen_review_id;
	}

	public void setGen_review_id(String gen_review_id)
	{
		this.gen_review_id = gen_review_id;
	}

	public String getGen_confirmed_id()
	{
		return gen_confirmed_id;
	}

	public void setGen_confirmed_id(String gen_confirmed_id)
	{
		this.gen_confirmed_id = gen_confirmed_id;
	}

	public String getRating()
	{
		return rating;
	}

	public void setRating(String rating)
	{
		this.rating = rating;
	}

	public String getReviewd_date()
	{
		return reviewd_date;
	}

	public void setReviewd_date(String reviewd_date)
	{
		this.reviewd_date = reviewd_date;
	}

	public String getPoint_subject()
	{
		return point_subject;
	}

	public void setPoint_subject(String point_subject)
	{
		this.point_subject = point_subject;
	}

	public String getPar_read_date()
	{
		return par_read_date;
	}

	public void setPar_read_date(String par_read_date)
	{
		this.par_read_date = par_read_date;
	}

	public int getPoint_amount()
	{
		return point_amount;
	}

	public void setPoint_amount(int point_amount)
	{
		this.point_amount = point_amount;
	}

	public int getUsed_time()
	{
		return used_time;
	}

	public void setUsed_time(int used_time)
	{
		this.used_time = used_time;
	}

	public String getGen_multiple_review_id()
	{
		return gen_multiple_review_id;
	}

	public void setGen_multiple_review_id(String gen_multiple_review_id)
	{
		this.gen_multiple_review_id = gen_multiple_review_id;
	}

	public String getGen_multiple_type_id()
	{
		return gen_multiple_type_id;
	}

	public void setGen_multiple_type_id(String gen_multiple_type_id)
	{
		this.gen_multiple_type_id = gen_multiple_type_id;
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
