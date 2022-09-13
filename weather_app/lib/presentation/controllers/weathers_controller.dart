import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/models.dart';
import 'package:weather_app/repositories/location_repository.dart';
import 'package:weather_app/repositories/repositories.dart';

class WeathersController extends StateNotifier<Weather> {
  WeathersController({
    required this.locationRepository,
    required this.weatherRepository,
  }) : super(Weather.empty());

  final LocationRepository locationRepository;
  final WeatherRepository weatherRepository;

  Future<Weather> getWeather(String query) async {
    final locationResponse = await locationRepository.getLocation(query);

    return weatherRepository.getWeather(
      latitude: locationResponse.latitude,
      longitude: locationResponse.longitude,
    );
  }
}
