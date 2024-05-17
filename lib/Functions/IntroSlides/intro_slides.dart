import 'package:flutter/material.dart';
import 'package:home_plate/Constants/assets.dart';
import 'package:home_plate/Constants/constants.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Navigation/Navigate.dart';
import '../../Router/routes.dart';

class IntroSlides extends StatefulWidget {
  const IntroSlides({super.key});

  @override
  State<IntroSlides> createState() => _IntroSlidesState();
}

class _IntroSlidesState extends State<IntroSlides> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero,(){
      listContentConfig.add(
        ContentConfig(
          title: "Accept a Job",
          description:
          "Allow miles wound place the leave had. To sitting subject no improve studied limited",
          pathImage: Assets.intro1,
          backgroundColor: Constants.bgColor,
          styleTitle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Constants.fourthColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
          styleDescription: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Constants.fourthColor,
            fontSize: 18.sp,
            // fontWeight: FontWeight.bold,
          ),
        ),
      );
      listContentConfig.add(
        ContentConfig(
          title: "Tracking Realtime",
          description:
          "Allow miles wound place the leave had. To sitting subject no improve studied limited",
          pathImage: Assets.intro2,
          backgroundColor: Constants.bgColor,
          styleTitle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Constants.fourthColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
          styleDescription: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Constants.fourthColor,
            fontSize: 18.sp,
            // fontWeight: FontWeight.bold,
          ),
        ),
      );
      listContentConfig.add(
        ContentConfig(
          title: "Earn Money",
          description:
          "Allow miles wound place the leave had. To sitting subject no improve studied limited",
          pathImage: Assets.intro3,
          backgroundColor: Constants.bgColor,
          styleTitle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Constants.fourthColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
          styleDescription: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Constants.fourthColor,
            fontSize: 18.sp,
            // fontWeight: FontWeight.bold,
          ),
        ),
      );
      setState(() {

      });
    });
  }

  void onDonePress() {
    // log("End of slides");
    Navigation.instance.navigateAndReplace(Routes.introScreen);
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      listContentConfig: listContentConfig,
      onDonePress: onDonePress,
    );
  }
}
