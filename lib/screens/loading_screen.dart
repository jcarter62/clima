import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location? loc;
  String apiData = '';

  @override
  void initState() {
    super.initState();
    loc = Location();
//    loc!.getCurrentLocation();
  }

  void getData() async {
    double? lat;
    double? lon;
    String getstr = 'https://api.openweathermap.org/data/2.5/onecall?';

    if ( loc != null ) {
      lat = loc!.latitude;
      lon = loc!.longitute;


      getstr = 'https://api.openweathermap.org/data/2.5/weather' +
               '\?lat=$lat\&lon=$lon\&appid=$kApikey';

      // api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

      Response response = await get(Uri.parse(getstr));
      if (response.statusCode == 200) {
        apiData = response.body;
        print(response.body);
      } else {
        print(response.statusCode);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    print('a');
    this.getData();
    print('b');

    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
              apiData

          )
        ),
      )
      // body: Center(
      //   child: RaisedButton(
      //     onPressed: () {
      //       getLocation();
      //       //Get the current location
      //     },
      //     child: Text('Get Location'),
      //   ),
      // ),
    );
  }
}
