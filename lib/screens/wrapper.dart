import 'package:gowallpaper/models/user.dart';
import 'package:gowallpaper/screens/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:gowallpaper/screens/select.dart';
import 'package:provider/provider.dart';
//import 'package:gowallpaper/screens/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserId>(context);

    //return either home or authenticate
    if (user == null) {
      return Authenticate();
    } else {
      return SelectPage();
    }
  }
}
