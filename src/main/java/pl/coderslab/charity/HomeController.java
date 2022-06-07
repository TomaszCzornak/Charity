package pl.coderslab.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.repository.Donation;

import java.util.List;
@Component
@Controller
public class HomeController {

    private final Donation donationRepo;
    public HomeController(Donation donationRepo) {
        this.donationRepo = donationRepo;
    }


    @RequestMapping("/")
    public String homeAction(Model model){
        List<Donation> donationList = donationRepo.findAllBy();
        model.addAttribute("bagsCount", donationList);
        return "index";
    }


}
