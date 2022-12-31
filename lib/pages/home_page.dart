import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/catalog.dart';
import 'package:flutter_tutorial/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int day = 1;
  final String name = "Bharat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shoppi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogModel.item.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.item[index],
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
