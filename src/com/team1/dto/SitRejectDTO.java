/*========================
    SitRejectDTO.java
    시터 승인 거절 데이터 자료형 클래스
    - 시터 승인 거절 코드
    - 시터 백업 코드
    - 시터 등록 코드
    - 거절 사유 코드
    - 거절 사유
    - 등록 일자
    - 거절 일자
========================*/

package com.team1.dto;

public class SitRejectDTO
{
    // 주요 속성 구성
    private String sit_rejected_id;       // 시터 승인 거절 코드
    private String sit_backup_id;         // 시터 백업 코드
    private String sit_reg_id;            // 시터 등록 코드
    private String sit_rejected_reason_id;// 거절 사유 코드
    private String reason;                // 거절 사유
    private String reg_date;              // 등록 일자
    private String rejected_date;         // 거절 일자
    private String name;                  // 시터 이름
    private String tel;                   // 시터 연락처

	// getter / setter 구성
    public String getSit_rejected_id()
    {
        return sit_rejected_id;
    }

    public void setSit_rejected_id(String sit_rejected_id)
    {
        this.sit_rejected_id = sit_rejected_id;
    }

    public String getSit_backup_id()
    {
        return sit_backup_id;
    }

    public void setSit_backup_id(String sit_backup_id)
    {
        this.sit_backup_id = sit_backup_id;
    }

    public String getSit_reg_id()
    {
        return sit_reg_id;
    }

    public void setSit_reg_id(String sit_reg_id)
    {
        this.sit_reg_id = sit_reg_id;
    }

    public String getSit_rejected_reason_id()
    {
        return sit_rejected_reason_id;
    }

    public void setSit_rejected_reason_id(String sit_rejected_reason_id)
    {
        this.sit_rejected_reason_id = sit_rejected_reason_id;
    }

    public String getReason()
    {
        return reason;
    }

    public void setReason(String reason)
    {
        this.reason = reason;
    }

    public String getReg_date()
    {
        return reg_date;
    }

    public void setReg_date(String reg_date)
    {
        this.reg_date = reg_date;
    }

    public String getRejected_date()
    {
        return rejected_date;
    }

    public void setRejected_date(String rejected_date)
    {
        this.rejected_date = rejected_date;
    }
    public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}
    
}
