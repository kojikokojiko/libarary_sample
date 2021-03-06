
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageGallarySaverWidget extends StatefulWidget {
  const ImageGallarySaverWidget({Key? key}) : super(key: key);

  @override
  ImageGallarySaverWidgetState createState() =>
      ImageGallarySaverWidgetState();
}

class ImageGallarySaverWidgetState extends State<ImageGallarySaverWidget> {
  final GlobalKey _globalKey = GlobalKey();
  String url =
      'https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg';

  _toastInfo(String info) {
    Fluttertoast.showToast(msg: info, toastLength: Toast.LENGTH_LONG);
  }

  _getHttp() async {
    var response = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    _toastInfo("$result");
  }

  _saveScreen() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      _toastInfo(result.toString());
    }
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    _toastInfo(info);
  }

  @override
  void initState() {
    super.initState();

    _requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        "Save Gallary Image Saver\n???\nCachedNetworkImage ",
        style: TextStyle(fontSize: 20),
      ),
      RepaintBoundary(
        key: _globalKey,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 15),
        width: 200,
        height: 44,
        child: ElevatedButton(
          onPressed: _saveScreen,
          child: const Text("Save Local Image"),
        ),
      ),
      const SizedBox(height: 20,),
      const Text("CachedNetworkImage???????????????",),
      CachedNetworkImage(
        imageUrl: url,
        progressIndicatorBuilder: (_, url, download) {
          if (download.progress != null) {
            final percent = download.progress! * 100;
            return Text("$percent% done loading");
          }
          return Text("Loaded $url");
        },
      ),
      Container(
        padding: const EdgeInsets.only(top: 15),
        width: 200,
        height: 44,
        child: ElevatedButton(
          onPressed: _getHttp,
          child: const Text("Save network image"),
        ),
      ),
    ]);
  }
}
