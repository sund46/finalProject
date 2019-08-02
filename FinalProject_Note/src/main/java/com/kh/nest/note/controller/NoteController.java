package com.kh.nest.note.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.nest.note.model.service.NoteService;
import com.kh.nest.note.model.vo.Note;

@Controller
public class NoteController {
	@Autowired
	NoteService noteService;
	
	@RequestMapping("/note/insertNote.do")
	public String insertNote(@RequestParam("ntitle") String ntitle, @RequestParam("ncontent") String ncontent) {
		
		Note note = new Note();
		
		note.setNcontent(ncontent);
		note.setNtitle(ntitle);
		note.setMno(1);
		
		int result = noteService.insertNote(note);
		
		if(result>0) System.out.println("저장 성공");
		else System.out.println("실패");
		return "index";
	}
	
	@RequestMapping("/note/note.do")
	public String selectListNote(@RequestParam("mno") int mno, @RequestParam("yn") String yn, Model model) {
		
		Note note = new Note(mno,yn);
		System.out.println(note);
		List<Note> list = noteService.selectListNote(note);
		
		System.out.println("list : "+list);
		
		model.addAttribute("list",list);
		String path;
		if(yn.equals("Y")) path="trashView";
		else path="noteview";
		
		return path;
	}
	
	
	
	@RequestMapping("/note/goBackTrash.do")
	public String goTrash(@RequestParam("trashcan") String trashcan, @RequestParam("nno") int nno, Model model) {
		Note note = new Note();
		note.setNno(nno);
		note.setTrashcan(trashcan);
		
		int result = noteService.goTrash(note);
		
		Note note2 = new Note(1,"N");
		List<Note> list = noteService.selectListNote(note2);
		
		if(result>0) System.out.println("휴지통으로이동");
		else System.out.println("이동 실패");
		
		model.addAttribute("list", list);
		
		return "noteview";
	}
	
	@RequestMapping("/note/goAllTrash.do")
	public String goAllTrash(@RequestParam("trashcan") String trashcan, @RequestParam("mno") int mno) {
		Note note = new Note();
		note.setMno(mno);
		note.setTrashcan(trashcan);
		
		int result = noteService.goAllTrash(note);
		
		if(result>0) System.out.println("휴지통으로이동");
		else System.out.println("이동 실패");
		
		return "noteview";
	}
	
	
	@RequestMapping("/note/deleteOneTrash.do")
	public String deleteOneTrash(@RequestParam int nno) {
		System.out.println("delete 전 확인 : " + nno);
		int result = noteService.deleteOneTrash(nno);
		if(result>0) System.out.println("삭제 완료");
		else System.out.println("삭제 실패");
		
		return "trashView";
	}
	
	@RequestMapping("/note/deleteAllTrash.do")
	public String deleteAllTrash(@RequestParam int mno) {
		System.out.println("mno 확인 : "+mno);
		int result = noteService.deleteAllTrash(mno);
		
		if(result>0) System.out.println("전체삭제 완료");
		else System.out.println("전체삭제 실패");
		
		return "trashView";
	}
	
	
	@RequestMapping("/note/restoreTrash.do")
	public String restoreTrash(@RequestParam("nno") int nno, @RequestParam("trashcan") String trashcan, Model model) {
		Note note = new Note();
		note.setNno(nno);
		note.setTrashcan(trashcan);
		System.out.println("note:" + note);
		
		int result = noteService.restoreTrash(note);
		
		Note note2 = new Note(1, "Y");
		List<Note> list = noteService.selectListNote(note2);
		System.out.println("list : "+list);
		
		if(result>0) System.out.println("노트로 이동");
		else System.out.println("이동 실패");
		
		model.addAttribute("list",list);
		
		return "trashView";
	}
	
}
