import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/constants.dart';

class CollectFromSection extends StatelessWidget {
  const CollectFromSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
      ),
      decoration: BoxDecoration(
          color: Constants.primaryColor,
          // color: Colors.grey.shade400!.withOpacity(0.2),
          border: Border.symmetric(
            horizontal: BorderSide(
              color: Colors.grey.shade100.withOpacity(0.2),
              width: 0.5.w,
            ),
          )),
      height: 7.h,
      width: double.infinity,
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: Constants.seventhColor,
            size: 22.sp,
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            "Collect From Customer: 0",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Constants.fourthColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}