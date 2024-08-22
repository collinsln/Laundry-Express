package com.LaundryUsers.Laundry.services;

import com.LaundryUsers.Laundry.model.Profile;
import com.LaundryUsers.Laundry.repository.ProfileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProfileServices {

    private final ProfileRepository profileRepository;

    @Autowired
    public ProfileServices(ProfileRepository profileRepository) {
        this.profileRepository = profileRepository;
    }

    public Profile addProfile(Profile profile) {
        return profileRepository.save(profile);
    }
}
