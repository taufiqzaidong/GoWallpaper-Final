import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gowallpaper/screens/help.dart';
import 'package:gowallpaper/screens/location.dart';
import 'package:gowallpaper/screens/wallet.dart';
import 'package:provider/provider.dart';
import 'package:gowallpaper/services/auth.dart';
import 'package:gowallpaper/services/database.dart';
import 'package:gowallpaper/models/user.dart';

final usersRef = FirebaseFirestore.instance.collection('Users');
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final uid = user.uid;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
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
            FutureBuilder<DocumentSnapshot>(
              future: usersRef.doc(uid).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data = snapshot.data.data();
                  return Text(data['displayName'].toString(),
                      style: TextStyle(fontFamily: 'Bebas', fontSize: 30));
                }

                return Text("loading");
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
