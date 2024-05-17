import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Constants/assets.dart';
import '../Constants/constants.dart';

class PickAddress extends StatefulWidget {
  const PickAddress({super.key});

  @override
  State<PickAddress> createState() => _PickAddressState();
}

class _PickAddressState extends State<PickAddress> {
  String address="";

  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  int _markerIdCounter = 0;
  // Set<Circle> circles = {};
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  GoogleMapController? controller;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context,address);
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: AutoSizeText(
          "Pick your address",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Constants.secondaryColor,
            fontSize: 18.sp,
          ),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: false,
        markers: Set<Marker>.of(_markers.values),
        myLocationButtonEnabled: true,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController temp_controller) async {
          _controller.complete(temp_controller);
          controller = temp_controller;
          setInitial(temp_controller);
        },
        onLongPress: (loc){
          updateMap(loc);
        },
        onCameraMove: null,
        // circles: circles,
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
  String _markerIdVal({bool increment = false}) {
    String val = 'marker_id_$_markerIdCounter';
    if (increment) _markerIdCounter++;
    return val;
  }
  Future<void> setInitial(GoogleMapController controller) async {
    final loc = await _determinePosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(loc.latitude, loc.longitude);
    final mark = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(20, 20)), Assets.car);
    if (const LatLng(37.42796133580664, -122.085749655962) != null) {
      MarkerId markerId = MarkerId(_markerIdVal());
      LatLng position = LatLng(loc.latitude, loc.longitude);
      Marker marker = Marker(
        markerId: markerId,
        position: position,
        draggable: false,
        icon: mark,
      );
      setState(() {
        _markers[markerId] = marker;
      });
    }
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(loc.latitude, loc.longitude),
          zoom: 17,
        ),
      ),
    );
    setState(() {
      address = "${placemarks[0].subLocality}, ${placemarks[0].locality}, ${placemarks[0].subAdministrativeArea}}";
    });
  }
  Future<void> updateMap(LatLng loc) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(loc.latitude, loc.longitude);
    final mark = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(20, 20)), Assets.car,);
    MarkerId markerId = MarkerId(_markerIdVal());
    LatLng position = LatLng(loc.latitude, loc.longitude);
    Marker marker = Marker(
      markerId: markerId,
      position: position,
      draggable: false,
      icon: mark,
    );
    setState(() {
      _markers[markerId] = marker;
    });
    controller?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(loc.latitude, loc.longitude),
          zoom: 17,
        ),
      ),
    );
    setState(() {
      address = "${placemarks[0].subLocality}, ${placemarks[0].locality}, ${placemarks[0].subAdministrativeArea}}";
    });
  }
}
