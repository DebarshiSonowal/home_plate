import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/constants.dart';

class PickupBottomCard extends StatelessWidget {
  const PickupBottomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 20.h,
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
            const Divider(
              color: Constants.fourthColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.call,
                        color: Constants.seventhColor,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "CALL",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Constants.seventhColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    openMapsSheet(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.navigation,
                        color: Constants.seventhColor,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "Navigations",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.seventhColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // return Card(
    //   elevation: 10,
    //   color: Constants.bgColor,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(10),
    //       topRight: Radius.circular(10),
    //     ),
    //   ),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10),
    //       color: Constants.bgColor,
    //     ),
    //     height: 28.h,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 4.w,
    //           ),
    //           decoration: const BoxDecoration(
    //             border: Border(
    //               bottom: BorderSide(
    //                 color: Constants.fourthColor,
    //               ),
    //             ),
    //           ),
    //           height: 7.h,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Icon(
    //                 Icons.location_on,
    //                 color: Constants.fourthColor,
    //                 size: 20.sp,
    //               ),
    //               Text(
    //                 "Himangsu Borah",
    //                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
    //                       fontSize: 18.sp,
    //                       color: Constants.fourthColor,
    //                       // fontWeight: FontWeight.bold,
    //                     ),
    //               ),
    //               Container(
    //                 decoration: const BoxDecoration(
    //                   shape: BoxShape.circle,
    //                   color: Constants.seventhColor,
    //                 ),
    //                 padding: EdgeInsets.all(0.9.w),
    //                 child: const Icon(
    //                   Icons.navigation,
    //                   color: Constants.primaryColor,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         SizedBox(
    //           height: 1.h,
    //         ),
    //         // Text(
    //         //   Faker().person.name(),
    //         //   style: Theme.of(context)
    //         //       .textTheme
    //         //       .bodySmall
    //         //       ?.copyWith(
    //         //     color: Constants.fourthColor,
    //         //     fontWeight: FontWeight.bold,
    //         //     fontSize: 18.sp,
    //         //   ),
    //         // ),
    //         Padding(
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 4.w,
    //           ),
    //           child: AutoSizeText.rich(
    //             TextSpan(
    //               children: [
    //                 TextSpan(
    //                   text: "Order Id",
    //                   style: Theme.of(context).textTheme.bodySmall?.copyWith(
    //                         color: Colors.grey.shade800,
    //                         fontSize: 15.sp,
    //                       ),
    //                 ),
    //                 TextSpan(
    //                   text: "  ${Random().nextInt(1000)}",
    //                   style: Theme.of(context).textTheme.bodySmall?.copyWith(
    //                         color: Colors.black,
    //                         fontSize: 18.sp,
    //                       ),
    //                 ),
    //               ],
    //             ),
    //             textAlign: TextAlign.start,
    //           ),
    //         ),
    //         AutoSizeText.rich(
    //           TextSpan(
    //             children: [
    //               TextSpan(
    //                 text: "DateTime",
    //                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
    //                       color: Colors.grey.shade800,
    //                       fontSize: 12.sp,
    //                     ),
    //               ),
    //               TextSpan(
    //                 text:
    //                     "  ${DateFormat("dd-MMM-yyyy").format(Faker().date.dateTime())}",
    //                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
    //                       color: Colors.black,
    //                       fontSize: 14.sp,
    //                     ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         AutoSizeText.rich(
    //           TextSpan(
    //             children: [
    //               TextSpan(
    //                 text: "Shortest Route:",
    //                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
    //                       color: Colors.grey.shade800,
    //                       fontSize: 14.sp,
    //                     ),
    //               ),
    //               TextSpan(
    //                 text:
    //                     " ${Faker().address.neighborhood()}, ${Faker().address.city()}, ${Faker().address.state()}",
    //                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
    //                       color: Colors.black,
    //                       fontSize: 14.sp,
    //                     ),
    //               ),
    //             ],
    //           ),
    //           textAlign: TextAlign.start,
    //         ),
    //         SizedBox(
    //           height: 1.5.h,
    //         ),
    //         AutoSizeText(
    //           "${Faker().address.buildingNumber()}, ${Faker().address.streetName()}",
    //           style: Theme.of(context).textTheme.bodySmall?.copyWith(
    //                 color: Constants.fourthColor,
    //                 // fontWeight: FontWeight.bold,
    //                 fontSize: 15.sp,
    //               ),
    //         ),
    //         SizedBox(
    //           height: 0.5.h,
    //         ),
    //         // AutoSizeText(
    //         //   Faker().address.neighborhood(),
    //         //   style:
    //         //   Theme.of(context).textTheme.bodySmall?.copyWith(
    //         //     color: Constants.fourthColor,
    //         //     // fontWeight: FontWeight.bold,
    //         //     fontSize: 15.sp,
    //         //   ),
    //         // ),
    //         // SizedBox(
    //         //   height: 0.5.h,
    //         // ),
    //         // AutoSizeText(
    //         //   "${Faker().address.city()}, ${Faker().address.state()}",
    //         //   style:
    //         //   Theme.of(context).textTheme.bodySmall?.copyWith(
    //         //     color: Constants.fourthColor,
    //         //     // fontWeight: FontWeight.bold,
    //         //     fontSize: 15.sp,
    //         //   ),
    //         //   maxLines: 2,
    //         // ),
    //         SizedBox(
    //           height: 1.5.h,
    //         ),
    //         const Divider(
    //           color: Constants.fourthColor,
    //         ),
    //         SizedBox(
    //           height: 0.5.h,
    //         ),
    //         GestureDetector(
    //           onTap: () {},
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               const Icon(
    //                 Icons.call,
    //                 color: Constants.sixthColor,
    //               ),
    //               SizedBox(
    //                 width: 2.w,
    //               ),
    //               Text(
    //                 "CALL",
    //                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
    //                       color: Constants.sixthColor,
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 16.sp,
    //                     ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
  openMapsSheet(context) async {
    try {
      final coords = Coords(37.759392, -122.5107336);
      final coords1 = Coords(37.759382, -122.5107336);
      final title = "Ocean Beach";
      final title1 = "Ocean Beach2";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showDirections(
                            destination: coords,
                            destinationTitle: title,
                            origin: coords1,
                            originTitle: title1),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
}

