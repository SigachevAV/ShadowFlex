package com.shadowflex.DBFiller.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ControllerExceptionHandler {
    @ExceptionHandler(NotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public ModelAndView handleNotFoundException(RuntimeException ex) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("msg", ex.getMessage());
        modelAndView.setViewName("errors/notfound");
        return modelAndView;
    }
}
