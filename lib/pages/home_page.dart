// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial/pages/home_widgets/catalog_header.dart';
import 'package:flutter_tutorial/pages/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_tutorial/models/catalog.dart';

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
    await Future.delayed(const Duration(seconds: 2));
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
        backgroundColor: Colors.blueGrey[50],
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const CatalogHeader(),
                if (CatalogModel.item != null && CatalogModel.item.isNotEmpty)
                  const CatalogList().expand()
                else
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        ));
  }
}
