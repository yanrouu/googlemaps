import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_loc/screens/search.dart';
import 'package:test_loc/services/geolocator_services.dart';
import 'package:test_loc/services/places_service.dart';

import 'models/place.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final locatorService = GeoLocatorService();
  final placesService = PlacesService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(
          create: (context) => Geolocator.getCurrentPosition(),
          initialData: Position(
            latitude: 3.065149392945436,
            longitude: 101.60123225909783,
            timestamp: DateTime.now(),
            accuracy: 20.0,
            altitude: 0.0,
            heading: 0.0,
            speed: 0.0,
            speedAccuracy: 0.0,
            isMocked: false,
          ),
        ),
        ProxyProvider<Position, Future<List<Place>>>(
          update: (context, position, places) {
            return placesService.getPlaces(
                position.latitude, position.longitude);
          },
        )
      ],
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Search(),
      ),
    );
  }
}
