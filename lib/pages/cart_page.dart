import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/cartModel.dart';
import 'package:velocity_x/velocity_x.dart';

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
          const _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(context.accentColor).make(),
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

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        // ignore: prefer_const_constructors
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {},
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}
