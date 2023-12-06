import 'package:flutter/widgets.dart';
import 'package:restaurant/data/models/menu.dart';
import 'package:restaurant/view/home/widget/menu_card.dart';

class MainCourse extends StatefulWidget {
  const MainCourse({super.key, required this.mainCourseItems});

  final List<MenuItem> mainCourseItems;
  @override
  State<MainCourse> createState() => _MainCourseState();
}

class _MainCourseState extends State<MainCourse> {
  @override
  Widget build(BuildContext context) {
    final List<MenuItem> mainCourse = widget.mainCourseItems
        .where((element) => element.category == Categories.mainCourse)
        .toList();
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: mainCourse.length,
      itemBuilder: (context, index) =>
          MenuCard(menuItem: mainCourse[index]),
    );
  }
}
