package com.kh.iag.chat.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.iag.chat.entity.ChatDto;
import com.kh.iag.chat.service.ChatService;
import com.kh.iag.ea.entity.DeptDto;
import com.kh.iag.ea.entity.EAUserDto;
import com.kh.iag.ea.service.EAService;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/chat")
public class ChatController {
	
	@Autowired
	private EAService eaService;
	
	@Autowired
	private ChatService service;
	
	
	public List<ChatDto> getChatListById(ChatDto dto) throws Exception {
		List<ChatDto> chatList = service.selectChatListById(dto);
		
		for(ChatDto c : chatList) {
			int chatTime = Integer.parseInt(c.getChatTime().substring(11, 13)) + 9;
			String timeType = "오전";
			if(chatTime >= 12) {
				timeType = "오후";
				chatTime -= 12;
			}
			c.setChatTime(c.getChatTime().substring(0, 11) + " " + timeType + " " + chatTime + ":" + c.getChatTime().substring(14, 16));
		}
		
		return chatList;
	}
	
	public List<ChatDto> getChatListByRecent(ChatDto dto) throws Exception {

		List<ChatDto> chatList = service.selectChatListByRecent(dto);
		
		for(ChatDto c : chatList) {
			int chatTime = Integer.parseInt(c.getChatTime().substring(11, 13)) + 9;
			String timeType = "오전";
			if(chatTime >= 12) {
				timeType = "오후";
				chatTime -= 12;
			}
			c.setChatTime(c.getChatTime().substring(0, 11) + " " + timeType + " " + chatTime + ":" + c.getChatTime().substring(14, 16));
		}
		
		return chatList;
	}
	
	public List<ChatDto> getChatListBox(String userNo) throws Exception {

		List<ChatDto> chatList = service.selectChatListBox(userNo);
		
		for(ChatDto c : chatList) {
			int chatTime = Integer.parseInt(c.getChatTime().substring(11, 13)) + 9;
			String timeType = "오전";
			if(chatTime >= 12) {
				timeType = "오후";
				chatTime -= 12;
			}
			c.setChatTime(c.getChatTime().substring(0, 11) + " " + timeType + " " + chatTime + ":" + c.getChatTime().substring(14, 16));
		}
		
		for(int i = 0; i < chatList.size(); i++) {
			ChatDto x = chatList.get(i);
			for(int j = 0; j < chatList.size(); j++) {
				ChatDto y = chatList.get(j);
				if(x.getFromId().equals(y.getToId()) && x.getToId().equals(y.getFromId())) {
					if(x.getChatId() < y.getChatId()) {
						chatList.remove(x);
						i--;
						break;
					} else {
						chatList.remove(y);
						j--;
					}
				}
			}
		}
		
		return chatList;
	}
	
	public int submit(ChatDto dto) throws Exception {
		int result = service.insertChatContent(dto);
		return result;
	}
	
	public String getTen(ChatDto dto) throws Exception {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		
		List<ChatDto> chatList = getChatListByRecent(dto);
		if(chatList.size() == 0) return "";
		for(int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getFromId() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getToId() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
			if(i != chatList.size() - 1 ) result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatId() + "\"}");
		int readResult = service.readChat(dto);
		return result.toString();
	}

	public String getId(ChatDto dto) throws Exception {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		
		List<ChatDto> chatList = getChatListById(dto);
		if(chatList.size() == 0) return "";
		for(int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getFromId() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getToId() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
			if(i != chatList.size() - 1 ) result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatId() + "\"}");
		int readResult = service.readChat(dto);
		return result.toString();
	}
	
	public String getBox(String userNo) throws Exception {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		
		List<ChatDto> chatList = getChatListBox(userNo);
		List<UserDto> list = service.selectUserList();
		for(int i = 0; i < list.size(); i++) {
			for(int j = 0; j < chatList.size(); j++) {
				if(list.get(i).getUserNo().equals(chatList.get(j).getFromId()) && !userNo.equals(chatList.get(j).getFromId())) {
					chatList.get(j).setName(list.get(i).getName());
					chatList.get(j).setDepartmentName(list.get(i).getDepartmentName());
					chatList.get(j).setPositionName(list.get(i).getPositionName());
				} else if(list.get(i).getUserNo().equals(chatList.get(j).getToId()) && !userNo.equals(chatList.get(j).getToId())) {
					chatList.get(j).setName(list.get(i).getName());
					chatList.get(j).setDepartmentName(list.get(i).getDepartmentName());
					chatList.get(j).setPositionName(list.get(i).getPositionName());
				}
			}
		}
		
		if(chatList.size() == 0) return "";
		for(int i = 0; i < chatList.size(); i++) {
			
			String unread = "";
			if(userNo.equals(chatList.get(i).getToId())) {
				unread = service.selectChatUnreadedEsp(chatList.get(i));
				if(unread.equals("0")) unread = "";
			}
			
			result.append("[{\"value\": \"" + chatList.get(i).getFromId() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getToId() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getDepartmentName() + " " + chatList.get(i).getName() + " " + chatList.get(i).getPositionName() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"},");
			result.append("{\"value\": \"" + unread + "\"}]");
			if(i != chatList.size() - 1) result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatId() + "\"}");
		return result.toString();
	}
	

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String chatUsers(Model model, HttpSession session) throws Exception {
		
		// 부서 목록 (부서 번호, 부서명)
		List<DeptDto> deptValues = eaService.deptValues();
		model.addAttribute("deptValues", deptValues);
		
		// 사원 목록 (사원 번호, 이름, 부서(번호,이름), 직급(번호,이름) 데이터 가져오기 - ACTIVITY_YN = 'Y'인 사원만)
		// 로그인한 사용자를 제외한다.
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		List<EAUserDto> userValues = eaService.userValue(userNo);
		model.addAttribute("loginUserNo", userNo);
		model.addAttribute("userValues", userValues);
		
		return "chat/chatUsers";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String chatList() {
		
		return "chat/chatList";
	}
	
	
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String chat(Model model, @ModelAttribute ChatDto dto) throws Exception {
		
		String toId = dto.getToId();
		ChatDto userValue = service.getUserValue(toId);
		userValue.setToId(dto.getToId());
		
		model.addAttribute("userValue", userValue);
		
		return "chat/chatRoom";
	}

	@RequestMapping(value = "/sendingChat", method = RequestMethod.POST, produces="application/text; charset=utf8")
	@ResponseBody
	public String sendingChat(Model model, @ModelAttribute ChatDto dto) throws Exception {
		
		String fromId = dto.getFromId();
		String toId = dto.getToId();
		String chatContent = dto.getChatContent();
		
		if(fromId == null || fromId.equals("") || toId == null || toId.equals("") || chatContent == null || chatContent.equals("")) {
			return "0";
		} else if(fromId.equals(toId)) {
			return "-1";
		} else {
			int result = submit(dto);
			return result + "";
		}
		
	}
	
	@RequestMapping(value = "/callingChat", method = RequestMethod.POST, produces="application/text; charset=utf8")
	@ResponseBody
	public String callingChat(Model model, @ModelAttribute ChatDto dto) throws Exception {
		
		String fromId = dto.getFromId();
		String toId = dto.getToId();
		String listType = dto.getListType();
		
		if(fromId == null || fromId.equals("") || toId == null || toId.equals("") || listType == null || listType.equals("")) {
			return "";
		} else if(listType.equals("ten")) {
			String result = getTen(dto);
			return result;
		} else {
			try {
				String result1 = getId(dto);
				return result1;
			} catch (Exception e) {
				return "";
			}
		}
	}
	
	@RequestMapping(value = "/unreadedChat", method = RequestMethod.POST, produces="application/text; charset=utf8")
	@ResponseBody
	public String chatUnreadUpdate(HttpSession session, Model model) throws Exception {

		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
		int cntOfUnreadedChat = service.unreadedChat(userNo);
		model.addAttribute("cntOfUnreadedChat", cntOfUnreadedChat);
		
		return cntOfUnreadedChat + "";
	}

	@RequestMapping(value = "/chatBoxList", method = RequestMethod.POST, produces="application/text; charset=utf8")
	@ResponseBody
	public String chatBoxList(HttpSession session, Model model) {
		

		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
		if(userNo == null || userNo.equals("")) {
			return "";
		} else {
			try {
				String result1 = getBox(userNo);
				return result1;
			} catch (Exception e) {
				return "";
			}
		}
	}
	
}
