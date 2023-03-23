// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({Key? key}) : super(key: key);

  @override
  _ConvertLatLangToAddressState createState() =>
      _ConvertLatLangToAddressState();
}

class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {
  String stAddress = '';
  String stloc = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(stAddress),
          Text(stloc),
          GestureDetector(
              onTap: () async {
                List<Location> locations =
                    await locationFromAddress("Gronausestraat 710, Enschede");
                List<Placemark> placemarks =
                    await placemarkFromCoordinates(52.2165157, 6.9437819);

                setState(() {
                  stAddress = locations.last.longitude.toString() +
                      " " +
                      locations.last.latitude.toString();
                  stloc = placemarks.reversed.last.country.toString() +
                      " " +
                      placemarks.reversed.last.locality.toString() +
                      " " +
                      placemarks.reversed.last.street.toString() +
                      " ";
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(color: Colors.green),
                  child: Center(
                    child: Text('Convert'),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
