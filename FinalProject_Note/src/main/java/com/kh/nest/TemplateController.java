package com.kh.nest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TemplateController {
	
	@RequestMapping("/template.do")
	public String template() {
		return "template";
	}
	
	@RequestMapping("/template2.do")
	public String template2() {
		return "template2";
	}
	
	@RequestMapping("/template3.do")
	public String template3() {
		return "template3";
	}
	
	@RequestMapping("/template4.do")
	public String template4() {
		return "summernote";
	}
	
	@RequestMapping("/template5.do")
	public String template5() {
		return "finalTemplate";
	}
	
	
}
