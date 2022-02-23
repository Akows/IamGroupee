package com.kh.iag.sal.entity;

import lombok.Data;

@Data
public class SalaryDTO 
{
	private String salary_num;
	private String user_no;
	private String salary_date;
	private String base_pay;
	private String bonus_pay;
	private String overwork_pay;
	private String pension_deduct;
	private String insur_deduct;
	private String tax_deduct;
	private String total_pay;
}
