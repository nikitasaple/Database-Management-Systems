package com.nikita.project;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.nikita.project.pojo.Manager;
import com.nikita.project.pojo.Person;
import com.nikita.project.pojo.User;

import org.springframework.validation.ValidationUtils;

public class UserValidator implements Validator {

    public boolean supports(Class aClass)
    {
        return aClass.equals(Person.class);
    }

    public void validate(Object obj, Errors errors)
    {
        Person user = (Person) obj;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "error.invalid.user", "First Name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "error.invalid.user", "Last Name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "error.invalid.phone", "Phone Number Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "error.invalid.user", "User Name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "error.invalid.password", "Password Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "error.invalid.email", "Email Required");
    }
}
