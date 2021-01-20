import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gowallpaper/bloc/theme.dart';
import 'package:gowallpaper/screens/home.dart';
import 'package:gowallpaper/screens/wrapper.dart';
import 'package:gowallpaper/models/user.dart';
import 'package:gowallpaper/services/auth.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.light()),
      child: MaterialApp(
          title: 'GoWallpaper',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
                bodyText1:
                    GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
              )),
          routes: {
            '/stream': (context) => Stream(),
            '/home': (context) => Home()
          },
          initialRoute: '/home'),
    );
  }
}

class Stream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserId>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
