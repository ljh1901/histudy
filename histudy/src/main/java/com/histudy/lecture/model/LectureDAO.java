package com.histudy.lecture.model;

import java.util.List;

public interface LectureDAO {
	public List<LectureDTO> lectureList();
	public LectureDTO lectureContent(int idx);
	public int lectureNoteInsert(LectureNoteDTO dto);

}
