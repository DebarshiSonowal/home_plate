import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:home_plate/Constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Widgets/pickup_card.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key, required this.id});

  final int id;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: AutoSizeText.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Order ",
                style:
                Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black87,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                "#1109123",
                style:
                Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black54,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Constants.bgColor,
        ),
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 1.h,
        ),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              PickUpCard(),
              PickUpCard(),
              PickUpCard(),
            ],
          ),
        ),
      ),
    );
  }
}


