package cn.jared.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import cn.jared.pojo.Admin;
import cn.jared.service.AdminService;

@Controller
@RequestMapping("")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value="findByName",method=RequestMethod.POST)
	public String findByName(@RequestParam("data")String data) {
//		System.out.println(data);
		String data2=data.substring(10, data.length()-1);
		System.out.println("前端注册用户名："+data2);
		Admin info=adminService.findByName(data2);
		return JSONObject.toJSONString(info);
	}
	@RequestMapping(value = "/register")
    public String register(Admin admin, HttpSession session) {
        adminService.insert(admin);
        session.setAttribute("name", admin.getA_name());
        return "view/page";
    }
	@RequestMapping("/page")
	public String page() {
		return "view/page";
	}
	@RequestMapping("/outLogin")
	public String outLogin(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	@RequestMapping("/login")
	public String login(@RequestParam String a_name,@RequestParam String a_password,Model model,HttpSession session) {
		Admin admin=adminService.login(a_name);
		if(admin!=null) {
			if(admin.getA_password().equals(a_password)) {
				session.setAttribute("name", admin.getA_name());
				return "view/page";
			}else {
				model.addAttribute("message","用户名或密码错误！");
				return "view/login/info";
			}
		}else {
			 model.addAttribute("message", "登录失败");
	         return "view/login/info";
		}
	}
}
