import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/constants.dart';
import '../../../Navigation/Navigate.dart';

class GoToHomeButton extends StatelessWidget {
  const GoToHomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigation.instance.goBack();
      },
      child: SizedBox(
        height: 4.h,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.home,
              color: Constants.fifthColor,
              size: 22.sp,
            ),
            SizedBox(
              width: 4.w,
            ),
            SizedBox(
              height: 4.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Go To Home Page",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Constants.fifthColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}