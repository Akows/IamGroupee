package com.kh.iag.main.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iag.board.entity.FreeBoardDto;
import com.kh.iag.board.entity.NoticeBoardDto;
import com.kh.iag.board.service.BoardService;
import com.kh.iag.ea.entity.DocsDto;
import com.kh.iag.ea.service.EAService;
import com.kh.iag.leave.entity.LvUsedListDto;
import com.kh.iag.leave.service.LeaveService;
import com.kh.iag.login.service.LoginService;
import com.kh.iag.login.vo.CheckedVo;
import com.kh.iag.resv.entity.ResvDto;
import com.kh.iag.resv.service.ResvService;
import com.kh.iag.sch.entity.SchDto;
import com.kh.iag.sch.service.ScheduleService;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
	
	@Autowired
	private LoginService service;
	@Autowired
	private LeaveService leaveService;
	@Autowired
	private ResvService resvService;
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private EAService eaService;
	
	// 로그인 화면
	@GetMapping("login")
	public String login() {
		return "login";
	}
	// 로그인 처리
	@PostMapping("login")
	public String login(UserDto dto, HttpSession session, HttpServletResponse response, HttpServletRequest request, CheckedVo checkedVo, Model model) throws Exception {

			// 세션에 담기 전에 세션 초기화
			if ( session.getAttribute("loginUser") != null ){
				session.removeAttribute("loginUser"); 
			}
			// 로그인 로직
			UserDto loginUser = service.login(dto);
			
			if (loginUser != null) {
				//세션에 담기
				session.setAttribute("loginUser",loginUser);

				String[] checkedValues = checkedVo.getChecked();
				if(checkedValues != null) {
					String checkedValue = "";
					
					for(String cv : checkedValues) {
						checkedValue += cv;
						if(checkedValue.equals("numlogin") || checkedValue.equals("loginnum")) {
							// 자동 로그인 쿠키 생성
							Cookie savedLoginCookie = new Cookie("savedLoginCookie", session.getId());
							savedLoginCookie.setPath("/");
							
							LocalTime now = LocalTime.now();
							int hour = now.getHour();
							int minute = now.getMinute();
							int second = now.getSecond();
							int savedTime = 60 * 60 * 24;
							savedLoginCookie.setMaxAge(savedTime);
							
							Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * savedTime));
							
							// loginUser 디비에 sessionKey랑 sessionLimit시간 update하기
							int ssResult = service.savedLoginCookie(loginUser.getUserNo(), session.getId(), sessionLimit);
							
							// 화면에 보낸다.
							response.addCookie(savedLoginCookie);
							
							// 보름 간 아이디 저장 쿠키 생성
							Cookie rememIdCookie = new Cookie("rememIdCookie", String.valueOf(loginUser.getUserNo()));
							rememIdCookie.setPath("/");
							rememIdCookie.setMaxAge(60 * 60 * 24 * 15);
							
							response.addCookie(rememIdCookie);
							
						} else if (checkedValue.equals("num")) {
							// 보름 간 아이디 저장 쿠키 생성
							Cookie rememIdCookie = new Cookie("rememIdCookie", String.valueOf(loginUser.getUserNo()));
							rememIdCookie.setPath("/");
							rememIdCookie.setMaxAge(60 * 60 * 24 * 15);
							
							response.addCookie(rememIdCookie);
							
						} else if (checkedValue.equals("login")) {
							// 현재 rememIdCookie가 있다면 지우기
							Cookie[] cookies = request.getCookies();
							
							for(int i = 0; i<cookies.length; i++){
								String name = cookies[i].getName();
								String value = cookies[i].getValue();
								if(name.equals("rememIdCookie")){
									cookies[i].setPath("/");
									cookies[i].setMaxAge(0);
									response.addCookie(cookies[i]);
								}
							}
							// 자동 로그인 쿠키 생성
							Cookie savedLoginCookie = new Cookie("savedLoginCookie", session.getId());
							savedLoginCookie.setPath("/");
							
							LocalTime now = LocalTime.now();
							int hour = now.getHour();
							int minute = now.getMinute();
							int second = now.getSecond();
							int savedTime = 60 * 60 * 24;
							savedLoginCookie.setMaxAge(savedTime);
							
							Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * savedTime));
							
							// loginUser 디비에 sessionKey랑 sessionLimit시간 update하기
							int ssResult = service.savedLoginCookie(loginUser.getUserNo(), session.getId(), sessionLimit);
							
							response.addCookie(savedLoginCookie); // 화면에 보낸다.
						}
					}
					return "redirect:/main";
				} else {
					Cookie[] cookies = request.getCookies();
					
					for(int i = 0; i<cookies.length; i++){
						String name = cookies[i].getName();
						String value = cookies[i].getValue();
						if(name.equals("rememIdCookie")){
							cookies[i].setPath("/");
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
						}
					}
					return "redirect:/main";
				}
			} 
				//실패
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script language='javascript'>");
			out.println("alert('로그인에 실패하셨습니다.')");
			out.println("</script>");

			out.flush();
			return "login";
		}

	
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 자동로그인 쿠키 삭제
		Cookie[] cookies = request.getCookies();
		
		for(int i = 0; i<cookies.length; i++){
			String name = cookies[i].getName();
			String value = cookies[i].getValue();
			if(name.equals("savedLoginCookie")){
				cookies[i].setPath("/");
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		
		// user db의 sessionLimit을 현재시간으로 다시 변경
		Date date = new Date(System.currentTimeMillis());
		service.savedLoginCookie(loginUser.getUserNo(), session.getId(), date);
		// 세션만료
		session.invalidate();
	
		
		return "redirect:/login";
	}
	
	
	// 메인으로
	@GetMapping("main")
	public String main(HttpSession session, Model model) throws Exception {
//========================================================
//========================전자결재관련========================
//========================================================
		
		UserDto ealoginUser = (UserDto) session.getAttribute("loginUser");
		String eauserNo = ealoginUser.getUserNo();
		
		// 상신한 문서수
		int countOfSignup = eaService.countOfSignup(eauserNo);
		model.addAttribute("countOfSignup", countOfSignup);
		// 대기 문서수(아직 상신만된 상태)
		int countOfWait = eaService.countOfWait(eauserNo);
		model.addAttribute("countOfWait", countOfWait);
		// 진행 문서수(1차결재 이상 진행된 상태)
		int countOfProg = eaService.countOfProg(eauserNo);
		model.addAttribute("countOfProg", countOfProg);
		
		// 결재할 문서수
		int countOfAppr = eaService.countOfAppr(eauserNo);
		model.addAttribute("countOfAppr", countOfAppr);
		// 참조 문서수
		int countOfRefer = eaService.countOfRefer(eauserNo);
		model.addAttribute("countOfRefer", countOfRefer);
		// 전체 문서수
		int countOfEntire = entireCap(session).size();
		model.addAttribute("countOfEntire", countOfEntire);
		
//========================================================
//=========================연차관련=========================
//========================================================
		List<UserDto> allUserList = new ArrayList<UserDto>();
		for (UserDto userDto : allUserList) {
			String userNo = userDto.getUserNo();
			float alvUsedCount = leaveService.getAlvUsedCount(userNo);
			leaveService.updateAlvUsedCount(userNo, alvUsedCount);
		}
		leaveService.updateReduceAlv();
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
		// 로그인한 사용자의 연차사용내역
		List<LvUsedListDto> alvUsedList = leaveService.getAlvListCalen(userNo);
		if (alvUsedList != null) {
			
			for (LvUsedListDto al : alvUsedList) {
				if(al.getLvCode().equals("ALV_01")) {
					al.setReduceAlv(1);
				} else if (al.getLvCode().equals("ALV_02")) {
					al.setReduceAlv((float) 0.5);
				} else if (al.getLvCode().equals("ALV_03")) {
					al.setReduceAlv((float) 0.25);
				}
				String start = String.valueOf(al.getLvStart());
				String end =  String.valueOf(al.getLvEnd());
				al.setDuring(start + " ~ " + end);
			}
			model.addAttribute("alvUsedList", alvUsedList);
		}
		
		// 로그인한 사용자의 휴가사용내역
		List<LvUsedListDto> lvUsedList =  leaveService.getLvListCalen(userNo);
		if (lvUsedList != null) {
			for (LvUsedListDto al : lvUsedList) {
				String start = String.valueOf(al.getLvStart());
				String end =  String.valueOf(al.getLvEnd());
				al.setDuring(start + " ~ " + end);
			}
			model.addAttribute("lvUsedList", lvUsedList);
		}
//========================================================
//=========================예약관련=========================
//========================================================

		List<ResvDto> myRoomResvList = resvService.getMyRoomResvList(userNo);
		List<ResvDto> myAssetResvList = resvService.getMyAssetResvList(userNo);
		if(myRoomResvList != null) {
			model.addAttribute("myRoomResvList", myRoomResvList);
		}
		if(myAssetResvList != null) {
			model.addAttribute("myAssetResvList", myAssetResvList);
		}
//========================================================
//=========================일정관련=========================
//========================================================
		
		// DB에 있는 일정 가져오기
		List<SchDto> personalList = new ArrayList<SchDto>();
		List<SchDto> deptList = new ArrayList<SchDto>();
		List<SchDto> corpList = new ArrayList<SchDto>();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		// 개인일정 
		personalList = scheduleService.getPersonalList(userNo);
		for (SchDto schDto : personalList) {
			String start = format.format(schDto.getSchStart());
			String end = format.format(schDto.getSchEnd());
			schDto.setSchStartStr(start);
			schDto.setSchEndStr(end);
		}
		// 부서일정 
		deptList = scheduleService.getDeptList(userNo);
		for (SchDto schDto : deptList) {
			String start = format.format(schDto.getSchStart());
			String end = format.format(schDto.getSchEnd());
			schDto.setSchStartStr(start);
			schDto.setSchEndStr(end);
		}
		// 전사일정
		corpList = scheduleService.getCorpList(userNo);
		for (SchDto schDto : corpList) {
			String start = format.format(schDto.getSchStart());
			String end = format.format(schDto.getSchEnd());
			schDto.setSchStartStr(start);
			schDto.setSchEndStr(end);
		}

		model.addAttribute("personalList", personalList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("corpList", corpList);
//========================================================
//=========================게시판관련=========================
//========================================================
		List<FreeBoardDto> freeBoardList = boardService.getMainFreeBoardList();
		
		model.addAttribute("freeBoardList", freeBoardList);
		
		List<NoticeBoardDto> noticeBoardList = boardService.getMainNoticeBoardList();
		
		model.addAttribute("noticeBoardList", noticeBoardList);
		
		return "mainPage";
	}
	
	// 관리자 권한이 없을 시
	@GetMapping("wrongRight")
	public String main2() {

		String returnUrl = "common/error/wrongRight";
//		return "common/error/wrongRight";
		return returnUrl;
	}

//============================전자결재데이터로쓰이는메소드=====================================
	public List<DocsDto> entireCap(HttpSession session) throws Exception {
		
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		long positionNo = loginUser.getPositionNo();
		
		// SEC_A, SEC_B 설정정보
		int secA = eaService.selectSecA();
		int secB = eaService.selectSecB();
		
		
		// 로그인한 유저의 기안문서, 결재문서, 참고문서 데이터 (S등급)
		List<DocsDto> relatedDocs = eaService.selectRelatedDocs(userNo);
		
		// 로그인한 유저와 관련없는(기안, 결재, 참고하지 않은) 문서들 (보안등급 필터링 필요)
		List<DocsDto> notRelatedDocs = eaService.selectNotRelatedDocs(userNo);
		
		// 화면으로 보낼 문서 리스트
		List<DocsDto> entireList = new ArrayList<>();
		
		// S등급
		relatedDocs.stream()
				   .forEach(d -> entireList.add(d));
		
		// C등급 문서 처리
		notRelatedDocs.stream()
					  .filter(d -> d.getDocSlv().equals("C"))
					  .forEach(d -> entireList.add(d));
		
		// B등급 문서 처리
		notRelatedDocs.stream()
					  .filter(d -> d.getDocSlv().equals("B") && positionNo <= secB)
					  .forEach(d -> entireList.add(d));
		
		// A등급 문서 처리
		notRelatedDocs.stream()
					  .filter(d -> d.getDocSlv().equals("A") && positionNo <= secA)
					  .forEach(d -> entireList.add(d));
		
		
		return entireList;
	}
//===================================================================================
	
	@GetMapping("findpwd")
	public String findpwd() {
		return "common/findPwd";
	}
	
	@PostMapping(value = "/findpwd", produces = "application/text; charset=utf8")
	public String findpwd(String userNo, Model model) throws Exception {
		UserDto findUser = service.getFindUser(userNo);
		if(findUser != null) {
			String changePwd = service.changePwd(userNo);
			if(changePwd !=null) {
				findUser.setPwd(changePwd);
				service.sendMail(findUser);
				String str = findUser.getEmail() + "<br> 변경된 임시 비밀번호가 전송되었습니다.";
				model.addAttribute("msg", str);
			} else {
				model.addAttribute("msg", "비밀번호 변경에 실패했습니다. 다시 시도해 주세요.");
			}
		} else {
			model.addAttribute("msg", "없는 사원번호입니다. 다시 확인해 주세요.");
		}
		return "common/resultFindPwd";
	}
	
}
