import 'package:blog_app/upload_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Blogiee());
}

class Blogiee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blogiee',
      home: BlogPage(),
      theme: ThemeData.dark(),
    );
  }
}

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
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
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: FloatingActionButton(
          hoverColor: Colors.white,
          child: Icon(Icons.add_a_photo),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => UploadPage()));
        },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}



