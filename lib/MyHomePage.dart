import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File ?_image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My camera app'),
      ),
      body: Center(
        // child: Text("Ok working"),
        child: _image == null ?  Text('No Image.'):Image.file(_image!) ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _optionsDialogBox,
        child: Icon(Icons.add_a_photo),
        tooltip: 'Open Camera',
      ),
    );
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Take a picture',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    onTap: openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  GestureDetector(
                    child: Text('Select image from gallery',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }

// camera method
   Future openCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image clicked.');
      }
    });
  }
  // Future openCamera() async {
  //   PickedFile? file = await ImagePicker().getImage(
  //       source: ImageSource.camera);

  //   if (file != null) {
  //       _image = File(file.path);
  //   }
  //   else{
  //     print("nahi open hoga camera");
  //   }
  // }

// gallery method
  Future openGallery() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  // Future openGallery() async {
  //   PickedFile? file = await ImagePicker().getImage(
  //       source: ImageSource.gallery, maxHeight: 200.0, maxWidth: 200.0);
  //   if (file != null) {
  //       _image = File(file.path);
  //   }
  //   else{
  //     print("nahi open hoga gallery");
  //   }
  // }

}
