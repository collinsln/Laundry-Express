package com.LaundryUsers.Laundry.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "profile")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Profile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long profileId;

    @OneToOne
    @JoinColumn(name = "userid") // matching the column name in the 'profile' table.
    private User user;

    private String firstName;
    private String lastName;
    private String dateOfBirth;
    private String gender;
    private String address;
    private String city;
    private String profilePictureURL;
    private String bio;
}
