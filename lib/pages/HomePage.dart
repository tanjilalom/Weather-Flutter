import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_flutter/pages/Splash-Screen.dart';
import 'package:weather_flutter/service/weather_service.dart';
import '../widget/degree.dart';
import '../widget/weather_card.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherService weatherService = Get.put(WeatherService());
    weatherService.getWeather();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: Align(
          alignment: Alignment.topCenter,
          child: Obx(
            () => weatherService.dataResponse.value.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Obx(() => Text(
                              weatherService.dataResponse.value['name'] ??
                                  'Loading data.....',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )),
                        degree(),
                        Obx(() => Text(
                              weatherService.dataResponse.isEmpty
                                  ? "Loading data....."
                                  : weatherService.dataResponse
                                      .value['weather'][0]['description']
                                      .toUpperCase(),
                              style: TextStyle(fontSize: 20),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: weather_card(
                                weatherService: weatherService,
                                image: 'assets/icons/wind.png',
                                title: 'Wind Speed',
                                value: weatherService.speed1.value
                                        .toStringAsFixed(0) +
                                    " Km/h",
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: weather_card(
                                weatherService: weatherService,
                                image: 'assets/icons/humidity.png',
                                title: 'Humidity',
                                value: weatherService
                                        .dataResponse.value['main']['humidity']
                                        .toString() +
                                    "%",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: weather_card(
                                weatherService: weatherService,
                                image: 'assets/icons/pressure.png',
                                title: 'Pressure',
                                value: weatherService
                                        .dataResponse.value['main']['pressure']
                                        .toString() +
                                    " hPa",
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: weather_card(
                                weatherService: weatherService,
                                image: 'assets/icons/visibility.png',
                                title: 'Visibility',
                                value: weatherService.visible1.value
                                        .toStringAsFixed(0) +
                                    " Km",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
