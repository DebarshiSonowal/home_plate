import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sized_icon_button/sized_icon_button.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../Constants/constants.dart';
import '../../../Navigation/Navigate.dart';
import '../../../Router/routes.dart';
import 'custom_tile.dart';

class TimeLineCustom extends StatelessWidget {
  const TimeLineCustom(
      {super.key, required this.selected, required this.updateSelected});

  final int selected;
  final Function(int) updateSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.e,
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              // height: 14.h,
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 1.5.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 80.w,
                        child: AutoSizeText(
                          "#HP${Random().nextInt(100000)} (#HPSUB${Random().nextInt(10000)})",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Constants.fifthColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // AutoSizeText(
                      //   "Pending",
                      //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      //     color: Constants.fourthColor,
                      //     fontSize: 13.sp,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Delivery date:",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Constants.fifthColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                          "  ${DateFormat("dd/MM/yyyy").format(Faker().date.dateTime())}",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Delivery time:",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Constants.fifthColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "  10 AM - 1 PM",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTile(
            isPickup: true,
            isFirst: true,
            isLast: false,
            updateSelected: updateSelected,
            selected: selected,
            val: 0,
            subTitle: "Pick Food",
            title: "KFC",
            sub:
                "${Faker().address.neighborhood()}, ${Faker().address.city()}, ${Faker().address.state()}",
            onClick: () {
              Navigation.instance.navigate(Routes.pickupScreen, args: 0);
            },
          ),
          // CustomTile(
          //   isPickup: true,
          //   isFirst: false,
          //   isLast: false,
          //   updateSelected: updateSelected,
          //   selected: selected,
          //   val: 1,
          //   subTitle: "Pick Food",
          //   title: "Pizza Hut",
          //   sub:
          //       "${Faker().address.neighborhood()}, ${Faker().address.city()}, ${Faker().address.state()}",
          //   onClick: () {
          //     Navigation.instance.navigate(Routes.pickupScreen, args: 0);
          //   },
          // ),
          CustomTile(
            isPickup: false,
            isFirst: false,
            isLast: true,
            updateSelected: updateSelected,
            selected: selected,
            val: 1,
            subTitle: "Deliver Food",
            title: "McDownalds",
            sub:
                "${Faker().address.neighborhood()}, ${Faker().address.city()}, ${Faker().address.state()}",
            onClick: () {
              Navigation.instance.navigate(Routes.locationScreen, args: 0);
            },
          ),
        ],
      ),
    );
  }
}


