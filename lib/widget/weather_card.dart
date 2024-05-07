import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../service/weather_service.dart';

class weather_card extends StatelessWidget {

  weather_card({
    super.key,
    required this.weatherService,
    required this.image,
    required this.title,
    required this.value,
  });

  final WeatherService weatherService;
  String image;
  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      color: Colors.deepPurple[300],
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Obx(() => Text(
                      weatherService.dataResponse.value.isEmpty
                          ? ""
                          : "${value}",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
