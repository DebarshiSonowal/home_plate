import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home_plate/Api/api_provider.dart';
import 'package:home_plate/Repository/repository.dart';
import 'package:home_plate/Storage/CustomStorage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Constants/common_function.dart';
import '../../../Constants/constants.dart';
import '../../../Navigation/Navigate.dart';
import '../../../Router/routes.dart';

class CustomNavigationDrawer extends StatefulWidget {
  const CustomNavigationDrawer({super.key});

  @override
  State<CustomNavigationDrawer> createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  bool isExpended = false;
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      backgroundColor: Constants.secondaryColor,
      children: [
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<Repository>(builder: (context, data, _) {
                return Container(
                  width: 18.w,
                  height: 18.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      data.profile?.firstName?.characters.first.toUpperCase() ??
                          "A",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Constants.secondaryColor,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                );
              }),
              Consumer<Repository>(builder: (context, data, _) {
                return Text(
                  "${data.profile?.firstName} ${data.profile?.lastName}",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.primaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                );
              }),
              Consumer<Repository>(builder: (context, data, _) {
                return Text(
                  data.profile?.email ?? "XYZ@gmail.com",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.primaryColor,
                        fontSize: 14.sp,
                        // fontWeight: FontWeight.bold,
                      ),
                );
              }),
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.account_circle_rounded,
            color: Constants.primaryColor,
            size: 23.sp,
          ),
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.primaryColor,
                  fontSize: 18.sp,
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
        ExpansionTile(
          onExpansionChanged: (val) {
            setState(() {
              isExpended = !isExpended;
            });
          },
          leading: Icon(
            Icons.add_shopping_cart,
            color: Constants.primaryColor,
            size: 23.sp,
          ),
          trailing: Icon(
            !isExpended?Icons.arrow_drop_down:Icons.arrow_drop_up,
            color: Constants.primaryColor,
          ),
          title: Text(
            "Orders",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.primaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
          children: [
            Container(
              margin: EdgeInsets.only(left: 8.w),
              child: ListTile(
                title: Text(
                  "New Orders",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.primaryColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                onTap: () {
                  Navigation.instance.navigate(Routes.homeScreen);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8.w),
              child: ListTile(
                title: Text(
                  "Upcoming Orders",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.primaryColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                onTap: () {
                  Navigation.instance.navigate(Routes.homeScreen);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8.w),
              child: ListTile(
                title: Text(
                  "Inprocess Orders",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.primaryColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                onTap: () {
                  Navigation.instance.navigate(Routes.homeScreen);
                },
              ),
            ),
          ],
        ),
        ListTile(
          leading: Icon(
            Icons.wallet,
            color: Constants.primaryColor,
            size: 23.sp,
          ),
          title: Text(
            "My Earnings",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.primaryColor,
                  fontSize: 18.sp,
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
          leading: Icon(
            Icons.phone,
            color: Constants.primaryColor,
            size: 23.sp,
          ),
          title: Text(
            "Contact Us",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.primaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
          onTap: () {
            // Navigation.instance.navigate(Routes.profileScreen);
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
          leading: Icon(
            Icons.note,
            color: Constants.primaryColor,
            size: 23.sp,
          ),
          title: Text(
            "Privacy Policy",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.primaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
          onTap: () {
            // Navigation.instance.navigate(Routes.profileScreen);
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
          leading: Icon(
            Icons.security,
            color: Constants.primaryColor,
            size: 23.sp,
          ),
          title: Text(
            "Security",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.primaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
          onTap: () {
            // Navigation.instance.navigate(Routes.profileScreen);
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
          leading: Icon(
            Icons.delete,
            color: Constants.primaryColor,
            size: 23.sp,
          ),
          title: Text(
            "Delete Request",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.primaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
          onTap: () {
            // Navigation.instance.navigate(Routes.profileScreen);
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
          leading: Icon(
            Icons.login,
            color: Constants.primaryColor,
            size: 23.sp,
          ),
          title: Text(
            "Logout",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.primaryColor,
                  fontSize: 18.sp,
                  // fontWeight: FontWeight.bold,
                ),
          ),
          onTap: () {
            CommonFunction().logout();
          },
        ),
      ],
    );
  }
}
