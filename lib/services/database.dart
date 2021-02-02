import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gowallpaper/models/user.dart';
import 'package:gowallpaper/services/auth.dart';

final CollectionReference users =
    FirebaseFirestore.instance.collection('Users');
FirebaseAuth auth = FirebaseAuth.instance;
String uid = auth.currentUser.uid.toString();
final firestoreInstance = FirebaseFirestore.instance;

Future<void> userSetup(String displayName) async {
  users.doc(uid).set({'displayName': displayName});
  return;
}

String getUsersName(String firebaseUid) {
  //var firebaseUser = FirebaseAuth.instance.currentUser;
  String passName;
  firestoreInstance
      .collection('Users')
      .doc(firebaseUid.toString())
      .get()
      .then((value) {
    passName = value.data()['displayName'].toString();
  });
  print(passName);
  return passName;
}
