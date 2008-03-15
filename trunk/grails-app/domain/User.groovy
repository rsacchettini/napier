class User {

    String mySurname
    String myForename
    String myUsername
    String myPassword
    String myEmail
    String myTelephoneNo

    //This string will be returned by default in lists views when the selection of an User is required.
    String toString() {
        return myForename + " " + mySurname
    }

}
