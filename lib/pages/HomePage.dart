import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';
import 'package:weather_flutter/service/weather_service.dart';

import '../widget/degree.dart';

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
              SizedBox(
                height: 10,
              ),
              Obx(() => Text(
                    weatherService.dataResponse.isEmpty
                        ? "Loading data....."
                        : weatherService.dataResponse.value['weather'][0]
                            ['main'],
                    style: TextStyle(fontSize: 20),
                  )),

              SizedBox(
                height: 10,
              ),

              /*Container(
                height: 110,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(16)),
                child: Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 18.0, left: 8),
                        child: Column(
                          children: [
                            Image(
                                height: 30,
                                width: 30,
                                image: AssetImage('assets/icons/pressure.png')),
                            Obx(() => Text(
                                  weatherService.dataResponse
                                          .value['main']['pressure']
                                          .toString() ??
                                      '...',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )),
                            Text(
                              "Pressure",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: Column(
                          children: [
                            Image(
                                height: 30,
                                width: 30,
                                image: AssetImage('assets/icons/humidity.png')),
                            Obx(() => Text(
                                  weatherService.dataResponse
                                              .value['main']['humidity']
                                              .toString() +
                                          "%" ??
                                      '....',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )),
                            Text(
                              "Humidity",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.0, right: 8),
                        child: Column(
                          children: [
                            Image(
                                height: 30,
                                width: 30,
                                image: AssetImage('assets/icons/wind.png')),
                            Obx(() => Text(
                                  weatherService.speed1.value
                                              .toStringAsFixed(0) +
                                          " Km/h" ??
                                      '.....',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )),
                            Text(
                              "Wind Speed",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),*/

              SizedBox(
                height: 15,
              ),





              Padding(
                padding: const EdgeInsets.only(left: 8.0,),
                child: Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Colors.deepPurple[300],
                      child: Padding(
                        padding: EdgeInsets.all(18),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                  AssetImage('assets/icons/wind.png'),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Wind Speed",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Obx(() => Text(
                                    weatherService.speed1.value
                                        .toStringAsFixed(0) +
                                        " Km/h" ??
                                        '.....',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      elevation: 15,
                      color: Colors.deepPurple[300],
                      child: Padding(
                        padding: EdgeInsets.all(18),
                        child: Padding(
                          padding: EdgeInsets.only(right: 22.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                AssetImage('assets/icons/humidity.png'),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Humidity",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Obx(() => Text(
                                    weatherService.dataResponse
                                        .value['main']['humidity']
                                        .toString() +
                                        "%" ??
                                        '....',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
            height: 8,
          ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      elevation: 15,
                      color: Colors.deepPurple[300],
                      child: Padding(
                        padding: EdgeInsets.all(18),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                AssetImage('assets/icons/pressure.png'),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pressure",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Obx(() => Text(
                                    weatherService.dataResponse
                                        .value['main']['pressure']
                                        .toString() ??
                                        '...',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      elevation: 15,
                      color: Colors.deepPurple[300],
                      child: Padding(
                        padding: EdgeInsets.all(18),
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                AssetImage('assets/icons/humidity.png'),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Visibility",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Obx(() => Text(weatherService.visible1.value.toStringAsFixed(0) + " Km" ??
                                        '...',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
