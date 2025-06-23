package com.exemple.monprojet.controller;

import com.exemple.monprojet.model.User;
import com.exemple.monprojet.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {

    private final UserService service;

    public UserController(UserService service) {
        this.service = service;
    }

    @GetMapping("/form")
    public String showForm() {
        return "form";
    }

    @PostMapping("/save")
    public String saveUser(@ModelAttribute User user) {
        service.save(user);
        return "redirect:/users/list";
    }

    @GetMapping("/list")
    public String listUsers(Model model) {
        List<User> users = service.findAll();
        model.addAttribute("users", users);
        return "list";
    }
}
