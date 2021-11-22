class FoodGroup {
  final String name;
  final List<FoodItem> list;
  
  FoodGroup({
    required this.name,
    required this.list
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'list': list.map((item) => item.toJson())
  };

  Map<String, dynamic> toJsonRefItem() => {
    'name': name,
    'list': list.map((item) => item.id).toList()
  };
}

class FoodItem {
  final String id;
  final String name;
  final String image;
  final String detail;
  final num price;
  num amount;

  FoodItem({
    required this.id,
    required this.name,
    required this.image,
    required this.detail,
    required this.price,
    required this.amount
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
    id: json['id'],
    amount: json['amount'],
    detail: json['detail'],
    image: json['image'],
    name: json['name'],
    price: json['price']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'detail': detail,
    'price': price,
    'amount': amount
  };

  Map<String, dynamic> updateAmount() => {
    'amount': amount
  };

}