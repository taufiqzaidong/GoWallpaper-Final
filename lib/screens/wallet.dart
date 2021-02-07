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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.purple[400],
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Balance of Your Account:",
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Center(
                  child: Text(
                    "RM 20.00",
                    style: TextStyle(fontSize: 45, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 60,
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.purple[400],
                  child: Text('Withdraw'),
                  onPressed: () {},
                )
              ],
            )));
  }
}
