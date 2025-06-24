package com.exemple.monprojet.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.exemple.monprojet.model.Lot;
import com.exemple.monprojet.service.LotService;

@Controller
@RequestMapping("/lots")
public class LotController {

    private final LotService service;

    public LotController(LotService service) {
        this.service = service;
    }

    @GetMapping("/form")
    public String showForm() {
        return "lot_form";
    }

    @PostMapping("/save")
    public String saveLot(@ModelAttribute Lot lot) {
        service.save(lot);
        return "redirect:/lots/list";
    }

    @GetMapping("/list")
    public String listLots(Model model) {
        List<Lot> lots = service.findAll();
        model.addAttribute("lots", lots);
        return "lot_list";
    }
}