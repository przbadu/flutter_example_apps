import 'package:flutter_dotenv/flutter_dotenv.dart';

final kWeatherApiKey = dotenv.env['OPENWEATHER_API_KEY'];
const kWeatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';
