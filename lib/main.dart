import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Location(),
    );
  }
}

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  var locationMessage = "";
  void getCurrentLocation() async {
    var pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lpos = await Geolocator.getLastKnownPosition();
    print(lpos);
    var lat = pos.latitude;
    var long = pos.longitude;
    setState(() {
      locationMessage = "latitude:$lat\nLongitude: $long";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("location"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: 46.0,
              color: Colors.blue,
            ),
            SizedBox(
              height: 10,
            ),
            Text(locationMessage),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                getCurrentLocation();
              },
              child: Text(
                "get location",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
