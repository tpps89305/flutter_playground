import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../constants/constants.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _gallery = _GalleryWrapper(
      globalKey: GlobalKey<_GalleryWrapperState>(),
      images: Constants.images,
      backgroundDecoration: const BoxDecoration(color: Colors.black),
      initialIndex: 0,
      minScale: 0.1,
      maxScale: 2,
      scrollDirection: Axis.horizontal,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("相簿")),
      body: _gallery,
    );
  }
}

class _GalleryWrapper extends StatefulWidget {
  final GlobalKey<_GalleryWrapperState> globalKey;
  List<String> images;
  BoxDecoration backgroundDecoration;
  int? initialIndex;
  double? minScale;
  double? maxScale;
  Axis scrollDirection;
  int? imageIndex;

  _GalleryWrapper({
    required this.globalKey,
    required this.images,
    required this.backgroundDecoration,
    required this.initialIndex,
    required this.minScale,
    required this.maxScale,
    required this.scrollDirection,
  }) : super(key: globalKey) {
    imageIndex = initialIndex;
  }

  @override
  _GalleryWrapperState createState() => _GalleryWrapperState();
}

class _GalleryWrapperState extends State<_GalleryWrapper> {
  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    return PhotoViewGalleryPageOptions(
      imageProvider: AssetImage(widget.images[index]),
      initialScale: PhotoViewComputedScale.contained,
      minScale: widget.minScale,
      maxScale: widget.maxScale,
    );
  }

  void _onPageChange(int index) {
    setState(() {
      widget.imageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        PhotoViewGallery.builder(
          itemCount: widget.images.length,
          builder: _buildItem,
          scrollPhysics: const BouncingScrollPhysics(),
          enableRotation: true,
          backgroundDecoration: widget.backgroundDecoration,
          pageController: PageController(initialPage: widget.initialIndex!),
          onPageChanged: _onPageChange,
          scrollDirection: widget.scrollDirection,
        ),
        Container(
          margin: const EdgeInsets.all(50),
          child: Text(
            Constants.images[widget.imageIndex!],
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    );
  }
}
