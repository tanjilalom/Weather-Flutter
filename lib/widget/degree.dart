import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/weather_service.dart';

class degree extends StatelessWidget {
  const degree({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherService weatherService = Get.put(WeatherService());
    weatherService.getWeather();

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Obx(() => Text(
              weatherService.dataResponse.isEmpty
                  ? ""
                  : "${weatherService.temp1.value.toStringAsFixed(0)}°",
              style: TextStyle(
                fontSize: 150,
                fontWeight: FontWeight.bold,
              ),
            )),
        Opacity(
          opacity: 0.9,
          child: Padding(
            padding: EdgeInsets.only(left: 70, top: 90),
            child: Image(
              height: 150,
              width: 300,
              image: AssetImage(
                  'assets/weather/${weatherService.dataResponse.value['weather'][0]['icon']}.png'),
            ),
          ),
        ),
      ],
    );
  }
}
