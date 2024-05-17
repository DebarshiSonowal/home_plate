import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/constants.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({
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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Constants.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 2.h,
          ),
          width: double.infinity,
          // height: 40.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 18.w,
                // height: 40.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Constants.seventhColor,
                      size: 22.sp,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 70.w,
                // height: 40.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "DELIVERY LOCATION",
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Faker().person.name(),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                            color: Constants.fourthColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Constants.seventhColor,
                            ),
                            padding: EdgeInsets.all(2.w),
                            child: const Icon(
                              Icons.navigation,
                              color: Constants.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AutoSizeText(
                      "${Faker().address.buildingNumber()}, ${Faker().address.streetName()}",
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.fourthColor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AutoSizeText(
                      Faker().address.neighborhood(),
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.fourthColor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AutoSizeText(
                      "${Faker().address.city()}, ${Faker().address.state()}",
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.fourthColor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Divider(
                      color: Constants.fourthColor,
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          const Icon(
                            Icons.call,
                            color: Constants.sixthColor,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "CALL",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                              color: Constants.sixthColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    const Divider(
                      color: Constants.fourthColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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