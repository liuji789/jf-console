package com.atguigu.jf.console.user.controller;

import com.atguigu.jf.console.common.utils.VerifyCodeUtil;
import com.atguigu.jf.console.user.bean.bo.SysFuncBean;
import com.atguigu.jf.console.user.bean.pojo.SysOp;
import com.atguigu.jf.console.user.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping("logincontroller")
public class LoginController {
	
	Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private UserService userService;
	@Autowired
	private ResourceBundleMessageSource messageSoure;

	@RequestMapping("getVerifyCodeImage")
	public void getVerifyCodeImage(HttpServletResponse response,HttpSession session) throws Exception{
		//
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		
		String verifyCode = VerifyCodeUtil.generateTextCode(VerifyCodeUtil.TYPE_NUM_ONLY, 4, null);
		
		session.setAttribute("verifyCode", verifyCode);
		logger.debug("生成验证码："+verifyCode);
		
		BufferedImage image = VerifyCodeUtil.generateImageCode(verifyCode, 90, 30, 4, true, Color.WHITE, Color.BLACK, null);
		response.setContentType("image/jpeg");
		ImageIO.write(image, "JPEG", response.getOutputStream());
		
	}
	
//	@RequestMapping("login")
//	public String login(String username,String password,
//			RedirectAttributes redirectAttributes,String verifyCode,
//			HttpSession session,Locale locale)throws Exception{
//		
//		//存在session中的VerifyCode
//		String sVerifyCode = (String) session.getAttribute("verifyCode");
//		
//		if (sVerifyCode==null || !sVerifyCode.equals(verifyCode)) {
//			logger.error("验证码不正确！");
//			redirectAttributes.addFlashAttribute("errMsg", "验证码不正确！");
//			return "redirect:/login";
//		}
//		SysOp param = new SysOp();
//		param.setLoginCode(username);
//		param.setLoginPasswd(password);
//		SysOp sysOp = userService.selectSysOpByUsernameOrPwd(param);
//		if (sysOp == null) {
//			logger.error("登录时，用户名或密码不正确！");
//			String code = "error.js.user.login";
//			Object[] args = null;
//			String message = resourceBundleMessageSource.getMessage(code, args, locale);
//			redirectAttributes.addFlashAttribute("errMsg", message);
//			return "redirect:/login";
//			
//		}
//		//登录成功，session域中设置当前用户
//		session.setAttribute("currentUser", sysOp);
//		//相当于提交给另一个handler，在view-controller中直接声明
//		return "redirect:/index";
//	}
	
	/**
	 * ①：在Handler方法中添加RedirectAttributes类型的参数
	 * ②：在Handler方法中使用addFlashAttribute方法，添加key-val对
	 * ③：转发页面，要求，必经过SpringMVC映射过的
	 * 国际化：
	 * 1，SpringMVC配置国际化资源文件
	 * 2，编写国际化资源文件
	 * 3，将ResourceBundleMessageSource注入为Handler的成员变量
	 * 4，调用ResourceBundleMessageSource的getMessage方法，获取消息
	 */
	@RequestMapping("login")
	public String login(String username,String password,
			RedirectAttributes redirectAttributes,String verifyCode,
			HttpSession session,Locale locale)throws Exception{
		
		//存在session中的VerifyCode
		String sVerifyCode = (String) session.getAttribute("verifyCode");
		
		if (sVerifyCode==null || !sVerifyCode.equals(verifyCode)) {
			logger.error("验证码不正确！");
			redirectAttributes.addFlashAttribute("errMsg", "验证码不正确！");
			return "redirect:/login";
		}
		
		Subject currentUser = SecurityUtils.getSubject();
		
		if (!currentUser.isAuthenticated()) {
			//更具传入的username和password生成一个token
			UsernamePasswordToken token = new UsernamePasswordToken(username,password);
			token.setRememberMe(true);
			try {
				currentUser.login(token);
			} catch (AuthenticationException e) {
				logger.info("用户登录错误，用户名或密码错误！"+e.getMessage());
				String code = "error.js.user.login";
				Object[] args = null;
				//TODO:shiro后没有提示
				String message = messageSoure.getMessage(code, args, locale);
				redirectAttributes.addFlashAttribute("errMsg", message);
			}
		}
		session.setAttribute("currentUser", currentUser.getPrincipal());
		return "redirect:/index";
	}
	
	@RequestMapping("getMenu")
	@ResponseBody
	public List<SysFuncBean> getMenu(HttpSession session) throws Exception{
		
		SysOp sysOp = (SysOp) session.getAttribute("currentUser");
		
		if(sysOp == null){
			logger.error("session中没有可用的Sysop对象！");
			return null;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		//放入SysOp的Id！
		map.put("OpId", sysOp.getOpId());
		
		//查询要返回的json格式的数据
		List<SysFuncBean> list = userService.selectSysFuncByOpId(map);
		
		return list;
	}
	
}
