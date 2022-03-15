package com.kh.iag.prj.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class PrjDto {

	private int prjNo;
	private String userNo;
	private String prjName;
	private int departNo;
	private Date createDate;
	private String startDate;
	private String endDate;
	private String openYn;
	private String activateYn;
	private String deleteYn;
	
	private String period;
	private int process; 
	private String departmentName;
	private String name;
	private String commName;
	
	
	public void calc(String startDate, String endDate) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String today = format.format(date);
		
		// 두 날짜를 parse()를 통해 Date형으로 변환.
		try {
			Date start = format.parse(this.getStartDate());
			Date end = format.parse(this.getEndDate());
			Date todate = format.parse(today);
			
			// Date로 변환된 두 날짜를 계산한 뒤, long type 으로 return.
			long totalCalDate = start.getTime() - end.getTime(); 
			long pastCalDate = start.getTime() - todate.getTime(); 
			
			// Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다. 
			// 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
			long calDateDays1 = totalCalDate / ( 24*60*60*1000); 
			long calDateDays2 = pastCalDate / ( 24*60*60*1000); 
			
			calDateDays1 = Math.abs(calDateDays1);//절대값으로 출력
			calDateDays2 = Math.abs(calDateDays2);//절대값으로 출력
			
			this.setProcess((int) ((100 / calDateDays1) * calDateDays2));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		

	}


}
