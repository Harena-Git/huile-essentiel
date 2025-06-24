package com.exemple.monprojet.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.exemple.monprojet.model.Personne;
import com.exemple.monprojet.service.PersonneService;

@Controller
@RequestMapping("/personnes")
public class PersonneController {

    private final PersonneService service;

    public PersonneController(PersonneService service) {
        this.service = service;
    }

    @GetMapping("/form")
    public String showForm() {
        return "personne_form";
    }

    @PostMapping("/save")
    public String savePersonne(@ModelAttribute Personne personne) {
        service.save(personne);
        return "redirect:/personnes/list";
    }

    @GetMapping("/list")
    public String listPersonnes(Model model) {
        List<Personne> personnes = service.findAll();
        model.addAttribute("personnes", personnes);
        return "personne_list";
    }
}