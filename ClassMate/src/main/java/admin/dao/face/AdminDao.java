package admin.dao.face;

import java.util.List;
import java.util.Map;

import board.dto.AnnounceBoard;
import board.dto.AnnounceBoardFile;
import board.dto.EventBoard;
import board.dto.EventBoardFile;
import board.dto.FreeBoard;
import board.dto.FreeBoardFile;
import board.dto.FreeComment;
import board.dto.Question;
import board.dto.QuestionFile;
import lecture.dto.Address;
import lecture.dto.Class;
import lecture.dto.ClassVideo;
import payment.dto.OrderTb;
import payment.dto.Payment;
import teacher.dto.Teacher;
import teacher.dto.TeacherApply;
import teacher.dto.TeacherLicence;
import user.dto.UserInfo;
import web.util.Paging;

public interface AdminDao {
	
	//--- 메인 ---
	/**
	 * 탈퇴저리되지 않은 유저의 정보를 리스트 형식으로 가져온다
	 * 
	 * @param param 탈퇴여부( 0:미탈퇴, 1:탈퇴)
	 * 
	 * @return 가져온 유저 정보 리스트
	 */
	public int getUserCountAll(int param);
	
	public int getTeacherUserCountAll(int param);
	
	public int getOnOffClassCountAll(int param);

	public Payment getPaymentData(int monthCount);

	//========================================================================================================
	//--- 유저 관리 ---
	
	/**
	 * 전체 유저 수를 조회한다
	 * @param delCheckbox 
	 * 
	 * 
	 * @return 총 유저 수
	 */
	public int userInfoCntAll(int delCheckbox);

	public List<UserInfo> selectUserAll(Map<String, Object> map);
	
	public List<TeacherApply> selectTeacherApplyByUserNo(List<UserInfo> list);

	public List<UserInfo> selectDelUserAll(Map<String, Object> map);

	public UserInfo selectUser(UserInfo userdata);

	public int updateUser(UserInfo userdata);
	
	public int updateAdmin(UserInfo userdata);

	public int setSecessionUser(UserInfo userdata);

	public int selectOrderCnt(OrderTb orderTb);
	
	public List<OrderTb> selectUserOrder(Map<String, Object> map);
	
	public List<Payment> selectUserPayment(Map<String, Object> map);

	public Class selectClassNameByClassNo(int i);
	
	public int userQuestionCntAll(UserInfo userInfo);
	
	public List<Question> userQuestionList(Map<String, Object> map);
	
	public int userFreeboardCntAll(UserInfo userInfo);

	public List<FreeBoard> userFreeBoardList(Map<String, Object> map);
	
	public Question selectQuestionNo(Question question);
	
	public List<QuestionFile> selectQuestionFiles(Question question);
	
	public QuestionFile selectQuestionFile(QuestionFile questionFile);
	
	public QuestionFile selectQuestionFileByFileNo(QuestionFile questionFile);
	
	public int insertAnswer(Question question);

	public List<FreeBoardFile> selectFreePostFile(FreeBoard freeBoard);

	public int updateUserFreePost(FreeBoard freeBoard);
	
	public FreeBoard selectUserFreePost(FreeBoard freeBoard);
	
	public int insertFreeFile(FreeBoardFile freeBoardFile);
	
	public int deleteFreeFiles(int[] delFileno);
	
	public int deleteFreePostFile(FreeBoard freeBoard);

	public int deleteUserFreePost(FreeBoard freeBoard);
	
	public int deleteTeacherInfoByUserNo(UserInfo userInfo);
	
	public int deleteUserInfo(UserInfo userInfo);
	
	//========================================================================================================
	//--- 유저 관리 > 환불처리 ---
	
	public int updateRefund(String merchantUid);
	
	//========================================================================================================
	//--- 강사 심사 관리 ---
	
	public int selectApplyCntAll(int passCheckbox);
	
	public List<TeacherApply> selectTeacherApplyAll(Map<String, Object> map);
	
	public List<Teacher> selectTeacherInfoAll(Map<String, Object> map);
	
	public Teacher selectTeacherInfo(TeacherApply teacherApply);

	public TeacherApply selectTeacherApply(TeacherApply teacherApply);
	
	public UserInfo selectUserName(Teacher teacher);
	
	public List<TeacherLicence> selectTeacherLicence(Teacher teacher);

	public int updateTeacherApply(TeacherApply teacherApply);

	public int deleteTeacherApply(TeacherApply teacherApply);

	public int deleteTeacherLicence(TeacherApply teacherApply);

	public int deleteTeacherInfo(TeacherApply teacherApply);
	
	public TeacherLicence selectTeacherLicenceByLicenceNo(TeacherLicence teacherLicence);
	
	//========================================================================================================
	//--- 클래스 관리 ---
	
	public int classInfoCntAll(Map<String, Object> map);
	
	public List<Class> selectClassListAll(Map<String, Object> map);

	public Class selectClassInfo(Class classInfo);

	public int selectTakeClassListCount(Class classInfo);
	
	public int deleteClassList(int userNo);
	
	public int updateClassDeleteBoolean(Class calssInfo);

	public List<ClassVideo> selectClassVideoList(Class classInfo);
	
	public Address selectClassAdress(Class classInfo);
	
	public int updateClassInfo(Class classInfo);
	
	public int classHeadImg(Class classInfo);
	
	public int updateClassAddress(Address address);
	
	public int deleteClassFiles(int[] delFileno);
	
	public int insertClassFile(ClassVideo videoInfo);

	
	//========================================================================================================
	//--- 게시판 관리 ---
	
	public int announceBoardCntAll(int delCheckbox);

	public int eventBoardCntAll(int delCheckbox);

	public List<EventBoard> selectEventBoardAll(Map<String, Object> pagingMap);

	public List<AnnounceBoard> selectAnnounceBoardAll(Map<String, Object> pagingMap);
	
	public List<EventBoard> selectEventBoardDel(Map<String, Object> pagingMap);

	public List<AnnounceBoard> selectAnnounceBoardDel(Map<String, Object> pagingMap);

	public AnnounceBoard selectAnnounceNo(AnnounceBoard announceBoard);

	public int insertAnnounceInfo(AnnounceBoard announceBoard);

	public int insertEventInfo(EventBoard eventBoard);

	public int headImg(EventBoard eventBoard);

	public EventBoard selectEventNo(EventBoard eventBoard);

	public int insertAnnoFile(AnnounceBoardFile announceBoardFile);

	public List<AnnounceBoardFile> selectAnnounceFile(AnnounceBoard announceBoard);

	public int insertEventFile(EventBoardFile eventBoardFile);

	public List<EventBoardFile> selectEventFile(EventBoard eventBoard);
	
	public int updateEventInfo(EventBoard eventBoard);

	public int deleteEventFiles(int[] delFileno);

	public int updateAnnoInfo(AnnounceBoard announceBoard);

	public int deleteAnnoFiles(int[] delFileno);

	public int updateAnnoExist(AnnounceBoard announceBoard);

	public int updateEventExist(EventBoard eventBoard);

	public int deleteAnnoFile(AnnounceBoard announceBoard);

	public int deleteAnnoInfo(AnnounceBoard announceBoard);

	public AnnounceBoardFile selectAnnoFileByFileNo(AnnounceBoardFile announceBoardFile);
	
	public EventBoardFile selectEventFileByFileNo(EventBoardFile eventBoardFile);
	
	public int deleteEventFile(EventBoard eventBoard);

	public int deleteEventInfo(EventBoard eventBoard);

	//================================================================================
	//--- 게시판 관리 > 자유게시판 ---
	
	public int freeBoardCntAll();

	public List<FreeBoard> selectFreeBoardAll(Map<String, Object> map);

	public int deleteFreeFilesByFreeNo(int[] freePostNo);

	public int deletePostBoardNo(int[] freePostNo);

	public int freeCommentCntAll(FreeBoard freeBoard);

	public List<FreeComment> selectFreeCommentList(Paging paging, FreeBoard freeBoard);

	public List<FreeComment> selectFreeCommentList(Map<String, Object> map);

	public List<UserInfo> selectUserNameList(Map<String, Object> map);

	public int deleteCommentComentNo(FreeComment freeComment);

	public int qestionListCntAll();

	public List<Question> selectQuestionAll(Paging paging);


}
