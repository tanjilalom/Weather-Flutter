import 'package:flutter/material.dart';
import 'package:weather_flutter/pages/HomePage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetoHome();
  }

  _navigatetoHome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/splash.png'),
            ),
          ),
        ),
      ),
    );
  }
}
