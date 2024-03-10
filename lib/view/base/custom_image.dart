import 'package:flutter/cupertino.dart';
import 'package:isletestapp/util/images.dart';

// import 'package:job_care_bd/util/images.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double? height;
  final double ?width;
  final BoxFit ?fit;
  final String placeholder;
  CustomImage({required this.image, this.height, this.width, this.fit, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: Images.placeholder, height: height, width: width, fit: fit,
      image: image,
      imageErrorBuilder: (c, o, s) => Image.asset(
        placeholder != null ? placeholder : Images.placeholder,
        height: height, width: width, fit: fit,
      ),
    );
  }
}
