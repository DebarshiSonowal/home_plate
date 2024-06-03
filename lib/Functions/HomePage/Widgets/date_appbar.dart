import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/constants.dart';

class DateBarAppbar extends StatelessWidget {
  const DateBarAppbar({
    super.key,
    required this.selectedDate,
    required this.updateDate,
  });

  final Function updateDate;
  final int selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Constants.fifthColor),
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 1.h,
          ),
          width: double.infinity,
          height: 7.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: 3.w,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final today = DateTime.now();
              return GestureDetector(
                onTap: () {
                  updateDate(index);
                },
                child: SizedBox(
                  width: 10.w,
                  height: 10.h,
                  child: AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                          "${DateFormat("EE").format(today.add(Duration(days: index)))}\n",
                          style:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: selectedDate == index
                                ? Constants.secondaryColor
                                : Constants.fifthColor,
                            fontSize: 16.sp,
                            fontWeight: selectedDate == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: DateFormat("dd")
                              .format(today.add(Duration(days: index))),
                          style:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: selectedDate == index
                                ? Constants.secondaryColor
                                : Constants.fifthColor,
                            fontSize: 16.sp,
                            fontWeight: selectedDate == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 2.w,
              );
            },
            itemCount: 7,
          ),
        ),
        const TabBar(
          tabs: [
            Tab(
              text: "Opportunities",
            ),
            Tab(
              text: "Upcoming Orders",
            ),
            // Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ],
    );
  }
}