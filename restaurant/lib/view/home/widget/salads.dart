import 'package:flutter/widgets.dart';
import 'package:restaurant/data/models/menu.dart';
import 'package:restaurant/view/home/widget/menu_card.dart';

class Salads extends StatefulWidget {
  const Salads({super.key, required this.saladItems});

  final List<MenuItem> saladItems;
  @override
  State<Salads> createState() => _SaladsState();
}

class _SaladsState extends State<Salads> {
  @override
  Widget build(BuildContext context) {
    final List<MenuItem> salads = widget.saladItems
        .where((element) => element.category == Categories.salads)
        .toList();
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: salads.length,
      itemBuilder: (context, index) =>
          MenuCard(menuItem: salads[index]),
    );
  }
}