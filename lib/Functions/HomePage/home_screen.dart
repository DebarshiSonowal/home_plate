import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:home_plate/Api/api_provider.dart';
import 'package:home_plate/Constants/constants.dart';
import 'package:home_plate/Repository/repository.dart';
import 'package:intl/intl.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import '../../Model/Order/order_model.dart';
import '../../Navigation/Navigate.dart';
import '../../Router/routes.dart';
import 'Widgets/custom_nav_drawer.dart';
import 'Widgets/date_appbar.dart';
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
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      fetchProfile();
    });
  }

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
            child: DateBarAppbar(
              selectedDate: selectedDate,
              updateDate: (val) {
                setState(() {
                  selectedDate = val;
                });
              },
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
              FutureBuilder<List<OrderModel>>(
                builder: (context, data) {
                  if (data.hasError) {
                    return const Center(child: Text("Something went wrong"));
                  }
                  if (data.hasData) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final item = data.data![index];
                        return OrderCard(item: item);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 1.5.h,
                        );
                      },
                      itemCount: (data.data ?? []).length,
                    );
                  }
                  return Center(
                    child: SizedBox(
                      height: 10.h,
                      child: const CircularProgressIndicator(
                        color: Constants.secondaryColor,
                      ),
                    ),
                  );
                },
                future: fetchOrders(context),
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

  Future<List<OrderModel>> fetchOrders(context) async {
    final response = await ApiProvider.instance
        .updateLatLongAndGetListOfOrdersForDriver(13, 45.6346186, -73.7949733,
            selectedDate);
    if (response.success ?? false) {
      debugPrint("fetched1 ${response.orders ?? []}");
      Provider.of<Repository>(context, listen: false)
          .setOpportunities(response.orders ?? []);
      return response.orders ?? [];
    } else {
      debugPrint("fetched2 ${response.orders ?? []}");
      return [];
    }
  }
  fetchProfile() async{
    final response = await ApiProvider.instance.getMyDetails();
    if (response.success??false){
        Provider.of<Repository>(context,listen: false).setProfileModel(response.data!);
    }else{

    }
  }
}
