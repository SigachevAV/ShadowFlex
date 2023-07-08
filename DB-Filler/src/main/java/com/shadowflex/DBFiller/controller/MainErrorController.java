package com.shadowflex.DBFiller.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainErrorController implements ErrorController {
    @GetMapping("error")
    public String handleError(Model model, HttpServletRequest request) {
        Object code = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        model.addAttribute("code", (code != null) ? Integer.parseInt(code.toString()) : 1804);
        return "errors/common";
    }
}
