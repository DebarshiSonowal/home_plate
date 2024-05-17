import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_stack_widget/card_stack_widget.dart';
import 'package:card_stack_widget/widget/card_stack_widget.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_plate/Navigation/Navigate.dart';
import 'package:home_plate/Router/routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/constants.dart';
import '../HomePage/home_screen.dart';
import 'Widgets/bottom_sheet_order.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  int _markerIdCounter = 0;
@override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: GestureDetector(
        onTap: (){
          Navigation.instance.navigate(Routes.loginScreen);
        },
        child: const RejectButton(),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              markers: Set<Marker>.of(_markers.values),
              onMapCreated: _onMapCreated,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              myLocationEnabled: true,
              onCameraMove: (CameraPosition position) {
                if (_markers.length > 0) {
                  MarkerId markerId = MarkerId(_markerIdVal());
                  Marker? marker = _markers[markerId];
                  Marker updatedMarker = marker!.copyWith(
                    positionParam: position.target,
                  );

                  setState(() {
                    _markers[markerId] = updatedMarker;
                  });
                }
              },
            ),
          const Align(
              // bottom: 0,
              // top: 60.h,
              // right: 0.0,
              // left: 0.0,
            alignment: Alignment.bottomCenter,
              child: BottomSheetOrder(),
            ),
          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    final mark = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(20, 20)),
        "assets/images/car-placeholder.png");
    if (LatLng(37.42796133580664, -122.085749655962) != null) {
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

class RejectButton extends StatelessWidget {
  const RejectButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Constants.secondaryColor,width: 0.4.w),
      ),
     padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical:0.5.h,),
      child: FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cancel,size: 16.sp,color: Constants.secondaryColor,),
            const SizedBox(width: 4), // Add spacing
            Flexible(
              // Control text overflow
              child: Text(
                "REJECT",
                style:
                Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 15.sp,
                  color: Constants.secondaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

