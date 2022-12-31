class CatalogModel {
  static final item = [
    Item(
        id: 1,
        name: "iPhone 13 Pro",
        desc: "Apple iPhone 13th generation",
        price: 999,
        color: "#00ac51",
        imageUrl:
            "https://e7.pngegg.com/pngimages/599/150/png-clipart-iphone-x-front-view-apple%E6%89%8B%E6%9C%BA-iphone.png")
  ];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.imageUrl});
}
