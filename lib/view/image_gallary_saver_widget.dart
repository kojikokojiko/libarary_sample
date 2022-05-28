import 'package:flutter/material.dart';


class ImageGallarySaverWidget extends StatefulWidget {
  const ImageGallarySaverWidget({Key? key}) : super(key: key);

  @override
  _ImageGallarySaverWidgetState createState() => _ImageGallarySaverWidgetState();
}

class _ImageGallarySaverWidgetState extends State<ImageGallarySaverWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:[
          Text("Save Gallary Image Saver "),
          Image.asset('images/owl.jpg'),
          // Image.network('https://dnsk.jp/wp/wp-content/uploads/2018/05/blog_01.jpg')
          // TextButton(onPressed: (){
          //
          // }, child: Text("画像を保存"))
          
        ]
            
      ),
    );
  }
}
