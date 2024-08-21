package com.LaundryUsers.Laundry.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "users")
@Data
@NoArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userID;

    private String userType;
    private String username;
    private String email;
    private String passwordHash;
    private String phoneNumber;
    private LocalDateTime dateRegistered;
    private LocalDateTime lastLogin;
    private String status;

    // Additional methods (e.g., constructors) if needed
}
