class Weather {
  Weather({
    required this.temperature,
    required this.weatherCode,
  });

  final double temperature;
  final int weatherCode;

  Map<String, dynamic> toMap() {
    return {
      'temperature': temperature,
      'weathercode': weatherCode,
    };
  }

  factory Weather.empty() => Weather(temperature: 0.0, weatherCode: 0);

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      temperature: map['temperature']?.toDouble() ?? 0.0,
      weatherCode: map['weathercode']?.floor() ?? 0,
    );
  }

  String getWeatherIcon() {
    String iconName = '';
    switch (weatherCode) {
      case 0:
        iconName = 'clear-sky.png';
        break;
      case 1:
      case 2:
      case 3:
        iconName = 'partial-cloud.png';
        break;
      case 45:
      case 48:
        iconName = 'fog.png';
        break;
      case 51:
      case 53:
      case 55:
        iconName = 'drizzle-light.png';
        break;
      case 56:
      case 57:
        iconName = 'freezing-drizzle.png';
        break;
      case 61:
      case 63:
      case 65:
        iconName = 'rain.png';
        break;
      case 66:
      case 67:
        iconName = 'freezing-rain.png';
        break;
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        iconName = 'snowfall.png';
        break;
      case 80:
      case 81:
      case 82:
        iconName = 'rain-showers.png';
        break;
      case 95:
        iconName = 'thunderstrom.png';
        break;
      case 96:
      case 99:
        iconName = 'thunderstrom-rain.png';
        break;
      default:
        iconName = 'clear-sky.png';
        break;
    }

    return '/assets/$iconName';
  }
}
