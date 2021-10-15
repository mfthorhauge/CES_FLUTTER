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
  String? expirationDate;

  Customer(
      {required this.id,
      required this.name,
      required this.email,
      required this.address,
      required this.postcode,
      required this.city,
      this.cardHolder,
      this.creditCard,
      this.ccv,
      this.expirationDate});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
        id: json['PersonId'],
        name: json['Name'],
        email: json['Mail'],
        address: json['Address'],
        city: json['City'],
        postcode: json['PostCode'],
        cardHolder: json['CardHolder'],
        creditCard: json['CreditCard'],
        ccv: json['Ccv'],
        expirationDate: json['DateTime']);
  }
}
