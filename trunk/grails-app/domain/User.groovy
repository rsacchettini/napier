class User {

    String surname
    String forename
    String username
    String password
    String email
    String telephoneNumber

    //This string will be returned by default in lists views when the selection of an User is required.
    String toString() {
        return myForename + " " + mySurname
    }

}
