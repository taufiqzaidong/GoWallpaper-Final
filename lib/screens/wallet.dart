import 'package:flutter/material.dart';
import 'package:gowallpaper/widgets/title_appbar.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: titleAppBar('Your', 'Wallet'),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.grey[600],
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Text(
                  "Here your balance for your Account!!",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                SizedBox(
                  height: 16,
                  width: 100,
                ),
                Text(
                  "Total of your account:",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(
                  height: 100,
                  width: 60,
                ),
                Text(
                  "RM 20",
                  style: TextStyle(fontSize: 45, color: Colors.white),
                ),
                SizedBox(
                  height: 100,
                  width: 60,
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.purple[300],
                  child: Text('Withdraw'),
                  onPressed: () {},
                )
              ],
            )));
  }
}
