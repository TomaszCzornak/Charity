package pl.coderslab.charity.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.CategoryRepo;
import pl.coderslab.charity.repository.DonationRepo;
import pl.coderslab.charity.repository.InstitutionRepo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalTime;

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
        return "form";
    }

    @PostMapping("/form")
    public String donationInForm(HttpServletRequest request, Model model){
        HttpSession httpSession = request.getSession();

        Category category = new Category();
        category.setName(request.getParameter("categories"));
        httpSession.setAttribute("category", category);

        Integer numberOfBags = Integer.parseInt(request.getParameter("bags"));
        httpSession.setAttribute("numberOfBags", numberOfBags);

        Institution institution = new Institution();
        institution.setName(request.getParameter("organization"));
        institution.setDescription(request.getParameter("organization"));
        httpSession.setAttribute("organization", institution);

        String street = request.getParameter("address");
        httpSession.setAttribute("address", street);

        String city = request.getParameter("city");
        httpSession.setAttribute("city", city);

        String zipCode = request.getParameter("postcode");
        httpSession.setAttribute("zipCode", zipCode);

        String phone = request.getParameter("phone");
        httpSession.setAttribute("phone", phone);

        String data = request.getParameter("data");
        httpSession.setAttribute("data", data);

        String time = request.getParameter("time");
        httpSession.setAttribute("time", time);

        String shippingInfo = request.getParameter("more_info");
        httpSession.setAttribute("more_info", shippingInfo);


        Donation donation = new Donation();
        donation.setCategory(category);
        donation.setQuantity((Integer) httpSession.getAttribute("numberOfBags"));
        donation.setInstitution(institution);
        donation.setStreet((String) httpSession.getAttribute("address"));
        donation.setCity((String) httpSession.getAttribute("city"));
        donation.setZipCode((String) httpSession.getAttribute("zipCode"));
        donation.setPhoneNumber((String) httpSession.getAttribute("phone"));
        donation.setPickUpDate(LocalDate.parse((String) httpSession.getAttribute("data")));
        LocalTime lt = LocalTime.parse(time);
        donation.setPickUpTime(lt);
        donation.setPickUpComment((String) httpSession.getAttribute("more_info"));

        donationRepo.save(donation);

        model.addAttribute("summing", donation);

        return "form-confirmation";
    }

}
