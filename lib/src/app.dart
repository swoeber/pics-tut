import 'package:http/http.dart' show get;
import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'models/Image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];
  
  void fetchImage() async {
    counter++;
    final data =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    
    setState(() {
      images.add(ImageModel.fromJson(json.decode(data.body)));
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Let's see some images!"),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
