package com.green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InforMationController {
    @GetMapping("/information")
    public String getInforMation() {
        return "information";
    }
}
