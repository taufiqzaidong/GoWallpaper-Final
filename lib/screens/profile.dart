import 'package:flutter/material.dart';
import 'package:gowallpaper/screens/fingerprint.dart';
import 'package:gowallpaper/screens/help.dart';
import 'package:gowallpaper/screens/location.dart';
import 'package:gowallpaper/bloc/theme.dart';
import 'package:provider/provider.dart';
import 'package:gowallpaper/services/auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    final AuthService _auth = AuthService();
    return MaterialApp(
      theme: theme.getTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: new Center(
              child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 25),
            Image.asset(
              'assets/profile1.png',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
              textColor: Colors.white,
              color: Colors.purple,
              child: Text('Wallet'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Wallet()),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.purple,
              child: Text('Location'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Location()),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.purple,
              child: Text('Help'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Help()),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.purple,
              child: Text('Log Out'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
      ))),
