package com.kh.nest;

import java.io.File;

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
	public String handleTinyMCEUpload(@RequestParam("files") MultipartFile files[]) {
	    System.out.println("uploading______________________________________MultipartFile " + files.length);
	    String filePath = "/resources/uploads/tinyMCE/" + files[0].getOriginalFilename();
	    String result = uploadFilesFromTinyMCE("tinyMCE", files, false);
	    System.out.println(result);
	    return "{\"location\":\"" + filePath + "\"}";

	}

	private String uploadFilesFromTinyMCE(String prefix, MultipartFile files[], boolean isMain) {
	    System.out.println("uploading______________________________________" + prefix);
	    try {
	        String folder = context.getRealPath("/") + "/resources/uploads/" + prefix;
	        StringBuffer result = new StringBuffer();
	        byte[] bytes = null;
	        result.append("Uploading of File(s) ");

	        for (int i = 0; i < files.length; i++) {
	            if (!files[i].isEmpty()) {

	                try {
	                    boolean created = false;

	                    try {
	                        File theDir = new File(folder);
	                        theDir.mkdir();
	                        created = true;
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
