import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/constants.dart';

class PickUpCard extends StatelessWidget {
  const PickUpCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(

          vertical: 0.5.h,
        ),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 0.5.h,
              ),
              child: Row(
                children: [
                  Text(
                    "Pickup Center-1",
                    style:
                    Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Constants.fourthColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.bgColor,
                      ),
                      padding: EdgeInsets.all(2.w),
                      child:  Icon(
                        Icons.call,
                        color: Constants.seventhColor,
                        size: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.bgColor,
                      ),
                      padding: EdgeInsets.all(2.w),
                      child: Icon(
                        Icons.share,
                        size: 16.sp,
                        color: Constants.seventhColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 0.5.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 4.h,
                    child: Column(
                        children: [
                          SizedBox(
                            width: 40.w,
                            height: 2.h,
                            child: AutoSizeText.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Order No. ",
                                    style:
                                    Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black87,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                    "#1109",
                                    style:
                                    Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black54,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40.w,
                            height: 2.h,
                            child: AutoSizeText.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Breakfast |",
                                    style:
                                    Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black87,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                    " 9:30 PM",
                                    style:
                                    Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black54,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 0.5.h,
                    ),
                    decoration: BoxDecoration(
                      color: Constants.bgColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Pickup Pending",
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.secondaryColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 0.5.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 4.h,
                    child: Column(
                        children: [
                          SizedBox(
                            width: 40.w,
                            height: 2.h,
                            child: AutoSizeText.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Order No. ",
                                    style:
                                    Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black87,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                    "#1109",
                                    style:
                                    Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black54,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40.w,
                            height: 2.h,
                            child: AutoSizeText.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Lunch |",
                                    style:
                                    Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black87,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                    " 9:30 PM",
                                    style:
                                    Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black54,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 0.5.h,
                    ),
                    decoration: BoxDecoration(
                      color: Constants.bgColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Pickup Failed",
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.sixthColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 0.5.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 4.h,
                    child: Column(
                        children: [
                          SizedBox(
                            width: 40.w,
                            height: 2.h,
                            child: AutoSizeText.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Order No. ",
                                    style:
                                    Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black87,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                    "#1109",
                                    style:
                                    Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black54,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40.w,
                            height: 2.h,
                            child: AutoSizeText.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Dinner |",
                                    style:
                                    Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black87,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                    " 9:30 PM",
                                    style:
                                    Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black54,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 0.5.h,
                    ),
                    decoration: BoxDecoration(
                      color: Constants.bgColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Pickup Successful",
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.seventhColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const Divider(),
          ],
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