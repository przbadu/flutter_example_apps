import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/extensions/string_parameterized_x.dart';
import 'package:weather_app/presentation/controllers/weathers_controller.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weathersController = ref.watch(weathersControllerProvider);

    // search location, find lat and lng, and get current weather
    void search(String location) async {
      await ref.read(weathersControllerProvider.notifier).getWeather(location);
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
                onSubmitted: search,
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
              onPressed: () => search(searchController.text),
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
      body: Center(
          child: weathersController.when(
        data: (weather) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/${weather.weatherCodeToName().parameterized()}.png",
            ),
            const SizedBox(height: 20),
            Text(weather.weatherCodeToName()),
            const SizedBox(height: 20),
            Text(
              "${weather.temperature}°",
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
        error: (e, st) => Text(e.toString()),
        loading: () => const CircularProgressIndicator(),
      )),
    );
  }
}
