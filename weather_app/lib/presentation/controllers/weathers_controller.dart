import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/models.dart';
import 'package:weather_app/repositories/repositories.dart';

class WeathersController extends StateNotifier<AsyncValue<Weather>> {
  WeathersController() : super(AsyncValue.data(Weather.empty()));

  final locationRepository = LocationRepository();
  final weatherRepository = WeatherRepository();

  Future<void> getWeather(String query) async {
    // loading state
    state = const AsyncValue.loading();

    final locationResponse = await locationRepository.getLocation(query);

    try {
      final result = await weatherRepository.getWeather(
        latitude: locationResponse.latitude,
        longitude: locationResponse.longitude,
      );

      state = AsyncValue.data(result);
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }
}

final weathersControllerProvider =
    StateNotifierProvider<WeathersController, AsyncValue<Weather>>((ref) {
  return WeathersController();
});
