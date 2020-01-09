import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../service/map_service.dart' as map_service;

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      InfoWindow infoWindow =
      InfoWindow(title: "Location" + _markers.length.toString());
      _markers['banhxeo'] = Marker(
        markerId: MarkerId(_markers.length.toString()),
        infoWindow: infoWindow,
        position: LatLng(20.999151, 105.818176),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),);
    });
  }

  MapType _currentMapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
              mapType: _currentMapType,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: const LatLng(20.999151, 105.818176),
                zoom: 17,
              ),
              markers: _markers.values.toSet(),
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              mapToolbarEnabled: true,
              compassEnabled: true,
            ),
          ],
        ),
      ),
    );
  }

  Set<Marker> markers = Set();

  void _onAddMarkerButtonPressed() {
    InfoWindow infoWindow =
    InfoWindow(title: "Location" + markers.length.toString());

    Marker marker = Marker(
      markerId: MarkerId(markers.length.toString()),
      infoWindow: infoWindow,
      position: LatLng(20.999151, 105.818176),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    setState(() {
      markers.add(marker);
    });
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }
}
