import 'package:flutter/widgets.dart';
import 'package:restaurant/data/models/menu.dart';
import 'package:restaurant/view/home/widget/menu_card.dart';

class Beverages extends StatefulWidget {
  const Beverages({super.key, required this.beveragesItems});

  final List<MenuItem> beveragesItems;
  @override
  State<Beverages> createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {
  @override
  Widget build(BuildContext context) {
    final List<MenuItem> beverages = widget.beveragesItems
        .where((element) => element.category == Categories.beverages)
        .toList();
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: beverages.length,
      itemBuilder: (context, index) =>
          MenuCard(menuItem: beverages[index]),
    );
  }
}