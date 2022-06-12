package pl.coderslab.charity.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.repository.CategoryRepo;
import pl.coderslab.charity.repository.DonationRepo;
import pl.coderslab.charity.repository.InstitutionRepo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class DonationController {

    private final DonationRepo donationRepo;
    private final InstitutionRepo institutionRepo;
    private final CategoryRepo categoryRepo;

    public DonationController(DonationRepo donationRepo, InstitutionRepo institutionRepo, CategoryRepo categoryRepo) {
        this.donationRepo = donationRepo;
        this.institutionRepo = institutionRepo;
        this.categoryRepo = categoryRepo;
    }


    @GetMapping("/form")
    public String donationForm(Model model){
        model.addAttribute("listOfInst", institutionRepo.findAll());
        model.addAttribute("categories", donationRepo.findAll());
        return "form";
    }

    @ResponseBody
    @PostMapping("/form")
    public String[] donationInForm(HttpServletRequest request, @ModelAttribute("donation") Donation donation){
        String [] categoryToDonate = request.getParameterValues("categories");
//        Integer numberOfBags = request.getParameter("bags");
        donationRepo.save(donation);
        return categoryToDonate;
    }
    @ModelAttribute("categories")
    public List<Category> findAll(){
        return categoryRepo.findAll();
    }
}
