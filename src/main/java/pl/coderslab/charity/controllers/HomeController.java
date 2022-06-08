package pl.coderslab.charity.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
//        List<DonationRepo> donationRepoList = donationRepo.findAllBy();
//        model.addAttribute("bagsCount", donationRepoList);
        return "index";
    }


}
