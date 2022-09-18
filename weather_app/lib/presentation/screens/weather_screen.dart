import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/repositories/repositories.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = ref.watch(weatherRepositoryProvider);

    void submit(String location) async {
      final locationRepository = ref.read(locationRepositoryProvider);
      final weatherRepository = ref.read(weatherRepositoryProvider.notifier);

      try {
        final locationResponse = await locationRepository.getLocation(location);

        await weatherRepository.getWeather(
          latitude: locationResponse.latitude,
          longitude: locationResponse.longitude,
        );
        print('triggered...');
      } catch (e) {
        print('Error: ${e.toString()}');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.location_on),
            const SizedBox(width: 20),
            Flexible(
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration.collapsed(
                  // border: OutlineInputBorder(),
                  hintText: 'Enter a location name',
                ),
                onSubmitted: submit,
              ),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {
                searchController.clear();
              },
              icon: const Icon(Icons.clear),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () => submit(searchController.text),
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            const Text('Weather Info:'),
            Text(weatherProvider.temperature.toString())
          ],
        ),
      ),
    );
  }
}
