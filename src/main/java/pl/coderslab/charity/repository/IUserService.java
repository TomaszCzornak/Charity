package pl.coderslab.charity.repository;

import pl.coderslab.charity.model.User;
import pl.coderslab.charity.model.VerificationToken;

public interface IUserService {
    User registerNewUserAccount(User user);


    User getUser(String verificationToken);

    void saveRegisteredUser(User user);

    void createVerificationToken(User user, String token);

    VerificationToken getVerificationToken(String VerificationToken);
}
