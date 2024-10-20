import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapProvider with ChangeNotifier {
  final CameraPosition _kLake = const CameraPosition(
      bearing: 12.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  final Completer<GoogleMapController> _controller = Completer();

  List<Marker> markers = [];
  List<Marker> list = const [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(37.43296265331129, -122.08832357078792)
    )
  ];
  addMarker () {
    markers.addAll(list);
  }
  CameraPosition get kLake => _kLake;
  Completer<GoogleMapController> get controller => _controller;
}
