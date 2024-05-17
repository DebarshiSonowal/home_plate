import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/constants.dart';
import '../../Navigation/Navigate.dart';
import '../../Router/routes.dart';

class MyEarnings extends StatefulWidget {
  const MyEarnings({super.key});

  @override
  State<MyEarnings> createState() => _MyEarningsState();
}

class _MyEarningsState extends State<MyEarnings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: AutoSizeText(
          "My Earnings",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Constants.secondaryColor,
                fontSize: 18.sp,
              ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.settings_input_component_rounded,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
        ],
      ),
      body: Container(
        color: Constants.bgColor,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 2.h,
        ),
        child: const Column(
          children: [
            EarningsCard(),
            EarningsCard(),
          ],
        ),
      ),
    );
  }
}

class EarningsCard extends StatelessWidget {
  const EarningsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Constants.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        // side: BorderSide(
        //   color: Colors.black,
        //   width: 0.09.h,
        // ),
      ),
      elevation: 8,
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 1.5.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80.w,
                  child: AutoSizeText(
                    "#HP${Random().nextInt(100000)} (#HPSUB${Random().nextInt(10000)})",
                    style:
                        Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fifthColor,
                              fontSize: 18.sp,
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
            Padding(
              padding: EdgeInsets.only(
                right: 2.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Paid date:",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Constants.fifthColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextSpan(
                          text:
                              "  ${DateFormat("dd/MM/yyyy").format(Faker().date.dateTime())}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Colors.black,
                                fontSize: 15.sp,
                              ),
                        ),
                      ],
                    ),
                  ),
                  AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Status:",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Constants.fifthColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextSpan(
                          text: "  Paid",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Colors.black,
                                fontSize: 15.sp,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Commission:",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                              color: Constants.fifthColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text: "  CA\$ 35",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                              color: Colors.black,
                              fontSize: 15.sp,
                            ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.download,
                  color: Constants.secondaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
