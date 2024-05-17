import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_plate/Constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../CommonWidget/help_button.dart';
import '../../Constants/assets.dart';
import '../../Navigation/Navigate.dart';
import '../../Router/routes.dart';
import 'Widgets/pickup_card.dart';

class LocatePickup extends StatefulWidget {
  const LocatePickup({super.key, required this.id});

  final int id;

  @override
  State<LocatePickup> createState() => _LocatePickupState();
}

class _LocatePickupState extends State<LocatePickup> {
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
        backgroundColor: Constants.bgColor,
        // iconTheme: const IconThemeData(
        //   color: Constants.primaryColor,
        // ),
        title: Column(
          children: [
            AutoSizeText.rich(TextSpan(
              children: [
                TextSpan(
                  text: "Pickup ",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.seventhColor,
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
            )),
          ],
        ),
        actions: const [
          HelpButton(
              // color: Constants.primaryColor,
              ),
        ],
      ),
      body: Container(
        color: Colors.white30,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
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
                    mapType: MapType.normal,
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
                        _add();
                      }
                    },
                    onLongPress: (val){
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
                    child: PickupBottomCard(),
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
                  Navigation.instance
                      .navigate(Routes.pickUpVerificationScreen, args: 0);
                },
                child: Text(
                  "REACHED PICKUP LOCATION",
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
      ),
    );
  }

  List<LatLng> _createPoints() {
    final List<LatLng> points = <LatLng>[];
    points.add(const LatLng(37.42796133580664, -122.085749655962));
    points.add(const LatLng(37.42796133580654, -122.085749655952));
    points.add(const LatLng(37.42796133580644, -122.085749655942));
    points.add(const LatLng(37.42796133580634, -122.085749655932));
    points.add(const LatLng(37.42796133580624, -122.085749655922));
    points.add(const LatLng(37.42796133580614, -122.085749655912));
    return points;
  }

  Future<void> _add() async {
    setState(() {
      _mapPolylines.clear();
      _polylineIdCounter=0;
    });
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.red,
      width: 5,
      points: _createPoints(),
    );
  debugPrint("Line added");
    setState(() {
      _mapPolylines[polylineId] = polyline;
    });
    LatLng position = const LatLng(37.42796133580664, -122.085749655962);
    // GoogleMapController controller = await _controller.future;
    // controller.animateCamera(
    //   CameraUpdate.newCameraPosition(
    //     CameraPosition(
    //       target: position,
    //       zoom: 5.0,
    //     ),
    //   ),
    // );
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

}
