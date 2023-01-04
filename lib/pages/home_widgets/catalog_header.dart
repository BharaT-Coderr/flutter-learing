import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.bold.color(MyTheme.veryDarkBlue).xl5.make(),
        "Trending Products".text.bold.color(MyTheme.veryDarkBlue).xl2.make(),
      ],
    );
  }
}
