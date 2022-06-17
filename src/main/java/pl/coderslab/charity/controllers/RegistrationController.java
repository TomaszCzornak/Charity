package pl.coderslab.charity.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.IUserService;
import pl.coderslab.charity.service.OnRegistrationCompleteEvent;
import pl.coderslab.charity.web.error.UserAlreadyExistException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

public class RegistrationController {

    @Autowired
    ApplicationEventPublisher eventPublisher;

    @Autowired
    private IUserService userService;

    @PostMapping("/user/registration")
    public ModelAndView registerUserAccount(
            @ModelAttribute("user") @Valid User user,
            HttpServletRequest request, Errors errors) {

        try {
            User registered = userService.registerNewUserAccount(user);

            String appUrl = request.getContextPath();
            eventPublisher.publishEvent(new OnRegistrationCompleteEvent(registered,
                    request.getLocale(), appUrl));
        } catch (UserAlreadyExistException uaeEx) {
            ModelAndView mav = new ModelAndView("registration", "user", user);
            mav.addObject("message", "An account for that username/email already exists.");
            return mav;
        } catch (RuntimeException ex) {
            return new ModelAndView("emailError", "user", user);
        }

        return new ModelAndView("successRegister", "user", user);
    }
}
