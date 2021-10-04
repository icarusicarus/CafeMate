import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

late GoogleMapController mapController;

void _onMapCreated(GoogleMapController controller) {
  mapController = controller;
}

Widget CafeMapInfo() {
  return Container(
    child: GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: const LatLng(35.23338143295065, 129.08910925767063),
        zoom: 2,
      ),
    ),
  );
}
