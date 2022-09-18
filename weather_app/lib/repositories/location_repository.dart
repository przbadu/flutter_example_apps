import 'dart:convert';

import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:riverpod/riverpod.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/models/models.dart';

class LocationRequestFailure implements Exception {}

class LocationNotFoundFailure implements Exception {}

class LocationRepository {
  /// Finds a [Location] `/v1/search?name={query}`
  Future<Location> getLocation(String query) async {
    final url = Uri.https(kLocationApiBaseUrl, 'v1/search', {'name': query});
    final locationResponse = await http.get(url);

    if (locationResponse.statusCode != 200) {
      throw LocationRequestFailure();
    }

    final bodyJson = jsonDecode(locationResponse.body) as Map<String, dynamic>;

    if (!bodyJson.containsKey('results')) throw LocationNotFoundFailure();

    final results = bodyJson['results'] as List;

    if (results.isEmpty) throw LocationNotFoundFailure();

    return Location.fromMap(results.first as Map<String, dynamic>);
  }
}

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  return LocationRepository();
});

final getLocationProvider =
    FutureProvider.autoDispose.family<Location, String>((ref, query) {
  final locationRepository = ref.watch(locationRepositoryProvider);
  return locationRepository.getLocation(query);
});
