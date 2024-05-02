import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';
import 'package:weather_flutter/service/weather_service.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherService weatherService = Get.put(WeatherService());
    weatherService.getWeather();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.cloud_sharp),
          title: Text("Weather App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on,
                size: 35,
              ),
              Obx(() => Text(weatherService.dataResponse.value['name'] ??'Loading data.....', style: TextStyle(fontSize: 30,),)),
              Obx(() => Text(weatherService.dataResponse.isEmpty ? "Loading data....." :weatherService.temp1.value.toStringAsFixed(2)+" °C", style: TextStyle(fontSize: 20),)),
              Obx(() => Text(weatherService.dataResponse.isEmpty? "Loading data.....":weatherService.dataResponse.value['weather'][0]['main'], style: TextStyle(fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
