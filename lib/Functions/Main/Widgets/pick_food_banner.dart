import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/constants.dart';

class PickFoodBanner extends StatelessWidget {
  const PickFoodBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Constants.thirdColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      width: 27.w,
      height: 10.h,
      child: Center(
        child: AutoSizeText.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Pick\n",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.fourthColor,
                  fontSize: 16.5.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "Food",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.fourthColor,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}