import 'package:flutter/material.dart';
import 'dart:io';
import 'package:gowallpaper/bloc/theme.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

class ShowFileImage extends StatefulWidget {
  final File image;
  ShowFileImage({this.image});

  @override
  _ShowFileImageState createState() => _ShowFileImageState();
}

class _ShowFileImageState extends State<ShowFileImage> {
  CollectionReference imgRef;
  firebase_storage.Reference ref;

  bool uploading = false;
  double val = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme(),
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "Upload ",
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: 'Bebas')),
                TextSpan(
                    text: "Photo",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 25, fontFamily: 'Bebas')),
              ]),
            ),
          ),
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  Container(
                    child: Image(
                      height: 300,
                      width: 700,
                      image: FileImage(widget.image),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(width: 20),
                      RaisedButton(
                        child: Text('Upload'),
                        onPressed: () {
                          setState(() {
                            uploading = true;
                          });
                          uploadFile()
                              .whenComplete(() => Navigator.of(context).pop());
                        },
                      )
                    ],
                  ),
                ],
              ),
              uploading
                  ? Center(
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [CircularProgressIndicator()],
                    ))
                  : Container(),
            ],
          )),
    );
  }

  Future uploadFile() async {
    ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/${Path.basename(widget.image.path)}');

    await ref.putFile(widget.image).whenComplete(() async {
      await ref.getDownloadURL().then((value) {
        imgRef.add({'url': value});
      });
      showAlertDialog(context);
    });
  }

  @override
  void initState() {
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('imageURLs');
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title:
          Text("Photo Successfully Uploaded", style: TextStyle(fontSize: 18)),
      content: Text('Tap screen to close',
          style: TextStyle(color: Colors.grey[700])),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
