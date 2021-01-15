import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/constants.dart';
import 'package:flutter_covid_app_lab_1/model/country_cases.dart';
import 'package:flutter_covid_app_lab_1/vms/vm_covid19.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//author: ting sen
class NearbyScreen extends StatefulWidget {
  NearbyScreen({Key key}) : super(key: key);

  @override
  State<NearbyScreen> createState() => NearbyScreenState();
}

class NearbyScreenState extends State<NearbyScreen> {
  Set<Marker> _markers = HashSet<Marker>();
  Timer timer;
  GoogleMapController googleMapController;
  List<CountryCases> countryCases = [];
  List<Marker> addMarkers = [];

  @override
  void initState() {
    super.initState();
    // _getData();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _countdown();
    });
  }

  // Future<void> _getData() async {
  //   countryCases = await Covid19VM().fetchCountriesCovid19Cases();
  // }

  Future<void> _countdown() async {
    countryCases = await Covid19VM().fetchCountriesCovid19Cases();
    timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      countryCases = await Covid19VM.of(context).fetchCountriesCovid19Cases();
    });
  }

  setMarkers(dynamic list) {
    for (dynamic element in list) {
      addMarkers.add(
        Marker(
          markerId: MarkerId(element.id.toString()),
          position: LatLng(element.lat, element.long),
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                Size size = MediaQuery.of(context).size;
                return Container(
                  height: size.height * 0.3,
                  color: kPrimaryColorLight,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          '${element.country}\n',
                          style: TextStyle(
                            color: textWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Today Cases: ${element.todayCases}',
                          style: TextStyle(
                            color: textWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Active Cases: ${element.active}',
                          style: TextStyle(
                            color: textWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Recovered: ${element.recovered}',
                          style: TextStyle(
                            color: textWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Death: ${element.death}',
                          style: TextStyle(
                            color: textWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          child: const Text('Close'),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          infoWindow: InfoWindow(
            title: element.country,
          ),
          draggable: false,
        ),
      );
    }
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      googleMapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          FutureBuilder(
            future: _countdown(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (countryCases.isNotEmpty) {
                setMarkers(countryCases);
                _markers.addAll(addMarkers);
                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(40.7128, -74.0060),
                    zoom: 3,
                  ),
                  onMapCreated: _onMapCreated,
                  markers: _markers,
                );
              } else {
                return Container(
                  child: Center(
                    child: Text("Loading map. Please Wait ... ..."),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
