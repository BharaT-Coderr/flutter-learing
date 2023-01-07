// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/catalog.dart';

import 'package:velocity_x/velocity_x.dart';

import '../models/cartModel.dart';

class HomeDetialPage extends StatelessWidget {
  const HomeDetialPage({super.key, required this.catalog});
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            _AddToCart(catalog: catalog),
          ],
        ).p32(),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.imageurl),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl4
                          .color(context.accentColor)
                          .make(),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                      10.heightBox,
                      "Diam eirmod stet diam eirmod at est lorem sed diam, ipsum accusam duo justo lorem. Accusam et sed sadipscing et no sadipscing duo sed. Eos consetetur dolor sed nonumy dolore et at accusam, et stet aliquyam ea est voluptua at, ea stet et voluptua amet sanctus et clita amet. Sea."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16(),
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  _AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (() {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      }),
      style: ButtonStyle(
        backgroundColor:
            // ignore: deprecated_member_use
            MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
      child: isAdded ? const Icon(Icons.done) : "Add to cart".text.lg.make(),
    ).wh(120, 50);
  }
}
