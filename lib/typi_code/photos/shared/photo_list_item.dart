/*
 * Created with IntelliJ IDEA
 * Package: typi_code.photos.shared
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 24/06/2022 - 17:02
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:simple_auth_1/utils/logger.dart';

import 'package:simple_auth_1/models/photo.dart';
import 'my_cached_network_image.dart';


class PhotoListItem extends StatelessWidget {
  PhotoListItem(this.photo, {Key? key}) : super(key: key);

  Photo photo;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    dLog("screenWidth $screenWidth");
    return InkWell(
      onTap: () {
        eLog("click vao hinh ${photo.thumbnailUrl}");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Hero(tag: photo.thumbnailUrl!, child: MyCachedNetworkImage(photo.url!)),



            SizedBox(
              width: screenWidth -
                  100 /*width of image*/ -
                  2 * 8 /*padding of start & end*/,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: FittedBox(
                      child: Text(
                        photo.title!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(photo.title!,
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${photo.id}' ' ${photo.albumId}',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}