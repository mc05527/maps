import 'package:custom_info_window/custom_info_window.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomerMarkerInfoWindow extends StatefulWidget {
  const CustomerMarkerInfoWindow({Key? key}) : super(key: key);

  @override
  _CustomerMarkerInfoWindowState createState() =>
      _CustomerMarkerInfoWindowState();
}

class _CustomerMarkerInfoWindowState extends State<CustomerMarkerInfoWindow> {
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _LatLang = [
    LatLng(24.904639131160963, 67.13781565767198),
    LatLng(24.90813755639508, 67.13913365268503)
  ];

  @override
  void initState() {
    super.initState();
  }

  loadData() {
    for (int i = 0; i < _LatLang.length; i++) {
      _markers.add(
        Marker(
            markerId: MarkerId(i.toString()),
            icon: BitmapDescriptor.defaultMarker,
            position: _LatLang[i],
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                  Text('YO'), _LatLang[i]);
            }),
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Info Window Example'),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(24.904639131160963, 67.13781565767198),
              zoom: 14,
            ),
            markers: Set<Marker>.of(_markers),
            onTap: (position) {},
            onMapCreated: (GoogleMapController controller) {
              _customInfoWindowController.googleMapController = controller;
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 300,
            offset: 35,
          )
        ],
      ),
    );
  }
}
