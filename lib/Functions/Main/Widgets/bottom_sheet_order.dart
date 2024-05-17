import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/constants.dart';
import '../../../Navigation/Navigate.dart';
import '../../../Router/routes.dart';
import 'pick_food_banner.dart';

class BottomSheetOrder extends StatelessWidget {
  const BottomSheetOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 40.h,
          child: Card(
            color: Constants.primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 2.h,
                // left: 2.w,
                // right: 2.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      // top: 2.h,
                      left: 4.w,
                      right: 0.w,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25.w,
                          child: AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Order Id\n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: Constants.fourthColor,
                                    fontSize: 16.sp,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "${Random.secure().nextInt(100000)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: Constants.secondaryColor,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 25.w,
                          child: AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Token No\n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: Constants.fourthColor,
                                    fontSize: 16.sp,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "${Random.secure().nextInt(100000)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: Constants.secondaryColor,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      // top: 2.h,
                      left: 4.w,
                      right: 4.w,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.timer,
                          color: Constants.sixthColor,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "${Random().nextInt(12)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                  color: Constants.fourthColor,
                                  fontSize: 17.sp,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: " ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                  color: Colors.black87,
                                  fontSize: 18.5.sp,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "Hours",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                  color: Constants.fourthColor,
                                  fontSize: 17.sp,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      // top: 2.h,
                      left: 4.w,
                      right: 2.w,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.directions_bike,
                          color: Constants.sixthColor,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "${Random().nextInt(30)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                  color: Constants.fourthColor,
                                  fontSize: 17.sp,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: " ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                  color: Colors.black87,
                                  fontSize: 18.5.sp,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "KM",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                  color: Constants.fourthColor,
                                  fontSize: 17.sp,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      // top: 2.h,
                      left: 4.w,
                      right: 2.w,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_history,
                          color: Constants.sixthColor,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        SizedBox(
                          width: 80.w,
                          child: AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                  "${Faker().address.neighborhood()}, ${Faker().address.city()}, ${Faker().address.state()}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: Constants.fourthColor,
                                    fontSize: 17.sp,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // TextSpan(
                                //   text: " ",
                                //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                //     color: Colors.black87,
                                //     fontSize: 18.5.sp,
                                //     // fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                                // TextSpan(
                                //   text: "",
                                //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                //     color: Colors.black87,
                                //     fontSize: 17.sp,
                                //     // fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                              ],
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 6.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constants.secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        Navigation.instance.navigate(Routes.tasksScreen,args: 0);
                      },
                      child: Text(
                        "Accept",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 10.w,
          top: 0.5.h,
          child: const PickFoodBanner(),
        ),
      ],
    );
  }
}


