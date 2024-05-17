import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_plate/Navigation/Navigate.dart';
import 'package:home_plate/Router/routes.dart';
import 'package:home_plate/Storage/CustomStorage.dart';

import '../../Constants/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    Future.delayed(const Duration(seconds: 5), () {
      if (Storage.instance.isLoggedIn) {
        Navigation.instance.navigateAndReplace(Routes.homeScreen);
      } else {
        Navigation.instance.navigateAndReplace(Routes.introSlidesScreen);
      }
    });
  }
  @override
  void dispose() {
    super.dispose();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);  // to re-show bars

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(Assets.splash).image,
            fit: BoxFit.fill,
          ),
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Image.asset(Assets.logo),
        //   ],
        // ),
      ),
    );
  }
}
