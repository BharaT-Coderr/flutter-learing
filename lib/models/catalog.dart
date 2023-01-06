class CatalogModel {
  static List<Item> item = [
    Item(
        id: 1,
        name: "iPhone 13 Pro",
        desc: "Apple iPhone 13th generation",
        price: 999,
        color: "#00ac51",
        imageurl:
            "https://e7.pngegg.com/pngimages/599/150/png-clipart-iphone-x-front-view-apple%E6%89%8B%E6%9C%BA-iphone.png")
  ];

  //Get Item by ID
  static Item getById(int id) =>
      item.firstWhere((element) => element.id == id, orElse: null);

  // Get Item by position
  static Item getByposition(int position) => item[position];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageurl;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.imageurl});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        imageurl: map["imageurl"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "imageurl": imageurl
      };
}
