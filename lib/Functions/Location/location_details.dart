import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:home_plate/Constants/constants.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../CommonWidget/help_button.dart';
import '../../Constants/assets.dart';
import '../../Navigation/Navigate.dart';
import '../../Router/routes.dart';
import 'Widgets/collection_from_section.dart';
import 'Widgets/delivery_card.dart';

class LocationDetails extends StatefulWidget {
  const LocationDetails({super.key, required this.id});

  final int id;

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Map<PolylineId, Polyline> _mapPolylines = {};
  int _polylineIdCounter = 1;
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  int _markerIdCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DELIVER",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Constants.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
            ),
            Text(
              "${Random.secure().nextInt(10000000)}${Random.secure().nextInt(10000000)}",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
            ),
          ],
        ),
        actions: [
          HelpButton(),
        ],
      ),
      body: Container(
        color: Constants.bgColor,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 1.w,
          vertical: 1.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              height: 80.5.h,
              child: Stack(
                children: [
                  GoogleMap(
                    padding: EdgeInsets.zero,
                    markers: Set<Marker>.of(_markers.values),
                    polylines: Set<Polyline>.of(_mapPolylines.values),
                    onMapCreated: _onMapCreated,
                    mapType: map.MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    myLocationEnabled: true,
                    onCameraMove: (CameraPosition position) {
                      if (_markers.isNotEmpty) {
                        MarkerId markerId = MarkerId(_markerIdVal());
                        Marker? marker = _markers[markerId];
                        Marker updatedMarker = marker!.copyWith(
                          positionParam: position.target,
                        );

                        setState(() {
                          _markers[markerId] = updatedMarker;
                        });
                        // _add();
                      }
                    },
                    onLongPress: (val) {
                      // debugPrint("onLongPress ${val.latitude} ${val.longitude}");
                      // //37.42904309705305 -122.08644468337299
                      // MarkerId markerId = MarkerId(_markerIdVal());
                      // // LatLng position = const LatLng(37.42796133580664, -122.085749655962);
                      // Marker marker = Marker(
                      //   markerId: markerId,
                      //   position: val,
                      //   draggable: false,
                      //   // icon: mark,
                      // );
                      // setState(() {
                      //   _markers[markerId] = marker;
                      // });
                    },
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: DeliveryCard(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 6.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.seventhColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  Navigation.instance.navigate(Routes.deliveryVerificationScreen,args: 0);
                },
                child: Text(
                  "REACHED DELIVERY LOCATION",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                ),
              ),
            ),
          ],
        ),
        // child: Column(
        //   children: [
        //     // Divider(
        //     //   color: Colors.grey.shade400,
        //     // ),
        //     SizedBox(
        //       height: 1.h,
        //     ),
        //     const CollectFromSection(),
        //     SizedBox(
        //       height: 1.h,
        //     ),
        //     const DeliveryCard(),
        //     // Divider(
        //     //   color: Colors.grey.shade400,
        //     // ),
        //     const Spacer(),
        //     SizedBox(
        //       height: 7.h,
        //       width: 100.w,
        //       child: ElevatedButton(
        //         style: ElevatedButton.styleFrom(
        //           backgroundColor:  Constants.seventhColor,
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(5),
        //           ),
        //         ),
        //         onPressed: () {
        //           Navigation.instance.navigate(Routes.deliveryVerificationScreen,args: 0);
        //         },
        //         child: Text(
        //           "REACHED DELIVERY LOCATION",
        //           style: Theme.of(context).textTheme.bodySmall?.copyWith(
        //             color: Constants.primaryColor,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 18.sp,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    final mark = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(20, 20)), Assets.car);
    if (const LatLng(37.42796133580664, -122.085749655962) != null) {
      MarkerId markerId = MarkerId(_markerIdVal());
      LatLng position = const LatLng(37.42796133580664, -122.085749655962);
      Marker marker = Marker(
        markerId: markerId,
        position: position,
        draggable: false,
        icon: mark,
      );
      setState(() {
        _markers[markerId] = marker;
      });

      Future.delayed(const Duration(seconds: 1), () async {
        GoogleMapController controller = await _controller.future;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: position,
              zoom: 17.0,
            ),
          ),
        );

      });
    }
  }

  String _markerIdVal({bool increment = false}) {
    String val = 'marker_id_$_markerIdCounter';
    if (increment) _markerIdCounter++;
    return val;
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
