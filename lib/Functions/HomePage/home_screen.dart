import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:home_plate/Constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import '../../Navigation/Navigate.dart';
import '../../Router/routes.dart';
import 'Widgets/custom_nav_drawer.dart';
import 'Widgets/order_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isActive = false;
  int selectedDate = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          iconTheme: const IconThemeData(
            color: Constants.fourthColor,
          ),
          title: Text(
            "Deliveries",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Constants.secondaryColor,
                  fontSize: 20.sp,
                ),
          ),
          actions: [
            SizedBox(
              height: 4.h,
              // width: 25.w,
              child: LiteRollingSwitch(
                //initial value
                value: isActive,
                textOn: 'Available',
                textOff: 'Offline',
                colorOn: Colors.green,
                colorOff: Colors.redAccent,
                iconOn: Icons.done,
                iconOff: Icons.remove_circle_outline,
                textSize: 14.sp,
                textOnColor: Colors.white,
                textOffColor: Colors.white,
                width: 26.w,
                onChanged: (bool state) {
                  //Use it to manage the different states
                  print('Current State of SWITCH IS: $state');
                },
                onTap: () {
                  setState(() {
                    isActive = !isActive;
                  });
                },
                onDoubleTap: () {},
                onSwipe: () {
                  setState(() {
                    isActive = !isActive;
                  });
                },
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.notification_add,
                color: Constants.fourthColor,
              ),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(13.h),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Constants.fifthColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 1.h,
                  ),
                  width: double.infinity,
                  height: 7.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final today = DateTime.now();
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = index;
                          });
                        },
                        child: SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "${DateFormat("EE").format(today.add(Duration(days: index)))}\n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: selectedDate == index
                                            ? Constants.secondaryColor
                                            : Constants.fifthColor,
                                        fontSize: 16.sp,
                                        fontWeight: selectedDate == index
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                ),
                                TextSpan(
                                  text: DateFormat("dd")
                                      .format(today.add(Duration(days: index))),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: selectedDate == index
                                            ? Constants.secondaryColor
                                            : Constants.fifthColor,
                                        fontSize: 16.sp,
                                        fontWeight: selectedDate == index
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 2.w,
                      );
                    },
                    itemCount: 7,

                  ),
                ),
                const TabBar(
                  tabs: [
                    Tab(
                      text: "Opportunities",
                    ),
                    Tab(
                      text: "Upcoming Orders",
                    ),
                    // Tab(icon: Icon(Icons.directions_bike)),
                  ],
                ),
              ],
            ),
          ),
        ),
        drawer: const CustomNavigationDrawer(),
        body: Container(
          color: Constants.bgColor,
          padding: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 1.h,
          ),
          // color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          child: TabBarView(
            children: [
              ListView.separated(
                itemBuilder: (context, index) {
                  return const OrderCard();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 1.5.h,
                  );
                },
                itemCount: 4,
              ),
              ListView.separated(
                itemBuilder: (context, index) {
                  return const AcceptedOrderCard();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 1.5.h,
                  );
                },
                itemCount: 4,
              ),
            ],
          ),
          // child: ,
        ),
      ),
    );
  }
}
