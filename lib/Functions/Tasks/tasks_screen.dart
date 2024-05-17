import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_plate/Constants/constants.dart';
import 'package:home_plate/Navigation/Navigate.dart';
import 'package:home_plate/Router/routes.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sized_icon_button/sized_icon_button.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'Widgets/go_to_home.dart';
import 'Widgets/timeline_custom.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key, required this.id});

  final int id;

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  int selectedTile = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: AutoSizeText.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Your Tasks ",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black87,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextSpan(
                text: "#1109123",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black54,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Constants.bgColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.seventhColor,
        onPressed: () {
          openMapsSheet(context);
        },
        child: const Icon(
          Icons.map,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Constants.bgColor,
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 2.h,
          ),
          child: TimeLineCustom(
            selected: selectedTile,
            updateSelected: (int val) {
              setState(() {
                selectedTile = val;
              });
            },
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
