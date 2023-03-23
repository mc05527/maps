import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(24.905451, 67.138541),
    zoom: 14.4746,
  );

  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(24.905451, 67.138541),
        infoWindow: InfoWindow(title: 'My Location')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(24.9080351, 67.1395017),
        infoWindow: InfoWindow(title: 'Farhan Biryani')),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(24.938391271089696, 67.10047808089949),
        infoWindow: InfoWindow(title: 'Saylani Welfare Trust')),
    Marker(
        markerId: MarkerId('4'),
        position: LatLng(24.908845709248975, 67.114835560098),
        infoWindow: InfoWindow(title: 'JDC Dastar Khwan')),
    Marker(
        markerId: MarkerId('5'),
        position: LatLng(24.89758857105308, 67.0549977214739),
        infoWindow: InfoWindow(title: 'Ansar Burney Welfare Trust')),
    Marker(
        markerId: MarkerId('6'),
        position: LatLng(24.91779307706726, 67.09780780374518),
        infoWindow: InfoWindow(title: 'Chhipa Welfare Services')),
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_marker),
          mapType: MapType.normal,
          compassEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_disabled_outlined),
        onPressed: () async {
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: LatLng(24.905451, 67.138541), zoom: 14)));
          setState(() {});
        },
      ),
    );
  }
}
