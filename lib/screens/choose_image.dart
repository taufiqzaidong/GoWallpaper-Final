import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:gowallpaper/bloc/theme.dart';
import 'package:provider/provider.dart';

class ChooseImage extends StatefulWidget {
  @override
  _ChooseImageState createState() => _ChooseImageState();
}

class _ChooseImageState extends State<ChooseImage> {
  File _image;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: RaisedButton(
                onPressed: () {},
                child: Text('Camera'),
              ),
            ),
            Container(
              child: RaisedButton(
                child: Text('File'),
                onPressed: () {
                  chooseImage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile.path == null) retrieveLostData();
    setState(() {
      _image = File(pickedFile?.path);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShowFileImage(image: _image),
        ),
      );
    });
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image = File(response.file.path);
      });
    } else {
      print(response.file);
    }
  }
}

class ShowFileImage extends StatelessWidget {
  final File image;
  ShowFileImage({this.image});

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image(
                height: 300,
                width: 700,
                image: FileImage(image),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 20),
                RaisedButton(
                  child: Text('Upload'),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
