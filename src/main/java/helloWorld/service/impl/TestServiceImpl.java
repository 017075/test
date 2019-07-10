package helloWorld.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import helloWorld.bean.TestBean;
import helloWorld.mapper.TestMapper;
import helloWorld.service.TestService;
@Service
@Transactional
public class TestServiceImpl implements TestService {
	@Autowired
	private TestMapper testMapper;
	
	private final Logger logger = Logger.getLogger(this.getClass());

	public List<TestBean> getTestUser() {
		logger.info("第一条测试日志输出成功");
		TestBean bean1 = new TestBean();
		bean1.setName("事务测试1");
		bean1.setAge(18);
		bean1.setSex(1);
		TestBean bean2 = new TestBean();
		bean2.setName("事务测试2");
		bean2.setAge(18);
		bean2.setSex(1);
		
		testMapper.insetTestUser(bean1);
		testMapper.insetTestUser(bean2);
		return testMapper.getTestUser();
	}

	@Override
	public TestBean getTestUserById(int id) {
	
		return testMapper.getTestUserById(id);
	}

	@Override
	public void insetTestUser(TestBean bean1) {
		testMapper.insetTestUser(bean1);
		
	}

	@Override
	public boolean updateTestUser(TestBean bean) {
		return testMapper.updateTestUser(bean);
	}

	@Override
	public boolean deleteTestUser(int id) {
		return testMapper.deleteTestUser(id);
	}

}
