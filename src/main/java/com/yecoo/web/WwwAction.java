package com.yecoo.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yecoo.dao.WwwDaoImpl;
import com.yecoo.model.CodeTableForm;
import com.yecoo.util.DbUtils;
import com.yecoo.util.StrUtils;
/**
 * 网站
 * @author zhoujd
 */
@Controller
public class WwwAction {

	private WwwDaoImpl wwwDaoImpl = new WwwDaoImpl();
	private DbUtils dbUtils = new DbUtils();

	/**
	 * 进入首页
	 */
	@RequestMapping(value = "/www/main", method = RequestMethod.GET)
	public String main(HttpServletRequest request) {
		
		String sql = "SELECT * FROM sproduct t ORDER BY t.createdate DESC LIMIT 0,12";
		List<CodeTableForm> productList = dbUtils.getListBySql(sql);
		
		request.setAttribute("productList", productList); // 产品列表
		
		return "../www/jsp/main";
	}

	/**
	 * 产品中心
	 */
	@RequestMapping(value = "/www/product")
	public String product(CodeTableForm form, HttpServletRequest request) {

		String tab = StrUtils.nullToStr(request.getParameter("tab"));
		
		wwwDaoImpl.initAction(request);

		List<CodeTableForm> productTypeList = wwwDaoImpl.getProductTypeList();
		int rscount = wwwDaoImpl.getProductCount(form);
		List<CodeTableForm> productList = wwwDaoImpl.getProductList(form);
		
		request.setAttribute("productTypeList", productTypeList); // 产品类型列表
		request.setAttribute("rscount", rscount); // 产品记录数
		request.setAttribute("productList", productList); // 产品列表
		request.setAttribute("tab", tab); // 标签
		
		return "../www/jsp/product";
	}
}