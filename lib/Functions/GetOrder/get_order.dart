import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:home_plate/Constants/assets.dart';
import 'package:home_plate/Constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Navigation/Navigate.dart';
import '../../Router/routes.dart';

class GetOrder extends StatefulWidget {
  const GetOrder({super.key});

  @override
  State<GetOrder> createState() => _GetOrderState();
}

class _GetOrderState extends State<GetOrder> {
  //   Navigation.instance
  //                                                 .navigateAndRemoveUntil(
  //                                                 Routes.homeScreen);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Constants.bgColor,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 1.h,
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50.w,
              child: Image.asset(Assets.logo),
            ),
            AutoSizeText(
              "Navigate to current order from your location",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Constants.fifthColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            Image.asset(Assets.map,height: 15.h,),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 70.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: 1.5.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Constants.secondaryColor,
                    ),
                    // <-- Radius
                  ),
                ),
                onPressed: () {
                  Navigation.instance
                      .navigateAndRemoveUntil(
                      Routes.homeScreen);
                },
                child: Text(
                  "Get Order",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Constants.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
