import 'dart:convert';

import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:riverpod/riverpod.dart';

import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/models/models.dart';

class WeatherRequestFailure implements Exception {}

class WeatherNotFoundFailure implements Exception {}

class WeatherRepository extends StateNotifier<Weather> {
  WeatherRepository() : super(Weather.empty());

  /// Find and Returns a [Weather] `/v1/forecast?latitude={latitude}&longitude={longitude}&current_weather=true
  Future<Weather> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final url = Uri.https(kWeatherApiBaseUrl, '/v1/forecast', {
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'current_weather': true.toString(),
    });

    final locationResponse = await http.get(url);

    if (locationResponse.statusCode != 200) throw WeatherRequestFailure();

    final bodyJson = jsonDecode(locationResponse.body) as Map<String, dynamic>;

    if (!bodyJson.containsKey('current_weather')) {
      throw WeatherNotFoundFailure();
    }

    final weatherJson = bodyJson['current_weather'] as Map<String, dynamic>;

    return state = Weather.fromMap(weatherJson);
  }
}

final weatherRepositoryProvider =
    StateNotifierProvider<WeatherRepository, Weather>((ref) {
  return WeatherRepository();
});
