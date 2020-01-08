import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../service/map_service.dart' as map_service;

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await map_service.getGoogleOffices();
//    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
//      }
    }
//    );
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );


//    return MaterialApp(
//      home: Scaffold(
//          appBar: AppBar(
//            title: Text('Maps Sample App'),
//            backgroundColor: Colors.green[700],
//          ),
//          body: Stack(
//            children: <Widget>[
//              GoogleMap(
//                  initialCameraPosition: CameraPosition(
//                      target: LatLng(-33.870840, 151.206286), zoom: 12))
//            ],
//          )),
//    );
//      return Scaffold(
//        body: GoogleMap(
////          onMapCreated: _onMapCreated,
//          mapType: MapType.hybrid,
//            onMapCreated:  (GoogleMapController controller) {
//              _controller.complete(controller);
//            },
//            initialCameraPosition: CameraPosition(
//              target: LatLng(37.42796133580664, -122.085749655962),
//              zoom: 14.4746,
////            target: const LatLng(0, 0),
////            zoom: 12,
//            ),
//            markers: _markers.values.toSet(),
//        ),
//      );
  }
}
