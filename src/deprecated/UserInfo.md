
    @Enumerated(EnumType.STRING)
    @Column(name = "gender")
    Gender gender;

    public static enum Gender {
        MALE,
        FEMALE,
        ;
        public static boolean exists(String gender) {
            for (Gender g : Gender.values())
                if (g.toString().equalsIgnoreCase(gender))
                    return true;
            return false;
        }

        public static UserInfo.Gender customizedValueOf(Object gender) {
            if (Objects.isNull(gender)) return null;
            for (Gender g : Gender.values())
                if (g.toString().equalsIgnoreCase(gender.toString()))
                    return g;
            return null;
        }
    }