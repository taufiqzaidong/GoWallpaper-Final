import 'package:flutter/material.dart';
import 'package:gowallpaper/widgets/title_appbar.dart';
import 'package:provider/provider.dart';
import 'package:gowallpaper/bloc/theme.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: titleAppBar('Customer ', 'Service'),
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.purple[400],
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

          //backgroundColor: Colors.grey[600],
          body: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Submit your problem",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  SizedBox(
                    height: 16,
                    width: 100,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ('Problem faced'),
                      fillColor: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                    width: 100,
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.purple[400],
                    child: Text('Submit'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ))),
    );
  }
}
