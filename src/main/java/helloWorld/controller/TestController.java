package helloWorld.controller;

import helloWorld.bean.TestBean;
import helloWorld.service.TestService;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private TestService testService;
	
	
	/**
	 * 第一个请求测试   http://localhost:8888/test/test
	 * @return
	 */
	@RequestMapping("/test")
	@ResponseBody
	public String test() {
		System.out.println("test---------------------------------------------------------------------------------");
		return "222test";
	}
	
	/**
	 * jdbc测试,连接mysql,使用JdbcTemplate
	 * @return
	 */
	@RequestMapping("testJdbc")
	@ResponseBody
	public String testJdbc(){
		 try {
			String sql = "select * from test_user";
			 List<Map<String, Object>> list =  jdbcTemplate.queryForList(sql);
			 for (Map<String, Object> map : list) {
			        Set<Entry<String, Object>> entries = map.entrySet( );
			            if(entries != null) {
			                Iterator<Entry<String, Object>> iterator = entries.iterator( );
			                while(iterator.hasNext( )) {
			                Entry<String, Object> entry =(Entry<String, Object>) iterator.next( );
			                Object key = entry.getKey( );
			                Object value = entry.getValue();
			                System.out.println(key+":"+value);
			            }
			        }
			    }
			 return "jdbcTemplate连接mysql成功";
		} catch (DataAccessException e) {
			System.out.println("jdbcTemplate连接mysql失败"+e);
		}
		return "jdbcTemplate连接mysql失败";
	}
	
	/**
	 * mybatis连接mysql测试
	 * @return
	 */
	@RequestMapping("testMybatis")
	@ResponseBody
	public String testMybatis(){
		try {
			List<TestBean> list =  testService.getTestUser();		
			return "mybatis连接mysql成功";
		} catch (DataAccessException e) {
			System.out.println("mybatis连接mysql失败"+e);
		}
		return "mybatis连接mysql失败";
 
	}
	
}
