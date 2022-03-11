package com.kh.iag.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/chat")
public class ChatController {
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String chatUsers() {
		
		return "chat/chatUsers";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String chatList() {
		
		return "chat/chatList";
	}
	
	
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String chat() {
		
		return "chat/chatRoom";
	}
}
