import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cartModel.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ? true : false;
    return ElevatedButton(
      onPressed: (() {
        if (!isInCart) {
          AddMutation(item: catalog);
        }
      }),
      style: ButtonStyle(
        backgroundColor:
            // ignore: deprecated_member_use
            MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
