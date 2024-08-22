package com.LaundryUsers.Laundry.repository;
import com.LaundryUsers.Laundry.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

    public interface UserRepository extends JpaRepository<User, Long> {

    }

