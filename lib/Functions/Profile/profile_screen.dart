import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:home_plate/Constants/assets.dart';
import 'package:home_plate/Constants/constants.dart';
import 'package:home_plate/Navigation/Navigate.dart';
import 'package:home_plate/Router/routes.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Repository/repository.dart';
import 'Widgets/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(12.h),
        child: const CustomAppBar(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 1.h,
        ),
        color: Constants.bgColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileHeader(),
              SizedBox(
                height: 2.h,
              ),
              AutoSizeText(
                "Options",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Constants.fourthColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 65.h,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      OptionsItem(
                        onTap: () {
                          Navigation.instance
                              .navigate(Routes.profileUpdateScreen);
                        },
                        title: 'Edit Profile',
                        icon: Icons.person_rounded,
                      ),
                      OptionsItem(
                        onTap: () {
                          // Navigation.instance
                          //     .navigate(Routes.profileUpdateScreen);
                        },
                        title: 'Privacy Policy',
                        icon: Icons.policy,
                      ),
                      OptionsItem(
                        onTap: () {
                          // Navigation.instance
                          //     .navigate(Routes.profileUpdateScreen);
                        },
                        title: 'Terms & Conditions',
                        icon: Icons.policy,
                      ),
                      OptionsItem(
                        onTap: () {
                          // Navigation.instance
                          //     .navigate(Routes.profileUpdateScreen);
                        },
                        title: 'About',
                        icon: Icons.info,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionsItem extends StatelessWidget {
  const OptionsItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  final Function onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Constants.primaryColor,
        child: Container(
          decoration: BoxDecoration(
            color: Constants.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 1.5.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: Constants.secondaryColor,
                size: 22.sp,
              ),
              SizedBox(
                width: 60.w,
                child: AutoSizeText(
                  title ?? "Edit Profile",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.fourthColor,
                        fontSize: 18.sp,
                      ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Constants.secondaryColor,
                size: 22.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          color: Constants.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            padding: EdgeInsets.all(2.w),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Constants.primaryColor,
            ),
            child: CircleAvatar(
              radius: 10.w,
              backgroundColor: Constants.primaryColor,
              child: Image.asset(Assets.logo),
            ),
          ),
        ),
        Consumer<Repository>(
            builder: (context,data,_) {
            return SizedBox(
              width: 65.w,
              height: 30.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_circle_sharp,
                        color: Constants.secondaryColor,
                        size: 22.sp,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      SizedBox(
                        width: 50.w,
                        child: AutoSizeText(
                          "${data.profile?.firstName} ${data.profile?.lastName}",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.black87,
                                fontSize: 17.sp,
                                // fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: Constants.secondaryColor,
                        size: 22.sp,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      SizedBox(
                        width: 50.w,
                        child: AutoSizeText(
                          "+1 ${data.profile?.mobileNo}",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.black87,
                                fontSize: 17.sp,
                                // fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Constants.secondaryColor,
                        size: 22.sp,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      SizedBox(
                        width: 50.w,
                        child: AutoSizeText(
                          data.profile?.email??"xyz@gmail.com",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.black87,
                                fontSize: 16.sp,
                                // fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Constants.seventhColor,
                        // color: Constants.secondaryColor,
                        size: 22.sp,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      SizedBox(
                        width: 40.w,
                        child: AutoSizeText(
                          "Ready",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Constants.seventhColor,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        ),
      ],
    );
  }
}
