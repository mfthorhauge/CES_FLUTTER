class Customer {
  final int id;
  final String name;
  final String email;
  final String address;
  final String postcode;
  final String city;
  String? cardHolder;
  int? creditCard;
  int? ccv;
  DateTime? expirationDate;

  Customer(
      this.id, this.name, this.email, this.address, this.postcode, this.city,
      {this.cardHolder, this.creditCard, this.ccv, this.expirationDate});
}