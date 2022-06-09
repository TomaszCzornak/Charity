package pl.coderslab.charity.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.repository.DonationRepo;

import java.util.List;
@Controller
public class HomeController {

    private final DonationRepo donationRepo;

    @Autowired
    public HomeController(DonationRepo donationRepo) {
        this.donationRepo = donationRepo;
    }


    @RequestMapping("/")
    public String homeAction(Model model){
        List<Donation> donationRepoList = donationRepo.findAll();
        Long numberOfBags = donationRepo.findNumberOfBags();
        model.addAttribute("bagsCount", donationRepoList);
        model.addAttribute("numberOfBags", numberOfBags);
        return "index";
    }


}
