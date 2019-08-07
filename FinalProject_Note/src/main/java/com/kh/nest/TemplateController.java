package com.kh.nest;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class TemplateController {
	
	@RequestMapping(value = "/a/images", method = RequestMethod.POST)
	@ResponseBody
	public String handleTinyMCEUpload(@RequestParam("files") MultipartFile files[],HttpSession session) {
	    System.out.println("uploading______________________________________MultipartFile " + files.length);
	    String filePath = "/resources/uploads/images/" + files[0].getOriginalFilename();
	    String result = uploadFilesFromTinyMCE("images", files, false,session);
	    System.out.println(result);
	    return "{\"location\":\"" + filePath + "\"}";

	}
	@RequestMapping(value = "/a/files", method = RequestMethod.POST)
	@ResponseBody
	public String handleTinyMCEUpload2(@RequestParam("files") MultipartFile files[],HttpSession session) {
	    System.out.println("uploading______________________________________MultipartFile " + files.length);
	    String filePath = "/resources/uploads/files/" + files[0].getOriginalFilename();
	    String result = uploadFilesFromTinyMCE("files", files, false,session);
	    System.out.println(result);
	    return "{\"location\":\"" + filePath + "\"}";
	}
	private String uploadFilesFromTinyMCE(String prefix, MultipartFile files[], boolean isMain,HttpSession session) {
		ServletContext context=session.getServletContext();
	    System.out.println("uploading______________________________________" + prefix);
	    try {
	        String folder = context.getRealPath("/") + "/resources/uploads/" + prefix+"/";
	        StringBuffer result = new StringBuffer();
	        byte[] bytes = null;
	        result.append("Uploading of File(s) ");

	        for (int i = 0; i < files.length; i++) {
	            if (!files[i].isEmpty()) {

	                try {
	                    boolean created = false;

	                    try {
	                        File theDir = new File(folder);
	                        System.out.println("1");
	                        theDir.mkdir();
	                        System.out.println("2");
	                        created = true;
	                        System.out.println("3");
	                    } catch (SecurityException se) {
	                        se.printStackTrace();
	                    }
	                    if (created) {
	                        System.out.println("DIR created");
	                    }
	                    String path = "";
	                    path = folder + files[i].getOriginalFilename();
	                    File destination = new File(path);
	                    System.out.println("--> " + destination);
	                    System.out.println("파일전송");
	                    files[i].transferTo(destination);
	                    result.append(files[i].getOriginalFilename() + " Succsess. ");
	                } catch (Exception e) {
	                    throw new RuntimeException("Product Image saving failed", e);
	                }

	            } else
	                result.append(files[i].getOriginalFilename() + " Failed. ");

	        }

	        return result.toString();

	    } catch (Exception e) {
	        return "Error Occured while uploading files." + " => " + e.getMessage();
	    }
	}
	
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
		return "template4";
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
