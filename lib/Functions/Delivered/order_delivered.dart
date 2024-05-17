import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/constants.dart';
import '../../Navigation/Navigate.dart';
import '../../Router/routes.dart';

class OrderDelivered extends StatefulWidget {
  const OrderDelivered({super.key, required this.id});

  final int id;

  @override
  State<OrderDelivered> createState() => _OrderDeliveredState();
}

class _OrderDeliveredState extends State<OrderDelivered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Delivered",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Constants.fourthColor,
            // fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 2.h,
        ),
        color: Constants.bgColor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 4.h,
            // ),
            // Row(
            //   children: [
            //     Icon(
            //       Icons.check_circle,
            //       color: Constants.seventhColor,
            //       size: 20.sp,
            //     ),
            //     SizedBox(
            //       width: 2.w,
            //     ),
            //
            //   ],
            // ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Total",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Constants.fourthColor,
                    // fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                  ),
            ),
            Text(
              "Earnings",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Constants.fourthColor,
                    // fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                  ),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "₹",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Constants.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                      ),
                ),
                Text(
                  "45",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Constants.seventhColor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 45.sp,
                      ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 6.h,
              width: 100.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.seventhColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  Navigation.instance.navigateAndRemoveUntil(Routes.homeScreen);
                },
                child: Text(
                  "GET MORE ORDERS",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Constants.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
