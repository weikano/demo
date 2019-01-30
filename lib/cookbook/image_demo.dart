import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageFadeIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(),
        ),
        Center(
          child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  'https://flutterchina.club/tutorials/layout/images/lakes.jpg'),
        )
      ],
    );
//    return FadeInImage(placeholder: kTransparentImage, image: null);
  }
}

class ImageCacheDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        placeholder: CircularProgressIndicator(),
        imageUrl: 'https://flutterchina.club/tutorials/layout/images/lakes.jpg',
        errorWidget: Icon(
          Icons.error,
          color: Colors.red,
        ),
      ),
    );
  }
}
