import 'package:flutter/material.dart';

class RoundedWebImageWidget extends StatelessWidget {
  final double size;
  final String url;

  const RoundedWebImageWidget({Key? key, required this.size, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
      ),
    );
  }
}

class RoundedAssetImageWidget extends StatelessWidget {
  final double size;
  final String path;

  const RoundedAssetImageWidget({Key? key, required this.size, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      ),
    );
  }
}
