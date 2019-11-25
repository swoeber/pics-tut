import 'package:flutter/material.dart';
import '../models/Image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: <Widget>[
          Image.network(image.url),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(image.title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
          ),
        ],
      ),
    );
  }
}
