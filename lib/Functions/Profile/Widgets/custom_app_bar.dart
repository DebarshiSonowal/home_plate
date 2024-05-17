import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/constants.dart';
import '../../../Navigation/Navigate.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      elevation: 4,
      child: Container(
        color: Constants.primaryColor,
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
        ),
        height: 12.h,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 10.h,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigation.instance.goBack();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Constants.fourthColor,
                    size: 22.sp,
                  ),
                ),
              ),
            ),
            Spacer(),
            // Icon(Icons.arrow_back,color: Constants.fourthColor,),
            SizedBox(
              height: 10.h,
              child: Center(
                child: Icon(
                  Icons.supervised_user_circle,
                  color: Constants.fourthColor,
                  size: 25.sp,
                ),
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            SizedBox(
              height: 7.5.h,
              child: Text(
                "Profile\n",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.fourthColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}