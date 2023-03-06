import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_loc/screens/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<Position>(
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
