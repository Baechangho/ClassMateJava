package main.dao.face;

import java.util.List;
import java.util.Map;

import lecture.dto.Class;
import main.dto.MainCategory;
import main.dto.SubCategory;
import user.dto.UserInfo;
import web.util.MainClassListPaging;
import web.util.Paging;

public interface MainDao {

	public List<UserInfo> listAll();

	public List<MainCategory> mainCategoryList();

	public List<SubCategory> subCategoryList(SubCategory subCategory);

	public int mainOnClassCntAll(Class cLass);
	
	public List<Class> onClassList(Map<String, Object> map);
	
	public int mainOffClassCntAll(Class cLass);
	
	public List<Class> offClassList(Map<String, Object> map);

	public List<Class> onClassSortList(Map<String, Object> map);

	public List<Class> offClassSortList(Map<String, Object> map);

	public List<Class> onClassViewList(Class cLass);








}
