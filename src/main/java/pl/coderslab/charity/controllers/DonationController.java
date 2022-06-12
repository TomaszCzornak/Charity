package pl.coderslab.charity.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.charity.repository.DonationRepo;
import pl.coderslab.charity.repository.InstitutionRepo;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DonationController {

    private final DonationRepo donationRepo;
    private final InstitutionRepo institutionRepo;

    public DonationController(DonationRepo donationRepo, InstitutionRepo institutionRepo) {
        this.donationRepo = donationRepo;
        this.institutionRepo = institutionRepo;
    }


    @GetMapping("/form")
    public String donationForm(Model model){
        model.addAttribute("listOfInst", institutionRepo.findAll());
        return "form";
    }

    @ResponseBody
    @PostMapping("/form")
    public String[] donationInForm(HttpServletRequest request){
        String [] categoryToDonate = request.getParameterValues("categories");
        Integer numberOfBags = Integer.parseInt(request.getParameter("bags"));

        return categoryToDonate;
    }
}
