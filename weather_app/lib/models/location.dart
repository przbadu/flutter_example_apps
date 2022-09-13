class Location {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final String country;

  Location({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    this.country = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'country': country,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      country: map['country'] ?? '',
    );
  }
}
