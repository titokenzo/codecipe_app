import 'package:codecipe/widgets/custom_app_bar.dart';
import 'package:codecipe/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMapa extends StatefulWidget {
  @override
  _MyMapaState createState() => _MyMapaState();
}

class _MyMapaState extends State<MyMapa> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: CustomAppBar(),
            body: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
            bottomNavigationBar: CustomBottomBar()));
  }
}
