package test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import entity.Product;

/**
 * @author Bach
 *
 */
public class TestServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Product> list = new ArrayList<>();
		list.add(new Product("羽绒服", 125));
		list.add(new Product("羊毛衫", 79));
		list.add(new Product("T恤衫", 185));
		
		ObjectMapper mapper = new ObjectMapper(); //提供java-json相互转换功能的类
		String json = mapper.writeValueAsString(list); //将list对象转换为json数据格式
		System.out.println(json);
		//将json数据返回给客户端
		resp.setContentType("text/html; charset=utf-8");
		resp.getWriter().write(json);
	}
	
	
	
}
