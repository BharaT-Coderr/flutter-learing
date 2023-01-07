import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/cartModel.dart';
import 'package:flutter_tutorial/models/catalog.dart';
import 'package:flutter_tutorial/pages/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.imageurl)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.lg.color(context.accentColor).make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  _AddToCart(catalog: catalog),
                ],
              ).pOnly(right: 8.0),
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
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
      child: isAdded ? const Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
