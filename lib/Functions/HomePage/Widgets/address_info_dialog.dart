import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/constants.dart';
import '../../../Navigation/Navigate.dart';

class AddressInfoDialog extends StatelessWidget {
  const AddressInfoDialog({
    super.key,
  });

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
            onTap: (){
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
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                          color: Constants.fourthColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
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
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                          color: Constants.fourthColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
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
                      text: "15 KM (30 Min)",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(
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
}