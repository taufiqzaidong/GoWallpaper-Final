import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String _locationMessage = "";

  void _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Update Location"),
          backgroundColor: Colors.purple[400],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/city.png'), fit: BoxFit.cover)),
          padding: EdgeInsets.symmetric(vertical: 140.0, horizontal: 160.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 100),
              RaisedButton(
                child: Text(
                  ' Location',
                ),
                onPressed: () {
                  _getCurrentLocation();
                },
              ),
              Text(_locationMessage),
            ],
          ),
        ),
      ),
    );
  }
}

//child: Column(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//FlatButton(
//onPressed: () {
//_getCurrentLocation();
//},
//color: Colors.purple[400],
//child: Text("Find Location")),/Text(_locationMessage),
//]),
