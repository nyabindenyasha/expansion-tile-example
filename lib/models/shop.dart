class Shops {

    int id;
    String name;
    String description;
    String logoUrl;

    int addressId;
    int contactId;
    Address address;
    Contact contact;

}

class Contact {
    int id;
    String areaCode;
    String serviceProviderCode;
    String lineNumber;
}

class Address {
    int id;
    String street;
    String city;
    String province;
}
