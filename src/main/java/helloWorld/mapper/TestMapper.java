package helloWorld.mapper;

import helloWorld.bean.TestBean;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

public interface TestMapper {

	List<TestBean> getTestUser();

	void insetTestUser(TestBean bean1);

}
