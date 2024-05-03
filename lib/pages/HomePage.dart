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
              SizedBox(height: 20,),
              Obx(() => Text(weatherService.dataResponse.value['name'] ??'Loading data.....', style: TextStyle(fontSize: 20,),)),
              degree(),
              Obx(() => Text(weatherService.dataResponse.isEmpty? "Loading data.....":weatherService.dataResponse.value['weather'][0]['main'], style: TextStyle(fontSize: 20),)),
              SizedBox(height: 20,),
              Container(
                height: 110,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 18.0, left: 8),
                      child: Column(
                      children: [
                        Image(
                            height: 30,
                            image: AssetImage('assets/icons/pressure.png')),
                        Obx(() => Text(weatherService.dataResponse.value['main']['pressure'].toString() ??'Loading', style: TextStyle(fontSize: 16, color: Colors.white),)),
                        Text("Pressure", style: TextStyle(fontSize: 16, color: Colors.white),),
                    ],
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: Column(
                      children: [
                        Image(
                            height: 30,
                            image: AssetImage('assets/icons/humidity.png')),
                        Obx(() => Text(weatherService.dataResponse.value['main']['humidity'].toString() ??'Loading', style: TextStyle(fontSize: 16, color: Colors.white),)),
                        Text("Humidity", style: TextStyle(fontSize: 16, color: Colors.white),)
                      ],
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18.0, right: 8),
                      child: Column(
                      children: [
                        Image(
                            height: 30,
                            image: AssetImage('assets/icons/wind.png')),
                        Obx(() => Text(weatherService.dataResponse.value['wind']['speed'].toString() ??'Loading', style: TextStyle(fontSize: 16, color: Colors.white),)),
                        Text("Wind Speed", style: TextStyle(fontSize: 16, color: Colors.white),)
                      ],
                    ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),




















            ],
          ),
        ),
      ),
    );
  }
}
