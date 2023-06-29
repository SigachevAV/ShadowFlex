package com.shadowflex.Server.controller;

import com.shadowflex.Server.dto.AdeptDTO;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/adepts")
public class AdeptsController {
    @GetMapping("/{id}")
    public AdeptDTO getById(@PathVariable Long id, @RequestParam("lang") String langParam) {
        return null;
    }
}
