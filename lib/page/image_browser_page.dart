import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ImageBrowserPage extends StatelessWidget {
  const ImageBrowserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageBrowser = _ImageBrowser(
      globalKey: GlobalKey<_ImageBrowserState>(),
      images: Constants.images,
    );
    final buttonPrevious = IconButton(
      onPressed: () {
        imageBrowser.previousImage();
      },
      icon: const Icon(Icons.arrow_back_ios_rounded),
    );
    final buttonNext = IconButton(
      onPressed: () {
        imageBrowser.nextImage();
      },
      icon: const Icon(Icons.arrow_forward_ios_rounded),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("圖片瀏覽"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: imageBrowser,
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            Container(
              child: Row(
                children: [buttonPrevious, buttonNext],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
            )
          ],
        ),
      ),
    );
  }
}

class _ImageBrowser extends StatefulWidget {
  final GlobalKey<_ImageBrowserState> globalKey;
  List<String> images;
  int _imageIndex = 0;

  _ImageBrowser({required this.globalKey, required this.images})
      : super(key: globalKey);

  @override
  _ImageBrowserState createState() => _ImageBrowserState();

  previousImage() => globalKey.currentState?.previousImage();
  nextImage() => globalKey.currentState?.nextImage();
}

class _ImageBrowserState extends State<_ImageBrowser> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(widget.images[widget._imageIndex]);
  }

  previousImage() {
    // 如果到達未端，就從另一端開始計數。
    setState(() {
      widget._imageIndex = widget._imageIndex == 0
          ? widget.images.length - 1
          : widget._imageIndex - 1;
    });
  }

  nextImage() {
    setState(() {
      widget._imageIndex = ++widget._imageIndex % widget.images.length;
    });
  }
}
