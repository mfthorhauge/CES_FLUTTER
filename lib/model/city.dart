class City {
  final int id;
  final String name;
  final String displayName;

  City({required this.id, required this.name, required this.displayName});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['Id'],
      name: json['Name'],
      displayName: json['DisplayName'],
    );
  }
}
