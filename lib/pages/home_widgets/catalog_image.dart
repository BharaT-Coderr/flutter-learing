import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p8
        .color(MyTheme.greyishWhite)
        .make()
        .p16()
        .w40(context);
  }
}
