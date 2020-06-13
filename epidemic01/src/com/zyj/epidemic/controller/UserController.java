package com.zyj.epidemic.controller;

import com.zyj.epidemic.beans.UserInfo;
import com.zyj.epidemic.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/user")
public class UserController {

    public static Logger loggeer = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(UserInfo userInfo, Model model, HttpSession session) {
        loggeer.debug("login()方法 account=" + userInfo.getAccount() + ",password:" + userInfo.getPassword());
        UserInfo user = this.userService.findByAccount(userInfo.getAccount());
        if (user == null) {
            model.addAttribute("msg", "账号不正确！");
            return "login";
        }
        if (user.getPassword().equals(userInfo.getPassword())) {
            session.setAttribute("loginedUser",user);
            return "redirect:/main.jsp";
        }
        model.addAttribute("msg", "密码不正确！");
        return "login";
    }
}
