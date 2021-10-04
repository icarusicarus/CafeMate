import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Completer<GoogleMapController> _controller = Completer();
// BitmapDescriptor _markerIcon = 0;

final CameraPosition _kGooglePlex = CameraPosition(
  target: LatLng(35.2342618355783, 129.08887318491156),
  zoom: 15.0,
);

// void initState() {
//   BitmapDescriptor.fromAssetImage(
//           ImageConfiguration(size: Size(8, 8)), 'assets/images/뜨아아로고_사각.png')
//       .then((onValue) {
//     _markerIcon = onValue;
//   });
// }

Set<Marker> _createMarker() {
  return <Marker>[
    Marker(
        markerId: MarkerId("Test"),
        position: LatLng(35.2342618355783, 129.08887318491156),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: "부산커피",
        )),
  ].toSet();
}

Widget CafeMapInfo() {
  return Container(
    margin: const EdgeInsets.only(top: 10.0, bottom: 30.0),
    width: double.infinity,
    height: 200,
    child: GoogleMap(
      mapType: MapType.normal,
      markers: _createMarker(),
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      compassEnabled: true,
      zoomGesturesEnabled: true,
      rotateGesturesEnabled: true,
      scrollGesturesEnabled: true,
      tiltGesturesEnabled: true,
    ),
  );
}
