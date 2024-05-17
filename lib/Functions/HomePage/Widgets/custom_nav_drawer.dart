
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/constants.dart';
import '../../../Navigation/Navigate.dart';
import '../../../Router/routes.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      backgroundColor: Constants.secondaryColor,
      children: [
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 18.w,
                height: 18.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.primaryColor,
                ),
                child: Center(
                  child: Text(
                    "A",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Constants.secondaryColor,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                "John Doe",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.primaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "XYZ@gmail.com",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.primaryColor,
                  fontSize: 14.sp,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.account_circle_rounded,
            color: Constants.primaryColor,
          ),
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Constants.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigation.instance.navigate(Routes.profileScreen);
          },
        ),
        SizedBox(
          width: 40.w,
          child: Divider(
            color: Constants.primaryColor,
            thickness: 0.04.h,
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.wallet,
            color: Constants.primaryColor,
          ),
          title: Text(
            "My Earnings",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Constants.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigation.instance.navigate(Routes.myEarningsScreen);
          },
        ),
        SizedBox(
          width: 40.w,
          child: Divider(
            color: Constants.primaryColor,
            thickness: 0.04.h,
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.phone,
            color: Constants.primaryColor,
          ),
          title: Text(
            "Contact Us",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Constants.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigation.instance.navigate(Routes.profileScreen);
          },
        ),
        SizedBox(
          width: 40.w,
          child: Divider(
            color: Constants.primaryColor,
            thickness: 0.04.h,
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.note,
            color: Constants.primaryColor,
          ),
          title: Text(
            "Privacy Policy",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Constants.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigation.instance.navigate(Routes.profileScreen);
          },
        ),
        SizedBox(
          width: 40.w,
          child: Divider(
            color: Constants.primaryColor,
            thickness: 0.04.h,
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.security,
            color: Constants.primaryColor,
          ),
          title: Text(
            "Security",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Constants.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigation.instance.navigate(Routes.profileScreen);
          },
        ),
        SizedBox(
          width: 40.w,
          child: Divider(
            color: Constants.primaryColor,
            thickness: 0.04.h,
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.delete,
            color: Constants.primaryColor,
          ),
          title: Text(
            "Delete Request",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Constants.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigation.instance.navigate(Routes.profileScreen);
          },
        ),
        SizedBox(
          width: 40.w,
          child: Divider(
            color: Constants.primaryColor,
            thickness: 0.04.h,
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.login,
            color: Constants.primaryColor,
          ),
          title: Text(
            "Logout",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Constants.primaryColor,
              fontSize: 16.sp,
              // fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigation.instance.navigate(Routes.loginScreen);
          },
        ),
      ],
    );
  }
}