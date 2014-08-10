package com.yecoo.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yecoo.dao.UserDaoImpl;
import com.yecoo.model.CodeTableForm;
import com.yecoo.util.Constants;
import com.yecoo.util.DateUtils;
import com.yecoo.util.DbUtils;
import com.yecoo.util.Md5;
import com.yecoo.util.StrUtils;
import com.yecoo.util.dwz.AjaxObject;
/**
 * 公共管理
 * @author zhoujd
 */
@Controller
public class PublicAction {

	private UserDaoImpl daoImpl = new UserDaoImpl();
	private DbUtils dbUtils = new DbUtils();

	/**
	 * 进入用户登录界面
	 * 
	 * 方法都可以接受的参数（参数数量和顺序没有限制）：
	 * HttpServletRequest，HttpServletRespons，HttpSession（session必须是可用的），
	 * PrintWriter，Map,Model，@PathVariable（任意多个），@RequestParam（任意多个），
	 * @CookieValue（任意多个），@RequestHeader，Object（pojo对象），BindingResult等等
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String toLogin() {

		return "login";
	}

	/**
	 * 用户登录
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request) {

		String username = StrUtils.nullToStr(request.getParameter("username")).toUpperCase();
		String password = StrUtils.nullToStr(request.getParameter("password")).toUpperCase();
		Md5 md5 = new Md5();
		password =  md5.md5(password);
		String msg = "";
		
		try {
			CodeTableForm user1 = daoImpl.getUserById(username);
			
			if(user1 == null) {
				msg = "（用户不存在）";
			} else if(!password.equals(user1.getValue("passwd"))) {
				msg = "（密码错误）";
			} else {
				request.getSession().setAttribute(Constants.USER_INFO_SESSION, user1); //用户信息
				
				String sql = "SELECT * FROM smodule a ORDER BY a.priority, a.parentid, a.moduleid";
				List<CodeTableForm> menuList = dbUtils.getListBySql(sql); //菜单信息
				request.getSession().setAttribute(Constants.MENU_INFO_SESSION, menuList);
				
				setIndex(request);
	
				this.saveLog(request, "登录");
				
				return "index";
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "（其他的登录错误）";
		}
		
		request.setAttribute("msg", msg);
		return "login";
	}

	/**
	 * 退出
	 */
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {

		request.getSession().removeAttribute(Constants.USER_INFO_SESSION);
		request.getSession().removeAttribute(Constants.MENU_INFO_SESSION);
		return "login";
	}

	/**
	 * 进入首页
	 */
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) {

		setIndex(request);
		
		return "index";
	}

	@RequestMapping(value = "/loginDialog", method = RequestMethod.GET)
	public String toLoginDialog() {

		return "loginDialog";
	}

	/**
	 * 用户登录
	 */
	@ResponseBody
	@RequestMapping(value = "/loginDialog", method = RequestMethod.POST)
	public String loginDialog(HttpServletRequest request) {

		String username = StrUtils.nullToStr(request.getParameter("username")).toUpperCase();
		String password = StrUtils.nullToStr(request.getParameter("password")).toUpperCase();
		
		try {
			CodeTableForm user1 = daoImpl.getUserById(username);

			if(user1 == null) {
				AjaxObject ajaxObject = new AjaxObject("用户不存在");
				return ajaxObject.toString();
			} else if(!password.equals(user1.getValue("password"))) {
				AjaxObject ajaxObject = new AjaxObject("密码错误");
				return ajaxObject.toString();
			} else {
				request.getSession().setAttribute(Constants.USER_INFO_SESSION, user1);
				AjaxObject ajaxObject = new AjaxObject("登录成功", "", "closeCurrent");
				
				this.saveLog(request, "登录");
				
				return ajaxObject.toString();
			}
		} catch (Exception e) {
			AjaxObject ajaxObject = new AjaxObject("其他的登录错误");
			return ajaxObject.toString();
		}
	}
	
	/**
	 * 设置首页
	 * @param request
	 */
	private void setIndex(HttpServletRequest request) {

	}
	
	/**
	 * 保存日志
	 * @param request
	 * @param logtype
	 */
	public void saveLog(HttpServletRequest request, String logtype) {
		try {
			CodeTableForm user = (CodeTableForm) request.getSession().getAttribute(Constants.USER_INFO_SESSION);
			CodeTableForm log = new CodeTableForm();
			log.setValue("logtype", logtype);
			log.setValue("operater", user.getValue("userid"));
			log.setValue("operatetime", DateUtils.getNowDateTime());
			dbUtils.setInsert(log, "slog");
		} catch(Exception e) {
			StrUtils.WriteLog(this.getClass().getName() + ".saveLog()", e);
		}
	}
}