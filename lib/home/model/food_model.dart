class FoodGroup {
  final String name;
  final List<FoodItem> list;
  
  FoodGroup({
    required this.name,
    required this.list
  });
}

class FoodItem {
  final String name;
  final String image;
  final String detail;
  final num price;

  FoodItem({
    required this.name,
    required this.image,
    required this.detail,
    required this.price
  });

}