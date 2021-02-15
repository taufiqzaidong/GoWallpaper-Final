import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gowallpaper/screens/help.dart';
import 'package:gowallpaper/screens/location.dart';
import 'package:gowallpaper/services/auth.dart';
import 'package:gowallpaper/views/fingerprint_view.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final usersRef = FirebaseFirestore.instance.collection('Users');
  final FirebaseAuth auth = FirebaseAuth.instance;
  String uid = '';
  @override
  void initState() {
    final User user = auth.currentUser;
    uid = user.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
        body: new Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _circleAvatar(),
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
            FutureBuilder<DocumentSnapshot>(
              future: usersRef.doc(uid).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data = snapshot.data.data();
                  return Text(data['email'].toString(),
                      style: TextStyle(
                          //fontFamily: 'Bebas',
                          fontSize: 15,
                          color: Colors.grey));
                }

                return Text("loading");
              },
            ),
            SizedBox(
              height: 15,
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 13,
              child: RaisedButton.icon(
                icon: Icon(Icons.wallet_membership),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.purple[400],
                textColor: Colors.white,
                label: Text('Wallet'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Fingerprint()),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 13,
              child: RaisedButton.icon(
                icon: Icon(Icons.location_city),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.purple[400],
                textColor: Colors.white,
                label: Text('Location'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Location()),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 13,
              child: RaisedButton.icon(
                icon: Icon(Icons.help),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.purple[400],
                textColor: Colors.white,
                label: Text('Help'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Help()),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 13,
              child: RaisedButton.icon(
                icon: Icon(Icons.logout),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.purple[400],
                textColor: Colors.white,
                label: Text('Log Out'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _circleAvatar() {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.width / 3,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 4),

        shape: BoxShape.circle,
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/avatar.jpg'),
        ), // Decoration image
      ), // Box decoration
    ); // Container
  }
}
