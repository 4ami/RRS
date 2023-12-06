import 'package:flutter/widgets.dart';
import 'package:restaurant/data/models/menu.dart';
import 'package:restaurant/view/home/widget/menu_card.dart';

class Desserts extends StatefulWidget {
  const Desserts({super.key, required this.desserts});

  final List<MenuItem> desserts;
  @override
  State<Desserts> createState() => _DessertsState();
}

class _DessertsState extends State<Desserts> {
  @override
  Widget build(BuildContext context) {
    final List<MenuItem> dessertsItems = widget.desserts
        .where((element) => element.category == Categories.desserts)
        .toList();
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: dessertsItems.length,
      itemBuilder: (context, index) =>
          MenuCard(menuItem: dessertsItems[index]),
    );
  }
}