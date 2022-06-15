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
import javax.servlet.http.HttpSession;
import java.util.List;

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
        model.addAttribute("categories", categoryRepo.findAll());
        model.addAttribute("donation", new Donation());
        return "form";
    }

    @PostMapping("/form")
    public String donationInForm(HttpServletRequest request, @ModelAttribute("donation") Donation donation){
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("donation", donation);
        return "redirect:/summary";
    }

    @GetMapping("/summary")
    public String summingUp(HttpServletRequest request, Model model){
        HttpSession httpSession = request.getSession();
        model.addAttribute("summary", httpSession.getAttribute("donation"));
        return "summary";
    }
    @PostMapping("/summary")
    public String saveSumming(HttpServletRequest request){
        HttpSession httpSession = request.getSession();
        Donation donation = (Donation) httpSession.getAttribute("donation");
        donationRepo.save(donation);
        return "form-confirmation";
    }


    @ModelAttribute("categories")
    public List<Category> findAll(){
        return categoryRepo.findAll();
    }
}
