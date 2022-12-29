import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class UserPage extends StatelessWidget {
  List<Marker> _markers = [];
  Position? _currentPosition;
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  // Placemark _nearestHospital;

  Future<Position> _determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _determinePosition(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                    zoom: 14.0,
                  ),
                  markers:Set.of([
                    Marker(
                      markerId: MarkerId('current_location'),
                      position: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                    ),
                  ]),
                  onMapCreated: (GoogleMapController controller) {
                    _controller!.complete(controller);
                  },
                  // markers: _markers,
                ),
              );

            // return Text("Location: ${snapshot.data!.latitude}, ${snapshot.data!.longitude}");
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            // If the location is not yet available, show a loading indicator
            return const Center(child: CircularProgressIndicator());
          },
        ),
      )
      ,
    );
  }
}
