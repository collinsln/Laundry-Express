package com.LaundryUsers.Laundry.controller;

import com.LaundryUsers.Laundry.model.Profile;
import com.LaundryUsers.Laundry.services.ProfileServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/profile")
public class ProfileController {

    private final ProfileServices profileServices;

    @Autowired
    public ProfileController(ProfileServices profileServices) {
        this.profileServices = profileServices;
    }

    @PostMapping("/add")
    public ResponseEntity<Profile> addProfile(@RequestBody Profile profile) {
        Profile newProfile = profileServices.addProfile(profile);
        return ResponseEntity.ok(newProfile);
    }
}
