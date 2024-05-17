import 'package:flutter/material.dart';
import 'package:home_plate/Constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: color??Constants.fourthColor,
          width: 0.5.w,
        ),
      ),
      padding: EdgeInsets.all(2.5.w),
      child: Text(
        "HELP",
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color??Constants.fourthColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
      ),
    );
  }
}
