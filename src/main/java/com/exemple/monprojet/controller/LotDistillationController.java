package com.exemple.monprojet.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.exemple.monprojet.model.LotDistillation;
import com.exemple.monprojet.service.LotDistillationService;

@Controller
@RequestMapping("/lot-distillations")
public class LotDistillationController {

    private final LotDistillationService service;

    public LotDistillationController(LotDistillationService service) {
        this.service = service;
    }

    @GetMapping("/form")
    public String showForm() {
        return "lot_distillation_form";
    }

    @PostMapping("/save")
    public String saveLotDistillation(@ModelAttribute LotDistillation lotDistillation) {
        service.save(lotDistillation);
        return "redirect:/lot-distillations/list";
    }

    @GetMapping("/list")
    public String listLotDistillations(Model model) {
        List<LotDistillation> lotDistillations = service.findAll();
        model.addAttribute("lotDistillations", lotDistillations);
        return "lot_distillation_list";
    }
}