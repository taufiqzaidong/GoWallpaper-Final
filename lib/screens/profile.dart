import 'package:flutter/material.dart';
import 'package:gowallpaper/screens/help.dart';
import 'package:gowallpaper/screens/location.dart';
import 'package:gowallpaper/bloc/theme.dart';
import 'package:gowallpaper/screens/wallet.dart';
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
    return Scaffold(
      body: new Center(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/profile1.png',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
            Text(
              'User Name',
              style: TextStyle(fontFamily: 'Bebas', fontSize: 30),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Colors.purple[400],
              textColor: Colors.white,
              child: Text('Wallet'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Wallet()),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Colors.purple[400],
              textColor: Colors.white,
              child: Text('Location'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Location()),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Colors.purple[400],
              textColor: Colors.white,
              child: Text('Help'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Help()),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Colors.purple[400],
              textColor: Colors.white,
              child: Text('Log Out'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
      )),
    );
  }
}
