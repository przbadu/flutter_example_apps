import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/repositories/repositories.dart';
import 'package:weather_app/extensions/string_parameterized_x.dart';

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
        backgroundColor: Colors.redAccent.shade200,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.location_on),
            const SizedBox(width: 20),
            Flexible(
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: searchController,
                decoration: const InputDecoration.collapsed(
                  // border: OutlineInputBorder(),
                  hintText: 'Enter a location name',
                  hintStyle: TextStyle(color: Colors.white),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/${weatherProvider.weatherCodeToName().parameterized()}.png",
            ),
            const SizedBox(height: 20),
            Text(weatherProvider.weatherCodeToName()),
            const SizedBox(height: 20),
            Text(
              "${weatherProvider.temperature}°",
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
