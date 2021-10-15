class Order {
  final String employee;
  final String customer;
  final String origin;
  final String destination;
  final int duration;
  final int cost;
  final String status;

  Order(
      {required this.customer,
      required this.origin,
      required this.destination,
      required this.duration,
      required this.cost,
      required this.status,
      required this.employee});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      origin: json['CityFrom'],
      destination: json['CityTo'],
      duration: json['Duration'],
      cost: json['Cost'],
      status: '',
      employee: '',
      customer: json['CustomerId'],
    );
  }
}
