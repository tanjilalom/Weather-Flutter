import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class WeatherService extends GetxController{

  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey = '1a844b383d1efd4353c8ee2463e63dcd';

  var dataResponse = {}.obs;

  var temp1 = 0.00.obs;

  Future getWeather() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //print("${position.latitude}\n${position.longitude}");

    var lat = position.latitude;
    var lon = position.longitude;

    var response = await http.get(Uri.parse("$BASE_URL?lat=$lat&lon=$lon&appid=$apiKey"));

    if (response.statusCode == 200) {
      var decode = json.decode(response.body);
      dataResponse.assignAll(decode);
      print(dataResponse);

      temp1.value = dataResponse['main']['temp']/10.roundToDouble();








    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
