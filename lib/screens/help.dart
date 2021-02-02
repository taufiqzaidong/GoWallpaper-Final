import 'package:flutter/material.dart';
import 'package:gowallpaper/widgets/title_appbar.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: titleAppBar('Your', 'HelpService'),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.grey[600],
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Text(
                  "how can i help you?",
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
                    labelText: ('Any problem'),
                    fillColor: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 16,
                  width: 100,
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.purple[300],
                  child: Text('Submit'),
                  onPressed: () {},
                )
              ],
            )));
  }
}
