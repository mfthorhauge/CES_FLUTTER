class RouteSuggestion {
  final String origin;
  final String destination;
  final double duration;
  final double cost;

  RouteSuggestion(
      {required this.origin,
      required this.destination,
      required this.duration,
      required this.cost});

  factory RouteSuggestion.fromJson(Map<String, dynamic> json) {
    return RouteSuggestion(
      origin: json['CityFrom'],
      destination: json['CityTo'],
      duration: json['Cost'],
      cost: json['Time'],
    );
  }
}
