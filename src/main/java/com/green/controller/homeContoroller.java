package com.green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class homeContoroller {

	@RequestMapping("/WriteMessage")
	   public String writeMessage() {
	      
	      return "/message";
	      
	      
	   }
	   @RequestMapping("/RecepMessage")
	   public String recepMessage22() {
	      
	      return "/recepMessage";
	   
	   }   
	   @RequestMapping("/SendMessage")
	   public String sendMessage() {
	      
	      return "/sendMessage";
	   
	   }
	   @RequestMapping("/ReadMessage")
	   public String readMessage() {
		return "/readMessage";
		   
	
	   }
}
