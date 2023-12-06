enum Categories { mainCourse, appetizers, desserts, beverages, salads, init }

class MenuItem {
  final String id;
  final Categories category;
  final String kitchen;
  final String dish;
  final String dishDesc;
  final double calories;
  final double price;
  final String imageURL;

  const MenuItem({
    required this.id,
    required this.category,
    required this.kitchen,
    required this.dish,
    required this.dishDesc,
    required this.calories,
    required this.price,
    required this.imageURL,
  });

  factory MenuItem.fromJson(Map<String, dynamic> item) {
    return MenuItem(
        id: item['id'],
        kitchen: item['kitchen'],
        dish: item['dish'],
        dishDesc: item['dish_desc'],
        calories: (item['calories']).toDouble(),
        price: (((item['price']).toDouble()) * 3.75),
        imageURL: item['image'],
        category: item['category'] == 'Main Course'
            ? Categories.mainCourse
            : (item['category'] == 'Appetizers'
                ? Categories.appetizers
                : (item['category'] == 'Desserts')
                    ? Categories.desserts
                    : (item['category'] == 'Beverages'
                        ? Categories.beverages
                        : Categories.salads)));
  }

  set category(categories) => category = categories;
}
