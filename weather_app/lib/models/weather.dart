class Weather {
  Weather({
    required this.temperature,
    required this.weatherCode,
  });

  final double temperature;
  final double weatherCode;

  Map<String, dynamic> toMap() {
    return {
      'temperature': temperature,
      'weatherCode': weatherCode,
    };
  }

  factory Weather.empty() => Weather(temperature: 0.0, weatherCode: 0);

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      temperature: map['temperature']?.toDouble() ?? 0.0,
      weatherCode: map['weatherCode']?.toDouble() ?? 0.0,
    );
  }
}
