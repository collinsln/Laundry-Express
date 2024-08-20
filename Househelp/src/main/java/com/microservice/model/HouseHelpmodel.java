@Entity
@Table(name = "HouseHelpDetails")
public class HouseHelp {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userId;

    @Enumerated(EnumType.STRING)
    private UserType userType;

    private String username;
    private String email;
    private String passwordHash;
    private String phoneNumber;
    private LocalDateTime dateRegistered;
    private LocalDateTime lastLogin;
    private String status;

    // Getters, setters, constructors
}