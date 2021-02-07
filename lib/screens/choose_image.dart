import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:gowallpaper/views/show_image.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.purple[400],
                icon: Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
                onPressed: () {
                  chooseImageCamera();
                }, //camera
                label: Text('Camera', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.purple[400],
                icon: Icon(
                  Icons.folder,
                  color: Colors.white,
                ),
                label: Text('File', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  chooseImageGallery();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  chooseImageGallery() async {
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

  chooseImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
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
