class Order {
  final String employee;
  final String customer;
  final String origin;
  final String destination;
  final int duration;
  final int cost;
  final String status;

  Order(this.customer, this.origin, this.destination, this.duration, this.cost,
      this.status, this.employee);
}
