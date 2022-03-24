package com.kh.iag.leave.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.iag.leave.entity.LeaveDto;
import com.kh.iag.leave.entity.LvInfoDto;
import com.kh.iag.leave.entity.PageVo;
import com.kh.iag.leave.service.LeaveService;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("admin/leave")
public class AdminLeaveController {
	
	@Autowired
	private LeaveService service;	
	
//============================= 관리자 메뉴 =============================	
	@GetMapping(value = {"/main/{page}", "allUserList"})
	public String mainGet(Model model, @PathVariable(required = false) String page) throws Exception {
		List<UserDto> allUserList = new ArrayList<UserDto>();
		if (page == null) {
			return "redirect:main/1";
		}
		//페이지vo생성 int currentPage, int cntPerPage, int pageBtnCnt, int totalRow
		int cntPerPage = 10; // 한 페이지 당 10개씩 보여주기
		int pageBtnCnt = 3; // 한 번에 보여줄 버튼 개수
		int totalRow = service.getRowCntAD(); // 디비에 있는 모든 데이터개수
		
		PageVo pageVo = new PageVo(page, cntPerPage, pageBtnCnt, totalRow);// 모든 사원의 정보 불러오기
		allUserList = service.getAllUserAD(pageVo);
		// 총연차개수 사용 개수 set해주기
		for (UserDto userDto : allUserList) {
			int alvTotalCount = userDto.getAlvCount() + userDto.getMlvCount() + userDto.getAlvAddCount();
			userDto.setAlvTotalCount(alvTotalCount);
			String userNo = userDto.getUserNo();
			float alvUsedCount = service.getAlvUsedCount(userNo);
			service.updateAlvUsedCount(userNo, alvUsedCount);
		}
		model.addAttribute("allUserList", allUserList);
		model.addAttribute("page", pageVo);
		return "leave/lvAdmin/adminLeaveMain";
	}
	
	@PostMapping("main") // 관리 메인 +  조정연차를 부여해줄 사원 찾기
	public String main(String searchByUserNo, Model model, String dept, @PathVariable(required = false) String page) throws Exception {		
		List<UserDto> allUserList = new ArrayList<UserDto>();
		if (dept != null && !dept.equals("--부서별--")) {
			// 해당부서의 사원정보 불러오기
			allUserList = service.getThisDeptUserAD(dept);
			// 총연차개수 set해주기
			for (UserDto userDto : allUserList) {
				int alvTotalCount = userDto.getAlvCount() + userDto.getAlvAddCount() + userDto.getMlvCount();
				userDto.setAlvTotalCount(alvTotalCount);
			}
		} else if (searchByUserNo != null && dept.equals("--부서별--")) {
			// 해당 사원의 정보 불러오기
			allUserList = service.getThisUserAD(searchByUserNo);
			System.out.println(allUserList.toString());
			// 총연차개수 set해주기
			for (UserDto userDto : allUserList) {
				int alvTotalCount = userDto.getAlvCount() + userDto.getAlvAddCount() + userDto.getMlvCount();
				userDto.setAlvTotalCount(alvTotalCount);
			}
		} else {
			return "redirect:main/1";
		}
		// 현재날짜
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar today = Calendar.getInstance(); 
		String todayDate = format.format(today.getTime());
		model.addAttribute("todayDate", todayDate);
		model.addAttribute("allUserList", allUserList);
		return "leave/lvAdmin/adminLeaveMain";
	}	
	
	@PostMapping("alvAddUpdate") // 조정연차 부여
	public String alvAddUpdate(String alvAddCount, String userNo, String alvOccurReason) throws Exception {
		
		
		// iag_user addAlvCount에 update +=
		int iagResult = service.iagAddAlvCount(alvAddCount,userNo);
		// alv_occur_history에 insert
		int historyResult = service.alvOccurHistory(alvAddCount, userNo, alvOccurReason);
		
		
		return "leave/lvAdmin/adminLeaveMain";
	}
	
	@GetMapping("lvModiAD") // 휴가 발생 관리
	public String lvModiAD(HttpServletRequest request) throws Exception {
		List<LeaveDto> lvTypeList = service.getLvTypeList();
		request.setAttribute("lvTypeList", lvTypeList);
		return "leave/lvAdmin/lvModiAD";
	}
	
	@PostMapping("lvAddAD") // 휴가 추가
	public String lvAddAD(HttpServletRequest request, LeaveDto leaveDto, RedirectAttributes attributes) throws Exception {
		// 입력한 휴가 코드가 존재하는 지 확인
		LeaveDto checkExist = service.checkExist(leaveDto);
		if (checkExist != null) {
			attributes.addFlashAttribute("checkExist", checkExist.getLvCode());
			return "redirect:/admin/leave/lvModiAD";
		}else {
			int result = service.addLvType(leaveDto);
			if (result > 0) {
				return "redirect:/admin/leave/lvModiAD";
			} return "redirect:/admin/leave/lvModiAD";
		}
	}
	
	@PostMapping("lvDelAD") // 휴가 삭제
	public String lvDelAD(HttpServletRequest request, String result) throws Exception {
		String[] delArr = result.split(",");
		for (String lvCode : delArr) {
			service.delLvType(lvCode);
		}
		return "redirect:/leave/lvAdmin/lvModiAD";
	}
	
	@GetMapping("lvInfoWriteAD") // 휴무 정보 게시글 작성 페이지
	public String lvInfoWriteAD() {
		return "leave/lvAdmin/lvInfoWriteAD";
	}
	
	@PostMapping("lvbEnroll") // 작성한 글 디비에 저장
	public String lvbEnroll(@RequestParam String lvbTitle, String lvbContent) throws Exception {
		LvInfoDto lvInfoDto = new LvInfoDto();
		lvInfoDto.setLvbTitle(lvbTitle);
		lvInfoDto.setLvbContent(lvbContent.replaceAll("\n", "").replaceAll("\t", "").replaceAll("\r", "").replaceAll("'", "&apos;"));
		// 글 등록하기
		int result = service.lvbEnroll(lvInfoDto);
		// 등록한 게시글의 번호 알아오기
		int thisLvbNo = service.getThisLvbNo(lvbTitle);
		
		return "redirect:/leave/lvInfoDetail/" + String.valueOf(thisLvbNo);
	}
	
	@PostMapping("lvbModify") // 작성한 글 수정하러가기
	public String lvbModify(@RequestParam String lvbTitle, HttpServletRequest request) throws Exception {
		// 수정하려는 글의 데이터가져오기
		request.setAttribute("thisLvbData", service.getThisLvbData(lvbTitle));
		request.setAttribute("modify", "true");

		return "leave/lvAdmin/lvInfoWriteAD";
	}
	
	@PostMapping("lvbUpdate") // 수정한 글 디비에 저장
	public String lvbUpdate(LvInfoDto lvInfoDto) throws Exception {
		String title = lvInfoDto.getLvbTitle();
		lvInfoDto.setLvbContent(lvInfoDto.getLvbContent().replaceAll("\n", "").replaceAll("\t", "").replaceAll("\r", "").replaceAll("'", "&apos;"));
		// 수정한 글 등록하기
		int result = service.lvbUpdate(lvInfoDto);
		// 등록한 게시글의 번호 알아오기
		int thisLvbNo = service.getThisLvbNo(title);
		
		return "redirect:/leave/lvInfoDetail/" + String.valueOf(thisLvbNo);
	}

	@PostMapping("lvbDelete") // 글 삭제
	public String lvbDelete(LvInfoDto lvInfoDto) throws Exception {
		
		int result = service.lvbDelete(lvInfoDto);
		
		return "redirect:/leave/lvInfo";
	}
	
	@GetMapping("alvUrgeAD") // 연차 사용 촉구서 관리
	public String alvUrgeAD() {
		return "leave/lvAdmin/alvUrgeAD";
	}
	
}
