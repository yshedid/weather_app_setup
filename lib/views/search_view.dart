
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/models/city_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Look for a City!"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
            child: TextFormField(
              onFieldSubmitted: (value) async {
                  CityModel cityModel = await WeatherService().getForecast(cityName: value);
                  log(cityModel.cityName);
                  Navigator.pop(context);

              },
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  label: Text("Search"),
                  hintText: "Enter City Name",
                  border: OutlineInputBorder(),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
