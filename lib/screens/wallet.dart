import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wallet'),
          backgroundColor: Colors.purple[400],
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
                  height: 200,
                  width: 100,
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
