package com.LaundryUsers.Laundry.repository;


import com.LaundryUsers.Laundry.model.Profile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProfileRepository extends JpaRepository<Profile, Long> {

}
