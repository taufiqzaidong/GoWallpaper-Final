import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gowallpaper/bloc/theme.dart';

class ChangeTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "Change ",
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'Bebas')),
              TextSpan(
                  text: "Theme",
                  style: TextStyle(
                      color: Colors.grey, fontSize: 25, fontFamily: 'Bebas')),
            ]),
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Center(
              child: Container(
                width: 300,
                height: 50,
                child: FlatButton(
                  color: Colors.purple[400],
                    child: Text('Light Theme',style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      _themeChanger.setTheme(ThemeData.light());
                      Navigator.pop(context);
                    }),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 300,
                height: 50,
                child: FlatButton(
                  color: Colors.purple[400],
                    child: Text('Dark Theme',style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      _themeChanger.setTheme(ThemeData.dark());
                      Navigator.pop(context);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
