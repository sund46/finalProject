package com.kh.nest.note.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nest.note.model.vo.Note;

@Repository
public class NoteDaoImpl implements NoteDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertNote(Note note) {
		return sqlSession.insert("note.insertNote",note);
	}

	@Override
	public Note selectOneNote(Note note) {
		return null;
	}

	@Override
	public List<Note> selectListNote(Note note) {
		return sqlSession.selectList("note.selectListNote", note);
	}

	@Override
	public int updateNote(Note note) {
		return 0;
	}

	@Override
	public int goTrash(Note note) {
		return sqlSession.update("note.goTrash", note);
	}
	
	@Override
	public int goAllTrash(Note note) {
		return sqlSession.update("note.goAllTrash", note);
	}
	
	@Override
	public int deleteOneTrash(int nno) {
		return sqlSession.delete("note.deleteOneTrash", nno);
	}

	@Override
	public int deleteAllTrash(int mno) {
		return sqlSession.delete("note.deleteAllTrash", mno);
	}
	
	@Override
	public int restoreTrash(Note note) {
		return sqlSession.update("note.restoreTrash", note);
	}

}
