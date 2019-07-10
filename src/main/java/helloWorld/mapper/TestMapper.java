package helloWorld.mapper;

import helloWorld.bean.TestBean;

import java.util.List;

public interface TestMapper {

	List<TestBean> getTestUser();
	
	TestBean getTestUserById(int id);

	void insetTestUser(TestBean bean1);
	
	boolean updateTestUser(TestBean bean);

	boolean deleteTestUser(int id);
}
