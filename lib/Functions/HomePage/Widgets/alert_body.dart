import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/constants.dart';
import '../../../Navigation/Navigate.dart';

class AlertBody extends StatelessWidget {
  const AlertBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.5.w,
        vertical: 1.5.h,
      ),
      // height: 20.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              AutoSizeText(
                "How it works",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Constants.secondaryColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              GestureDetector(
                onTap: () {
                  Navigation.instance.goBack();
                },
                child: Icon(
                  Icons.close,
                  size: 17.sp,
                  color: Constants.secondaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: 90.w,
            child: AutoSizeText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        "You'll need to be online 40 minutes before the trip\n",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Constants.fourthColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextSpan(
                    text: "\nand you'll get trips towards your reservation",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Constants.fourthColor,
                          fontSize: 13.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
            child: Divider(
              color: Colors.black,
              thickness: 0.02.h,
            ),
          ),
          SizedBox(
            width: 90.w,
            child: AutoSizeText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "You'll always arrive on time\n",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Constants.fourthColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextSpan(
                    text:
                        "\nYour rider booked you to arrive early, and this time is included in the fare.",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Constants.fourthColor,
                          fontSize: 13.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
