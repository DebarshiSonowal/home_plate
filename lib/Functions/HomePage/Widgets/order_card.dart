import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_plate/Functions/HomePage/Widgets/alert_body.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/constants.dart';
import '../../../Navigation/Navigate.dart';
import '../../../Router/routes.dart';
import 'address_info_dialog.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
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
          vertical: 1.h,
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
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Constants.fifthColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showAlertInfo(context);
                  },
                  child: const Icon(
                    Icons.info_outline,
                    color: Constants.secondaryColor,
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
            Row(
              children: [
                SizedBox(
                  width: 45.w,
                  child: AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Delivery date:",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Constants.fifthColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        TextSpan(
                          text:
                              "  ${DateFormat("dd/MM/yyyy").format(Faker().date.dateTime())}",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Icon(
                  Icons.watch_later_outlined,
                  color: Constants.secondaryColor,
                ),
                SizedBox(
                  width: 30.w,
                  child: AutoSizeText(
                    "  10 AM - 1 PM",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 50.w,
                  child: AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Order Amount:",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Constants.fifthColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        TextSpan(
                          text: " CA\$ 20",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),

            Row(
              children: [
                Icon(
                  FontAwesomeIcons.shop,
                  color: Constants.secondaryColor,
                  size: 15.sp,
                ),
                SizedBox(
                  width: 2.w,
                ),
                SizedBox(
                  width: 80.w,
                  child: AutoSizeText(
                    "  ${Faker().address.city()},${Faker().address.state()}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.truck,
                  color: Constants.secondaryColor,
                  size: 15.sp,
                ),
                SizedBox(
                  width: 2.w,
                ),
                SizedBox(
                  width: 80.w,
                  child: AutoSizeText(
                    "  ${Faker().address.city()},${Faker().address.state()}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.mapLocation,
                  color: Constants.secondaryColor,
                  size: 15.sp,
                ),
                SizedBox(
                  width: 2.w,
                ),
                SizedBox(
                  width: 80.w,
                  child: AutoSizeText(
                    "  18.5 Km. 30 min",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              height: 3.5.h,
              width: 90.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 35.w,
                    child: GestureDetector(
                      onTap: () {
                        showLocation(context);
                      },
                      child: AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Address Info",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Constants.secondaryColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Constants.secondaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    // width: 40.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constants.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                            color: Constants.secondaryColor,
                          ), // <-- Radius
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Reject",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    // width: 40.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                            color: Constants.seventhColor,
                          ),
                          // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        Navigation.instance
                            .navigate(Routes.tasksScreen, args: 0);
                      },
                      child: Text(
                        "Accept",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.seventhColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                      ),
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

  void showLocation(context) {
    showDialog(
        context: context,
        builder: (context) {
          return const Dialog(
            backgroundColor: Constants.primaryColor,
            child: AddressInfoDialog(),
          );
        });
  }

  void showAlertInfo(context) {
    showDialog(
        context: context,
        builder: (context) {
          return const Dialog(
            backgroundColor: Constants.primaryColor,
            child: AlertBody(),
          );
        });
  }
}

class AcceptedOrderCard extends StatelessWidget {
  const AcceptedOrderCard({
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
          vertical: 1.h,
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
              height: 1.h,
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
            const Divider(),
            // SizedBox(
            //   width: 90.w,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       SizedBox(
            //         width: 60.w,
            //         child: AutoSizeText(
            //           "${Faker().address.neighborhood()}, ${Faker().address.city()}, ${Faker().address.state()}",
            //           style: Theme.of(context).textTheme.bodySmall?.copyWith(
            //                 color: Constants.fifthColor,
            //                 fontSize: 12.sp,
            //               ),
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {},
            //         child: const Icon(
            //           Icons.gps_fixed,
            //           color: Constants.thirdColor,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {},
            //         child: const Icon(
            //           Icons.call,
            //           color: Constants.thirdColor,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const Divider(),
            SizedBox(
              height: 3.5.h,
              width: 90.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 35.w,
                    child: GestureDetector(
                      onTap: () {
                        showLocation(context);
                      },
                      child: AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Address Info",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Constants.secondaryColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Constants.secondaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    // width: 40.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                            color: Constants.seventhColor,
                          ),
                          // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        Navigation.instance
                            .navigate(Routes.tasksScreen, args: 0);
                      },
                      child: Text(
                        "Start",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.seventhColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                      ),
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

  void showLocation(context) {
    showDialog(
        context: context,
        builder: (context) {
          return const Dialog(
            backgroundColor: Constants.primaryColor,
            child: AddressInfoDialog(),
          );
        });
  }
}
