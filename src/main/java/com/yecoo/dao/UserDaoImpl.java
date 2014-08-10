package com.yecoo.dao;

import java.util.List;
import com.yecoo.model.CodeTableForm;
import com.yecoo.util.DbUtils;
import com.yecoo.util.Md5;
import com.yecoo.util.StrUtils;
/**
 * 用户管理
 * @author zhoujd
 */
public class UserDaoImpl extends BaseDaoImpl {

	private DbUtils dbUtils = new DbUtils();
	/**
	 * 用户数量
	 * @param form
	 * @return
	 */
	public int getUserCount(CodeTableForm form) {
		
		String sql = "SELECT COUNT(t.userid) FROM suser t WHERE 1 = 1";
		String cond = getUserListCondition(form);
		sql  += cond;
		int count = dbUtils.getIntBySql(sql);
		return count;
	}
	/**
	 * 用户列表
	 * @param form
	 * @param pageNum
	 * @param numPerPage
	 * @return
	 */
	public List<CodeTableForm> getUserList(CodeTableForm form) {
		
		String sql = "SELECT * FROM suser t WHERE 1 = 1";
		String cond = getUserListCondition(form);
		sql  += cond;
		sql += " LIMIT " + (pageNum-1)*numPerPage + "," + numPerPage;
		List<CodeTableForm> list = dbUtils.getListBySql(sql);
		return list;
	}
	/**
	 * 用户列表-条件
	 * @param form
	 * @return
	 */
	public String getUserListCondition(CodeTableForm form) {
		
		StringBuffer cond = new StringBuffer("");
		String username = StrUtils.nullToStr(form.getValue("username"));
		
		if(!username.equals("")) {
			cond.append(" AND t.username like '%").append(username).append("%'");
		}
		
		return cond.toString();
	}
	/**
	 * 获取用户信息
	 * @param userid
	 * @return
	 */
	public CodeTableForm getUserById(String userid) {
		
		String sql = "SELECT a.* FROM suser a WHERE a.userid = upper('" + userid + "')";
		CodeTableForm codeTableForm = dbUtils.getFormBySql(sql);
		return codeTableForm;
	}
	/**
	 * 新增用户
	 * @param form
	 * @return
	 */
	public int addUser(CodeTableForm form) {
		
		//密码加密
		String passwd = StrUtils.nullToStr(form.getValue("passwd"));
		if(!passwd.equals("")) {
			Md5 md5 = new Md5();
			form.setValue("passwd", md5.md5(passwd));
		}
		
		int iReturn = dbUtils.setInsert(form, "suser", "");
		
		return iReturn;
	}
	/**
	 * 修改用户
	 * @param form
	 * @return
	 */
	public int ediUser(CodeTableForm form) {
		
		//密码加密
		String passwd = StrUtils.nullToStr(form.getValue("passwd"));
		if(!passwd.equals("")) {
			Md5 md5 = new Md5();
			form.setValue("passwd", md5.md5(passwd));
		}
		
		int iReturn = dbUtils.setUpdate(form, "", "suser", "userid", "");
		
		return iReturn;
	}
	/**
	 * 删除用户
	 * @param userids
	 * @return
	 */
	public int deleteUsers(String userids) {
		
		String sql = "DELETE FROM suser WHERE userid IN (" + userids + ")";
		return dbUtils.executeSQL(sql);
	}
	
	public int changePassword(CodeTableForm form) {
		
		//密码加密
		String passwd = StrUtils.nullToStr(form.getValue("passwd"));
		if(!passwd.equals("")) {
			Md5 md5 = new Md5();
			form.setValue("passwd", md5.md5(passwd));
		}
		
		int iReturn = dbUtils.setUpdate(form, "suser", "userid");
		return iReturn;
	}
}