import 'package:weather_app/repositories/repositories.dart';

class WeathersController {
  WeathersController();

  final locationRepository = LocationRepository();
  final weatherRepository = WeatherRepository();

  Future<void> getWeather(String query) async {
    final locationResponse = await locationRepository.getLocation(query);

    try {
      await weatherRepository.getWeather(
        latitude: locationResponse.latitude,
        longitude: locationResponse.longitude,
      );
    } catch (e) {
      print('Weather error');
    }
  }
}
