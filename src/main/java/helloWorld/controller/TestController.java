package helloWorld.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import helloWorld.bean.TestBean;
import helloWorld.mapper.TestMapper;
import helloWorld.service.TestService;
import helloWorld.util.Pagination;

@Controller
public class TestController {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private TestService testService;
	@Autowired
	private TestMapper testMapper;

	/**
	 * 第一个请求测试 http://localhost:8888/test/test
	 * 
	 * @return
	 */
	@RequestMapping("/test1")
	@ResponseBody
	public String test() {
		System.out.println("test---------------------------------------------------------------------------------");
		return "test";
	}

	/**
	 * jdbc测试,连接mysql,使用JdbcTemplate
	 * 
	 * @return
	 */
	@RequestMapping("testJdbc")
	@ResponseBody
	public String testJdbc() {
		try {
			String sql = "select * from test_user";
			List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
			for (Map<String, Object> map : list) {
				Set<Entry<String, Object>> entries = map.entrySet();
				if (entries != null) {
					Iterator<Entry<String, Object>> iterator = entries.iterator();
					while (iterator.hasNext()) {
						Entry<String, Object> entry = (Entry<String, Object>) iterator.next();
						Object key = entry.getKey();
						Object value = entry.getValue();
						System.out.println(key + ":" + value);
					}
				}
			}
			return "jdbcTemplate连接mysql成功";
		} catch (DataAccessException e) {
			System.out.println("jdbcTemplate连接mysql失败" + e);
		}
		return "jdbcTemplate连接mysql失败";
	}

	/**
	 * mybatis连接mysql测试
	 * 
	 * @return
	 */
	@RequestMapping("testMybatis")
	@ResponseBody
	public String testMybatis() {
		try {
			List<TestBean> list = testService.getTestUser();
			return "mybatis连接mysql成功";
		} catch (DataAccessException e) {
			System.out.println("mybatis连接mysql失败" + e);
		}
		return "mybatis连接mysql失败";

	}

	@RequestMapping("/helloo")
	public String hello() {
		System.out.println("aaa");
		return "test";
	}

	@RequestMapping("/hello")
	public ModelAndView hello(Model model) {
		ModelAndView modelAndView = new ModelAndView("tt");
		modelAndView.addObject("hello", "欢迎大佬视察,快给大佬递茶2");
		return modelAndView;
	}

	@RequestMapping("/testPage")
	public ModelAndView testPage(HttpServletRequest request, TestBean bean, Pagination page) {
		HttpSession session = request.getSession(true);
		session.setAttribute("userId", session.getAttribute("userId"));
		ModelAndView modelAndView = new ModelAndView("testPage");
		List<TestBean> beans = testMapper.getTestUser();
		page.setPageSize(6);
		page.setTotalCount(beans.size());
		modelAndView.addObject("page", page);
		beans = page.getCurrentPageList(beans);
		modelAndView.addObject("beans", beans);
		return modelAndView;
	}

	@RequestMapping("/toadd")
	public String toaddUser() {

		return "/add";
	}

	@RequestMapping("/add")
	public String addUser(String name, int age, int sex, HttpServletRequest request) {
		TestBean bean = new TestBean();
		bean.setName(name);
		bean.setAge(age);
		bean.setSex(sex);
		testMapper.insetTestUser(bean);
		return "testPage";
	}

	@RequestMapping("/delete")
	public String delUser(int id, HttpServletRequest request, HttpServletResponse response) {
		String result = "{\"result\":\"error\"}";
		if (testService.deleteTestUser(id)) {
			result = "{\"result\":\"success\"}";
		}
		response.setContentType("application/json");
		try {
			PrintWriter out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "testPage";
	}

	@RequestMapping("/update")
	public String updateUser(TestBean bean, HttpServletRequest request, Model model) {
		if (testService.updateTestUser(bean)) {
			bean = testService.getTestUserById(bean.getId());
			request.setAttribute("bean", bean);
			model.addAttribute("bean", bean);
			return "testPage";
		} else {
			return "/error";
		}
	}

	/**
	 * 复制文本测试clipbord
	 */
	@RequestMapping("/testClipbord")
	public ModelAndView testClipbord() {
		ModelAndView modelAndView = new ModelAndView("test");
		System.out.println("总结:基本数据类型是值传递,其他数据类型是引用传递");
		return modelAndView;
	}
}
