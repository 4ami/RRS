import 'package:flutter/widgets.dart';
import 'package:restaurant/data/models/menu.dart';
import 'package:restaurant/view/home/widget/menu_card.dart';

class Appetizers extends StatefulWidget {
  const Appetizers({super.key, required this.appetizers});

  final List<MenuItem> appetizers;
  @override
  State<Appetizers> createState() => _AppetizersState();
}

class _AppetizersState extends State<Appetizers> {
  @override
  Widget build(BuildContext context) {
    final List<MenuItem> appetizers = widget.appetizers
        .where((element) => element.category == Categories.appetizers)
        .toList();
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: appetizers.length,
      itemBuilder: (context, index) =>
          MenuCard(menuItem: appetizers[index]),
    );
  }
}