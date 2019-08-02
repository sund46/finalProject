package com.kh.nest.note.model.dao;

import java.util.List;

import com.kh.nest.note.model.vo.Note;

public interface NoteDao {
	// insert, selectOne, selectList, update, goTrash, restoreTrash
	
		int insertNote(Note note); //insert update delete 는 정수형으로 받아옴
		
		Note selectOneNote(Note note); //select는 resultMap(쿼리)를 받아오기 때문에 객체로 반환
		
		List<Note> selectListNote(Note note);
		
		int updateNote(Note note);
		
		int goTrash(Note note); //휴지통여부
		
		int goAllTrash(Note note);

		int deleteOneTrash(int nno);

		int deleteAllTrash(int mno);
		
		int restoreTrash(Note note); //복원하기
}
