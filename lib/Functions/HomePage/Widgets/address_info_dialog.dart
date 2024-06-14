import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/constants.dart';
import '../../../Model/Order/order_model.dart';
import '../../../Navigation/Navigate.dart';

class AddressInfoDialog extends StatefulWidget {
  const AddressInfoDialog({
    super.key,
    required this.item,
    required this.pickUpLat,
    required this.pickUpLong,
    required this.destLat,
    required this.destLong,
    // required this.distance,
  });

  final double pickUpLat, pickUpLong, destLat, destLong;
  final OrderModel item;

  @override
  State<AddressInfoDialog> createState() => _AddressInfoDialogState();
}

class _AddressInfoDialogState extends State<AddressInfoDialog> {
  String? _distance, _duration;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      fetchDistanceAndTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.5.w,
        vertical: 1.h,
      ),
      // height: 20.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigation.instance.goBack();
            },
            child: Icon(
              Icons.close,
              size: 16.sp,
              color: Constants.secondaryColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30.w,
                child: AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Pickup:\n",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text:
                            "${widget.item.chefs?.addressLine1}\n${widget.item.chefs?.addressLine2}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 12.sp,
                              // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
                child: const VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
              SizedBox(
                width: 30.w,
                child: AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Delivery:\n",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text: "${widget.item.orders?.shippingAddress}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Constants.fourthColor,
                              fontSize: 12.sp,
                              // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${widget.item.distance} (${widget.item.duration})",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Constants.secondaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  // void fetchDistanceAndTime() async {
  //   String apiKey = dotenv.env['MAPS'] ?? "";
  //
  //   String url =
  //       'https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=${widget.pickUpLat},${widget.pickUpLong}&destinations=${widget.destLat},${widget.destLong}&key=$apiKey';
  //
  //   try {
  //     Response response = await Dio().get(url);
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> data = jsonDecode(response.data);
  //
  //       // Correctly access the distance and duration as strings:
  //       String distanceText = data['rows'][0]['elements'][0]['distance']['text'];
  //       String durationText = data['rows'][0]['elements'][0]['duration']['text'];
  //
  //       setState(() {
  //         _distance = distanceText;
  //         _duration = durationText;
  //       });
  //     } else {
  //       print('Error: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }
  Future<void> fetchDistanceAndTime() async {
    // Replace with your actual Google Maps API Key
    String apiKey = dotenv.env['MAPS'] ?? "";

    String url =
        'https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=${widget.pickUpLat},${widget.pickUpLong}&destinations=${widget.destLat},${widget.destLong}&key=$apiKey';

    try {
      Response response = await Dio().get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.data);

        // Correctly access distance and duration as strings:
        String distanceText =
            data['rows'][0]['elements'][0]['distance']['text'];
        String durationText =
            data['rows'][0]['elements'][0]['duration']['text'];

        setState(() {
          _distance = distanceText;
          _duration = durationText;
        });

        // Update markers after successful calculation
        // _setMarkers();
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error1: $e');
    }
  }
}
