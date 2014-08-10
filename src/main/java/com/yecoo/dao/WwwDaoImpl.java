package com.yecoo.dao;

import java.util.List;
import com.yecoo.model.CodeTableForm;
import com.yecoo.util.DbUtils;
import com.yecoo.util.StrUtils;
/**
 * 网站
 * @author zhoujd
 */
public class WwwDaoImpl extends BaseDaoImpl {

	private DbUtils dbUtils = new DbUtils();
	/**
	 * 产品类型列表
	 * @param form
	 * @return
	 */
	public List<CodeTableForm> getProductTypeList() {
		
		String sql = "SELECT * FROM sproducttype t ORDER BY t.priority";
		List<CodeTableForm> list = dbUtils.getListBySql(sql);
		return list;
	}
	/**
	 * 产品数量
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
	 * 产品列表
	 * @param form
	 * @return
	 */
	public List<CodeTableForm> getProductList(CodeTableForm form) {
		
		String sql = "SELECT * FROM sproduct t WHERE 1 = 1";
		String cond = getProductListCondition(form);
		sql += cond;
		sql += " ORDER BY t.createdate DESC";
		sql += " LIMIT " + (pageNum-1)*numPerPage + "," + numPerPage;
		List<CodeTableForm> list = dbUtils.getListBySql(sql);
		return list;
	}
	/**
	 * 产品列表-条件
	 * @param form
	 * @return
	 */
	public String getProductListCondition(CodeTableForm form) {
		
		StringBuffer cond = new StringBuffer("");
		String producttype = StrUtils.nullToStr(form.getValue("producttype"));
		
		if(!producttype.equals("")) {
			cond.append(" AND (t.producttype = '").append(producttype)
				.append("' OR EXISTS (SELECT 1 FROM sproducttype b WHERE b.producttype = t.producttype AND b.parent = '")
				.append(producttype).append("'))");
		}
		
		return cond.toString();
	}
}