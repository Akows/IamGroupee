package com.kh.iag.sal.entity;

import lombok.Data;

@Data
public class SalaryDTO 
{
	private String salarynumber;
	private String salarydate;
	private String wages;
	private String bonuswages;
	private String deduction;
	private String bonusreason;
	private String dedureason;
	private String workday;
}
