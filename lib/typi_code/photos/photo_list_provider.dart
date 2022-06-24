

import 'package:simple_auth_1/commons/base_load_more_refresh_provider.dart';

import '../../api/photo_api.dart';
import '../photo.dart';

class PhotoListProvider extends BaseLoadMoreRefreshProvider<Photo> {


  void loadDetail(int photoId) async {

    PhotoApi().getPhoto(photoId).then((value) {
      //isLoading = false;
      //comment = value.item1;
      // notifyListeners();
    });


  }


  @override
  void loadData(int page) async {

    PhotoApi().getPhotoList(page: page, offset: 10).then((value) {
      if (value != null) {
        onLoadSuccess(page, value);
      } else {
        onLoadFail("Load du lieu bi loi");
      }
    });


  }

}