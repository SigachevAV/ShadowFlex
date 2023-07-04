package com.shadowflex.Server.util;

import com.shadowflex.Server.exception.InvalidLanguageException;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class LanguageConverter implements Converter<String, Language> {
    @Override
    public Language convert(String source) {
        try {
            return Language.valueOf(source);
        } catch (IllegalArgumentException e) {
            throw new InvalidLanguageException("Invalid language " + source);
        }
    }
}
