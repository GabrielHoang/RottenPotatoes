package com.hawwaru.controller;

import com.hawwaru.entities.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.logging.Logger;

@Controller
@RequestMapping("user")
public class UserController {

    Logger logger = Logger.getLogger(getClass().getName());

    @RequestMapping("/signup")
    public String signup(Model theModel) {
        User theUser = new User();
        theModel.addAttribute("user", theUser);
        return "signup_form";
    }

    @RequestMapping("/processForm")
    public String processForm(@ModelAttribute("user") User theUser, BindingResult result) {
        if(result.hasErrors()) {
            return "error";
        }
        return "signup_confirmation";
    }
}
