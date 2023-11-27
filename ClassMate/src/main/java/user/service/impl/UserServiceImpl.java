package user.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teacher.dto.Teacher;
import user.dao.face.UserDao;
import user.dto.UserInfo;
import user.service.face.UserService;
@Service
public class UserServiceImpl implements UserService{
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired UserDao userDao;

	
	@Override
	public void join(UserInfo userInfo) {
		userDao.insertUser(userInfo);
	}
	
	@Override
	public UserInfo loginPost(UserInfo userInfo) {
		return userDao.selectUser( userInfo );
	}

	//강사 번호
	@Override //강사 번호
	public Teacher getTeacherNo(Teacher teacher) { //강사 번호
		
		return userDao.getTeachNo(teacher); //강사 번호
	} //강사 번호

    @Override
    public boolean checkDuplicateId(String userId) {
        int count = userDao.checkDuplicateId(userId);
        return count > 0;
    }

	@Override
	public UserInfo updateInfo(UserInfo userInfo) {
		logger.info("userInfo: {}",userInfo);
		UserInfo data = userDao.selectUserByNo( userInfo );
		logger.info("a: {}",data);
		return data;
	}

	@Override
	public int updateOutUser(UserInfo userInfo) {
		logger.info("updateOutUser()");
		logger.info("userInfo : {}", userInfo);
//		int data = userDao.deleteUserData( userInfo );
		int data = userDao.updateUserDataout( userInfo );
		logger.info("data: {}",data);
		return data;
		
	}

	@Override
	public int updateUserData(UserInfo userInfo) {
		logger.info("updateUserData()");
		int result = userDao.updateUserData(userInfo);
		return result;
	}

	@Override
	public String searchInfo(UserInfo userInfo) {
		return userDao.searchInfo(userInfo);
	}

	@Override
	public boolean checkUserInfo(UserInfo userInfo) {
	    return userDao.checkUserInfo(userInfo) > 0;
	}

    @Override
    public int updatePw(UserInfo userInfo) {
//    	int data = userDao.updatePw(userInfo.getUserNo(), userInfo.getUserPw());
//    	logger.info("data : {}", data);
//        return data;
    	return 0;
    }

//	@Override
//	public boolean updatePassword(String userPw) {
//		 int result = userDao.updatePassword(userPw);
//		// 업데이트된 행 수가 1이면 성공, 그렇지 않으면 실패
//		return result == 1;
//	}

    @Override
    public boolean updatePassword(UserInfo userInfo) {
        // userInfo 객체에서 비밀번호를 올바르게 가져오는지 확인
    	System.out.println( userInfo );
        String newPassword = userInfo.getUserPw(); // 혹은 get와 set 메서드의 명칭에 따라 다를 수 있습니다.
        System.out.println("Received password: " + newPassword);
        if(userDao.updatePassword(userInfo) > 0) { // 비밀번호가 업데이트 됐을 때 = 변경 성공했을 때
        	return true;
        } else {
        	return false;
        }
        
    }

	@Override
	public boolean findPassword(UserInfo userInfo) {
        // userInfo 객체에서 비밀번호를 올바르게 가져오는지 확인
    	System.out.println( userInfo );
        String chkPassword = userDao.selectByUserId(userInfo); // 혹은 get와 set 메서드의 명칭에 따라 다를 수 있습니다.
        System.out.println("Received password: " + chkPassword);
        // 가져온 비밀번호가 null이 아닌지 확인
        if ( chkPassword != null ) { // 입력한 유저 정보가 일치해서 pw가 조회될때 
            return true;
        } else {
            // 비밀번호가 null이거나 비어있으면 업데이트 실패로 처리
            return false;
        }
	}
}
