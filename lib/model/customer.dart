class Customer {
  final String name;
  final String email;
  final String address;
  final String postcode;
  final String city;
  final String cardHolder;
  final int creditCard;
  final int ccv;
  final DateTime expirationDate;

  Customer(this.name, this.email, this.address, this.postcode, this.city,
      this.cardHolder, this.creditCard, this.ccv, this.expirationDate);
}