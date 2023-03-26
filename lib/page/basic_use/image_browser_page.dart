import 'package:flutter/material.dart';
import 'package:flutter_playground/constants/constants.dart';
import 'package:flutter_playground/constants/transparent_image.dart';

class ImageBrowserPage extends StatelessWidget {
  const ImageBrowserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageBrowser = _ImageBrowser(
      globalKey: GlobalKey<_ImageBrowserState>(),
      images: Constants.imagesUrl,
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
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                child: imageBrowser,
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
            Padding(
              child: Row(
                children: [buttonPrevious, buttonNext],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
            )
          ],
        ),
      ),
    );
  }
}

class _ImageBrowser extends StatefulWidget {
  final GlobalKey<_ImageBrowserState> globalKey;
  final List<String> images;

  const _ImageBrowser({required this.globalKey, required this.images})
      : super(key: globalKey);

  @override
  _ImageBrowserState createState() => _ImageBrowserState();

  previousImage() => globalKey.currentState?.previousImage();
  nextImage() => globalKey.currentState?.nextImage();
}

class _ImageBrowserState extends State<_ImageBrowser> {
  int _imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(child: CircularProgressIndicator()),
        FadeInImage.memoryNetwork(
          height: double.maxFinite,
          width: double.maxFinite,
          placeholder: kTransparentImage,
          image: widget.images[_imageIndex],
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  previousImage() {
    // 如果到達未端，就從另一端開始計數。
    setState(() {
      _imageIndex =
          _imageIndex == 0 ? widget.images.length - 1 : _imageIndex - 1;
    });
  }

  nextImage() {
    setState(() {
      _imageIndex = ++_imageIndex % widget.images.length;
    });
  }
}
