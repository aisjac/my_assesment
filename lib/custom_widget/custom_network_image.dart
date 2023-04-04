import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class CustomNetworkImage extends StatelessWidget {
  final String networkImagePath;
  final String? placeHolderPath;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CustomNetworkImage(
      {Key? key,
      required this.networkImagePath,
      this.placeHolderPath,
      this.height,
      this.width,
      this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: networkImagePath,
      fit: fit,
      placeholder: (context, url) => Image.asset(
        placeHolderPath ?? "assets/images/placeholder.png",
        fit: fit,
        height: height,
        width: width,
      ),
      errorWidget: (context, url, error) => Image.asset(
        placeHolderPath ?? "assets/images/placeholder.png",
        fit: fit,
        height: height,
        width: width,
      ),
    );
  }
}
