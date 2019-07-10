package helloWorld.service;

import java.util.List;

import helloWorld.bean.TestBean;

public interface TestService {

	List<TestBean> getTestUser();

	TestBean getTestUserById(int id);

	void insetTestUser(TestBean bean1);
	
	boolean updateTestUser(TestBean bean);

	boolean deleteTestUser(int id);
}
