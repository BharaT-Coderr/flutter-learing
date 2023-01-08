import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/cartModel.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.accentColor).bold.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal();

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            builder: (context, store, status) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.accentColor)
                  .make();
            },
            mutations: const {RemoveMutation},
            notifications: const {},
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: context.cardColor,
                  content: "Buying not supported yet."
                      .text
                      .xl
                      .color(context.accentColor)
                      .make()
                      .pOnly(left: 10),
                ),
              );
            },
            style: ButtonStyle(
                // ignore: deprecated_member_use
                backgroundColor:
                    // ignore: deprecated_member_use
                    MaterialStateProperty.all(context.theme.buttonColor),
                shape: MaterialStateProperty.all(const StadiumBorder())),
            child: "Buy Now".text.make(),
          ).wh(100, 40),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? "Nothing to show".text.color(context.accentColor).xl4.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              // ignore: prefer_const_constructors
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  RemoveMutation(item: _cart.items[index]);
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
