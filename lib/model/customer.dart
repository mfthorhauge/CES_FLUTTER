class Customer {
  int id;
  String name;
  String email;
  String address;
  String postcode;
  String city;
  String? cardHolder;
  int? creditCard;
  int? ccv;
  DateTime? expirationDate;

  Customer(
      this.id, this.name, this.email, this.address, this.postcode, this.city,
      {this.cardHolder, this.creditCard, this.ccv, this.expirationDate});
}
