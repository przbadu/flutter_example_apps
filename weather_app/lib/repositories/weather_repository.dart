import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/models/models.dart';

class WeatherRequestFailure implements Exception {}

class WeatherNotFoundFailure implements Exception {}

class WeatherRepository {
  /// Find and Returns a [Weather] `/v1/forecast?latitude={latitude}&longitude={longitude}&current_weather=true
  Future<Weather> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final url = Uri.https(kWeatherApiBaseUrl, 'v1/forecast', {
      'latitude': latitude,
      'longitude': longitude,
      'current_weather': true,
    });

    final locationResponse = await http.get(url);

    if (locationResponse.statusCode != 200) throw WeatherRequestFailure();

    final bodyJson = jsonDecode(locationResponse.body) as Map<String, dynamic>;

    if (!bodyJson.containsKey('current_weather')) {
      throw WeatherNotFoundFailure();
    }

    final weatherJson = bodyJson['current_weather'] as Map<String, dynamic>;

    return Weather.fromMap(weatherJson);
  }
}

final weatherProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepository();
});

final getWeatherFutureProvider =
    FutureProvider.autoDispose.family<Weather, Location>((ref, location) async {
  final weatherRepository = ref.watch(weatherProvider);
  return weatherRepository.getWeather(
    latitude: location.latitude,
    longitude: location.longitude,
  );
});
