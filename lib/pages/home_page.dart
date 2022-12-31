import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial/models/catalog.dart';
import 'package:flutter_tutorial/widgets/drawer.dart';
import 'dart:convert';

import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int day = 1;

  final String name = "Bharat";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDate();
  }

  loadDate() async {
    await Future.delayed(Duration(seconds: 2));
    // TODO: implement loadDate
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["item"];
    CatalogModel.item = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shoppi"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          // ignore: unnecessary_null_comparison
          child: (CatalogModel.item != null && CatalogModel.item.isNotEmpty)
              ? ListView.builder(
                  itemCount: CatalogModel.item.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      item: CatalogModel.item[index],
                    );
                  },
                )
              // ignore: prefer_const_constructors
              : Center(
                  child: const CircularProgressIndicator(),
                )),
      drawer: const MyDrawer(),
    );
  }
}
