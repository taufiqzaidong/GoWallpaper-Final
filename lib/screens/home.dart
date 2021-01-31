import 'package:flutter/material.dart';
import 'package:gowallpaper/bloc/change_theme.dart';
import 'package:gowallpaper/bloc/theme.dart';
import 'package:provider/provider.dart';
import 'package:gowallpaper/widgets/title_appbar.dart';
import 'package:gowallpaper/services/auth.dart';
import 'package:gowallpaper/screens/profile.dart';
import 'package:gowallpaper/screens/mainhome.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:gowallpaper/screens/choose_image.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final tabs = [MainHome(), ChooseImage(), Profile()];

  Color iconColour(ThemeData iconTheme) {
    if (iconTheme == ThemeData.light()) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Colors.purple);
    final theme = Provider.of<ThemeChanger>(context);

    final AuthService _auth = AuthService();
    return MaterialApp(
      routes: {'/mainhome': (context) => MainHome()},
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: titleAppBar(),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            IconButton(
              color: iconColour(theme.getTheme()),
              icon: Icon(Icons.bedtime),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeTheme(),
                  ),
                );
              },
            )
          ],
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          //elevation: 0,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          //backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Camera'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
