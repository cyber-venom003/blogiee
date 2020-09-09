import 'dart:io';

import 'package:blog_app/crud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {

  String author, title, desc;

  CrudMethods crudMethods = CrudMethods();

  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Blog',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'iee',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.file_upload), onPressed: null)
          ],
        ),
        body: GestureDetector(
          onTap: (){
            getImage();
          },
          child: _image != null ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.file(_image,fit: BoxFit.cover),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            height: 200,
            width: MediaQuery.of(context).size.width,
          ): Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Icon(Icons.add_a_photo, color: Colors.black45),
                ),
                SizedBox(height: 15.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(hintText: 'Author Name'),
                        onChanged: (value){
                          author = value;
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: 'Title'),
                        onChanged: (value){
                          title = value;
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: 'Description'),
                        onChanged: (value){
                          desc = value;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
