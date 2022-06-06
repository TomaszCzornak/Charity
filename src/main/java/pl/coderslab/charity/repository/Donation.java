package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface Donation extends JpaRepository<Donation, Long> {

    List<Donation>findAllBy();

}
