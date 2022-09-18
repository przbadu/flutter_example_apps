class Weather {
  Weather({
    required this.temperature,
    required this.weatherCode,
  });

  final int temperature;
  final int weatherCode;

  Map<String, dynamic> toMap() {
    return {
      'temperature': temperature,
      'weathercode': weatherCode,
    };
  }

  factory Weather.empty() => Weather(temperature: 0, weatherCode: 0);

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      temperature: map['temperature']?.floor() ?? 0.0,
      weatherCode: map['weathercode']?.floor() ?? 0,
    );
  }

  String weatherCodeToName() {
    switch (weatherCode) {
      case 0:
        return 'Clear Sky';
      case 1:
      case 2:
      case 3:
        return 'Partial Cloud';
      case 45:
      case 48:
        return 'fog';
      case 51:
      case 53:
      case 55:
        return 'Drizzle Light';
      case 56:
      case 57:
        return 'Freezing Drizzle';
      case 61:
      case 63:
      case 65:
        return 'Rain';
      case 66:
      case 67:
        return 'Freezing Rain';
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return 'Snowfall';
      case 80:
      case 81:
      case 82:
        return 'Rain Showers';
      case 95:
        return 'Thunderstrom';
      case 96:
      case 99:
        return 'Thunderstrom Rain';
      default:
        return 'Slear Sky';
    }
  }
}
