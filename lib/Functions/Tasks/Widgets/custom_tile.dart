import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sized_icon_button/sized_icon_button.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../Constants/constants.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.updateSelected,
    required this.selected,
    required this.val,
    required this.subTitle,
    required this.title,
    required this.onClick,
    required this.sub,
    required this.isFirst,
    required this.isLast,
    required this.isPickup,
  });

  final Function(int p1) updateSelected;
  final Function onClick;
  final int selected, val;
  final String subTitle, title, sub;
  final bool isFirst, isLast, isPickup;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      isFirst: isFirst,
      isLast: isLast,
      endChild: GestureDetector(
        onTap: () {
          updateSelected(val);
        },
        child: Card(
          elevation: selected == val ? 10 : 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Constants.primaryColor,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 0.7.h,
            ),
            decoration: BoxDecoration(
              color:
              selected == val ? Constants.primaryColor : Constants.bgColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selected == val
                    ? Constants.seventhColor
                    : Constants.fourthColor,
                width: 3.0,
              ),
            ),
            constraints: BoxConstraints(
              minHeight: 10.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 4.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        subTitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: selected == val
                              ? Constants.seventhColor
                              : Constants.fourthColor,
                          fontSize: 17.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      selected == val
                          ? SizedIconButton(
                        color: Constants.seventhColor,
                        // color: Constants.fifthColor,
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 17.sp,
                          color: Colors.white,
                        ),
                        onPressed: () => onClick(),
                      )
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 6.h,
                  child: Row(
                    children: [
                      AutoSizeText(
                        title,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: selected == val
                              ? Constants.seventhColor
                              : Constants.fourthColor,
                          // color: Constants.secondaryColor,
                          fontSize: 21.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 70.w,
                  height: 5.6.h,
                  child: AutoSizeText(
                    sub,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Constants.fourthColor,
                      fontSize: 16.sp,
                      // fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            // color: Colors.lightGreenAccent,
          ),
        ),
      ),
      indicatorStyle: IndicatorStyle(
        width: 40,
        color: selected == val ? Constants.seventhColor : Constants.fourthColor,
        padding: const EdgeInsets.all(8),
        iconStyle: IconStyle(
          color: Colors.white,
          iconData: isPickup ? Icons.food_bank_outlined : Icons.bike_scooter,
        ),
      ),
      beforeLineStyle: const LineStyle(
        color: Constants.fourthColor,
      ),
      // startChild: Container(
      //   color: Colors.amberAccent,
      // ),
    );
  }
}