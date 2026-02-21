package com.histudy.study.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.histudy.user.model.UserDTO;

public class StudyDAOImple implements StudyDAO {
   
   private SqlSessionTemplate sqlSession;
   
   public StudyDAOImple(SqlSessionTemplate sqlSession) {
      super();
      this.sqlSession = sqlSession;
   }

   /** 스터디 개설  */
   @Override
   public int createStudy(StudyDTO dto) {
      int count = sqlSession.insert("insertStudy", dto);
      return count;
   }
   
   /** 스터디 리스트 조회 */
   @Override
   public List<StudyDTO> getStudyList(Map<String, Integer> map) {
      List<StudyDTO> lists = sqlSession.selectList("selectStudyList", map);
      return lists;
   }
   
   /** 스터디 총 갯수 (페이징 시 필요) */
   @Override
	public int studyTotalCnt(Integer sc_idx) {
	      int count = sqlSession.selectOne("studyTotalCnt", sc_idx);
	      return count;
   }
   
   /** 스터디 개설 페이지 이동 시 로그인된 사용자 정보 조회 */
   @Override
   public UserDTO getStudyCreateUser(int user_idx) {
      UserDTO dto = sqlSession.selectOne("studyCreateUser", user_idx);
      return dto;
   }
   
   /** 스터디 개설 갯수 총 3개 제한을 두기 위한 count(*)조회 */
   @Override
   public int studyMaxCreate(int user_idx) {
      int result = sqlSession.selectOne("studyMaxCreate", user_idx);
      return result;
   }
   
   /** 스터디 내용 페이지 입장 시 필요한 데이터 조회 */
   @Override
	public StudyDTO getStudyContent(int study_idx) {
	   StudyDTO dto = sqlSession.selectOne("selectStudyContent", study_idx);
	   return dto;
	}
   
   /** 스터디 검색 시 디비에 저장되어 있는 모든 스터디 제목 조회 */
   @Override
	public List<StudyDTO> findStudyTitle() {
	   List<StudyDTO> titleList = sqlSession.selectList("studyTitleFind");
		return titleList;
	}
   
   /** 검색 결과가 몇개인지 총 갯수 조회 */
   @Override
	public int studyTitleSearchTotalCnt(String searchTitle) {
		int count = sqlSession.selectOne("studyTitleSearchTotalCnt", searchTitle);
		return count;
	}
 
}
