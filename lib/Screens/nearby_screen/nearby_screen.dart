import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/model/country_cases.dart';
import 'package:flutter_covid_app_lab_1/vms/vm_covid19.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyScreen extends StatefulWidget {
  NearbyScreen({Key key}) : super(key: key);

  @override
  State<NearbyScreen> createState() => NearbyScreenState();
}

class NearbyScreenState extends State<NearbyScreen> {
  bool isLoading;
  Set<Marker> _markers = HashSet<Marker>();
  List<Marker> addMarkers;

  @override
  void initState() {
    super.initState();

    getData().then((countryCases) => setMarkers(countryCases));
  }

  setMarkers(List<CountryCases> countryCases) {
    for (CountryCases element in countryCases) {
      addMarkers.add(
        Marker(
          markerId: MarkerId(element.id.toString()),
          position: LatLng(element.lat, element.long),
          infoWindow: InfoWindow(
            title: element.country,
            snippet: 'Today Cases: ${element.todayCases}\n' +
                'Active Cases: ${element.active}\n' +
                'Recovered: ${element.recovered}\n' +
                'Death: ${element.death}',
          ),
        ),
      );
    }

    setState(() {
      _markers = addMarkers.toSet();
    });
  }

  Future<List<CountryCases>> getData() async {
    List<CountryCases> countryCases =
        await Covid19VM().fetchCountriesCovid19Cases();
    return countryCases;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(40.7128, -74.0060),
                    zoom: 12,
                  ),
                  onMapCreated: (GoogleMapController controller) {},
                  markers: _markers,
                );
              }),
        ],
      ),
    );
  }
}
