/*
 * Created with IntelliJ IDEA
 * Package: typi_code.photos.shared
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 24/06/2022 - 17:04
 * To change this template use File | Settings | File Templates.
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCachedNetworkImage extends StatelessWidget {
  MyCachedNetworkImage(this.image, {Key? key,}) : super(key: key);

  String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
        ),
      ),
      placeholder: (context, url) => const SizedBox(
          width: 10,
          height: 10,
          child: CircularProgressIndicator(strokeWidth: 1,)),
      errorWidget: (context, url, error) => const SizedBox(
          width: 100,
          height: 100,
          child: Icon(Icons.error, size: 70,)),
    );
  }
}