import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gowallpaper/bloc/theme.dart';
import 'package:gowallpaper/widgets/title_appbar.dart';
import 'package:provider/provider.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      theme: theme.getTheme(),
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/wp2.png'), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: titleAppBar('Your ', 'Location'),
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.purple[400],
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (_currentPosition != null)
                Text(
                  _currentAddress,
                  style: TextStyle(
                      color: Colors.white, fontSize: 50, fontFamily: 'Bebas'),
                  textAlign: TextAlign.center,
                ),
              Center(
                child: RaisedButton(
                  child: Text(
                    "Location",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.purple[400],
                  onPressed: () {
                    _getCurrentLocation();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}
