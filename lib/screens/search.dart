import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);

    return Scaffold(
      body: (currentPosition != null)
          ? GoogleMap(
              initialCameraPosition: CameraPosition(
                target:
                    LatLng(currentPosition.latitude, currentPosition.longitude),
                zoom: 16.0,
              ),
              markers: Set<Marker>.of([
                Marker(
                  markerId: MarkerId("current_position"),
                  position: LatLng(
                      currentPosition.latitude, currentPosition.longitude),
                  infoWindow: InfoWindow(
                    title: "Current Position",
                  ),
                ),
              ]),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
