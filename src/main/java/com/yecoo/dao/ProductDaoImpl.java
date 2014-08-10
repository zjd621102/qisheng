package com.yecoo.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.yecoo.model.CodeTableForm;
import com.yecoo.util.DbUtils;
import com.yecoo.util.StrUtils;

public class ProductDaoImpl extends BaseDaoImpl {

	private DbUtils dbUtils = new DbUtils();
	/**
	 * 获取所有产品
	 * @return
	 */
	public List<CodeTableForm> getProductList() {
		
		String sql = "SELECT t.* FROM sproduct t ORDER BY productid";
		List<CodeTableForm> list = dbUtils.getListBySql(sql);
		return list;
	}
	/**
	 * 获取产品数量
	 * @param form
	 * @return
	 */
	public int getProductCount(CodeTableForm form) {
		
		String sql = "SELECT COUNT(1) FROM sproduct t WHERE 1 = 1";
		String cond = getProductListCondition(form);
		sql  += cond;
		int count = dbUtils.getIntBySql(sql);
		return count;
	}
	/**
	 * 获取产品列表
	 * @param form
	 * @param pageNum
	 * @param numPerPage
	 * @return
	 */
	public List<CodeTableForm> getProductList(CodeTableForm form) {
		
		String sql = "SELECT t.*, (SELECT producttypename FROM sproducttype WHERE producttype = t.producttype) producttypename,"
				+ " (SELECT unitname FROM cunit WHERE unitid = t.unit) unitname"
				+ " FROM sproduct t WHERE 1 = 1";
		String cond = getProductListCondition(form);
		sql  += cond;
		sql += " ORDER BY productid";
		sql += " LIMIT " + (pageNum-1)*numPerPage + "," + numPerPage;
		List<CodeTableForm> list = dbUtils.getListBySql(sql);
		return list;
	}
	/**
	 * 获取产品列表-条件
	 * @param form
	 * @return
	 */
	public String getProductListCondition(CodeTableForm form) {
		
		StringBuffer cond = new StringBuffer("");
		String productname = StrUtils.nullToStr(form.getValue("productname"));
		String producttype = StrUtils.nullToStr(form.getValue("producttype"));
		
		if(!productname.equals("")) {
			cond.append(" AND t.productname like '%").append(productname).append("%'");
		}
		if(!producttype.equals("")) {
			cond.append(" AND t.producttype = '").append(producttype).append("'");
		}
		
		return cond.toString();
	}
	/**
	 * 新增产品
	 * @param form
	 * @return
	 */
	public int addProduct(CodeTableForm form, HttpServletRequest request) {
		
		int iReturn = dbUtils.setInsert(form, "sproduct", ""); //保存主表
		
		return iReturn;
	}
	/**
	 * 通过ID获取产品
	 * @param productid
	 * @return
	 */
	public CodeTableForm getProductById(int productid, HttpServletRequest request) {
		
		String sql = "SELECT a.*, (SELECT producttypename FROM sproducttype WHERE producttype = a.producttype) producttypename,"
				+ " (SELECT unitname FROM cunit WHERE unitid = a.unit) unitname"
				+ " FROM sproduct a WHERE a.productid = '" + productid + "'";
		CodeTableForm codeTableForm = dbUtils.getFormBySql(sql);
		
		return codeTableForm;
	}
	/**
	 * 修改产品
	 * @param form
	 * @return
	 */
	public int ediProduct(CodeTableForm form, HttpServletRequest request) {
		
		int iReturn = dbUtils.setUpdate(form, "", "sproduct", "productid", ""); //保存主表
		
		return iReturn;
	}
	/**
	 * 删除产品
	 * @param productid
	 * @return
	 */
	public int deleteProduct(int productid) {
		
		String sql = "DELETE FROM sproduct WHERE productid = '" + productid + "'";
		int iReturn = dbUtils.executeSQL(sql);
		
		return iReturn;
	}
}