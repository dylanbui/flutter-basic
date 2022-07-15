/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 14/07/2022 - 15:59
 * To change this template use File | Settings | File Templates.
 */

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'package:simple_auth_1/utils/logger.dart';

import 'google_map_provider.dart';

class TestTileProvider implements TileProvider {

  static const int TILE_SIZE = 256;

  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {

    var _zoom = zoom ?? 17;

    // val url = "https://space.propzy.vn/tiles/vn_bandologioi/${zoom}/${x}/${y}.png"
    // zoom in 11..16
    var url = "https://space.propzy.vn/tiles/vn_logioi/$_zoom/$x/$y.png";
    if (_zoom >= 17 && _zoom <= 20) {
      url = "https://space.propzy.vn/tiles/vn_bandologioi/$_zoom/$x/$y.png";
    }

    wLog(url);
    try {
      wLog("1");
      final uri = Uri.parse(url);

      var a = NetworkAssetBundle(uri);


      wLog("2");
      final ByteData imageData = await NetworkAssetBundle(uri).load(url);
      wLog("3");
      final Uint8List bytes = imageData.buffer.asUint8List();

      wLog(url);
      return Tile(TILE_SIZE, TILE_SIZE, bytes);
    } catch (e) {
      eLog(e.toString());
      return TileProvider.noTile;
    }

  }

}

class GoogleMapPage extends BaseStateFulWidget {

  final String title = "GoogleMap Page";

  GoogleMapPage({Key? key, DbNoteRouter? router}) : super(key: key, router: router);

  @override
  State<StatefulWidget> createState() {
    return _GoogleMapPageState();
  }

}

class _GoogleMapPageState extends BaseState<GoogleMapPage, GoogleMapProvider> {


  late GoogleMapController mapController;
  late TileOverlay _tileOverlay;
  TestTileProvider testTileProvider = TestTileProvider();

  final LatLng _center = const LatLng(10.7651735,106.6691605);

  // final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


  @override
  void initState() {
    super.initState();
    createTileOverlay();
  }

  void createTileOverlay() {
    _tileOverlay = TileOverlay(
      tileOverlayId: const TileOverlayId('tile_overlay_1'),
      tileProvider: testTileProvider,
    );

    // if (_tileOverlay == null) {
    //   final TileOverlay tileOverlay = TileOverlay(
    //     tileOverlayId: const TileOverlayId('tile_overlay_1'),
    //     tileProvider: testTileProvider,
    //   );
    //   _tileOverlay = tileOverlay;
    // }
  }

  @override
  Widget getLayout(BuildContext context) {

    Set<TileOverlay> overlays = <TileOverlay>{_tileOverlay,};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Sample App'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 18.0,
        ),
        //tileOverlays: overlays,
        mapType: MapType.normal,
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        mapToolbarEnabled: false,
      ),
    );
  }
}