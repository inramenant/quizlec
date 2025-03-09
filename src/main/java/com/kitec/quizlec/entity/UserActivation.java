    package com.kitec.quizlec.entity;

    import jakarta.persistence.*;
    import lombok.AllArgsConstructor;
    import lombok.Getter;
    import lombok.NoArgsConstructor;
    import lombok.Setter;

    import java.util.UUID;

    @Entity
    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Table(name = "user_activation", schema = "public", catalog = "kiteclearn")
    public class UserActivation {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "id", nullable = false)
        private Long id;

        @Lob
        @Column(columnDefinition = "TEXT", name = "uuid", nullable = false)
        private String uuid;

        @OneToOne
        @JoinColumn(name = "user_id", nullable = false)
        private User user;

        @Column(name = "activated")
        private Boolean activated;

        @PrePersist
        protected void onCreate() {
            if (activated == null) activated = Boolean.FALSE;
            if (uuid == null) uuid = UUID.randomUUID().toString();
        }

        public UserActivation(User user){
            this.user = user;
            this.uuid = UUID.randomUUID().toString();
            this.activated = Boolean.FALSE;
        }
    }
