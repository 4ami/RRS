import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/data/models/menu.dart';

class DishInfo extends StatelessWidget {
  const DishInfo({super.key, required this.item});
  final MenuItem item;
  String _setCategory() {
    if (item.category == Categories.mainCourse) {
      return 'Main Course';
    } else if (item.category == Categories.appetizers) {
      return 'Appetizers';
    } else if (item.category == Categories.desserts) {
      return 'Desserts';
    } else if (item.category == Categories.beverages) {
      return 'Beverages';
    } else if (item.category == Categories.salads) {
      return 'Salads';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const SizedBox(), toolbarHeight: 0),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * .5,
              pinned: true,
              primary: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                  image: NetworkImage(item.imageURL),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  opacity: const AlwaysStoppedAnimation(.4),
                ),
                title: Text(
                  item.dish,
                  // textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 30),
                ),
              ),
              leading: BackButton(
                color: Colors.white,
                style:
                    const ButtonStyle(iconSize: MaterialStatePropertyAll(35)),
                onPressed: () => context.pop(),
              ),
              backgroundColor: const Color(0xff159895).withOpacity(.3),
              elevation: 12,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 9, 0),
                        height: 100,
                        width: MediaQuery.of(context).size.width * .98,
                        decoration: BoxDecoration(
                            color: const Color(0xff57C5B6).withOpacity(.2),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(50),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.2),
                                  offset: const Offset(0, 0),
                                  blurRadius: 2,
                                  blurStyle: BlurStyle.solid)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Dish Information',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      CustomText(
                        subText: _setCategory(),
                        label: 'Dish Category',
                      ),
                      CustomText(
                        subText: item.kitchen,
                        label: 'Dish Kitchen',
                      ),
                      CustomText(
                        subText: item.dishDesc,
                        label: 'Dish Description',
                      ),
                      CustomText(
                        subText: '${item.calories.round().toString()} cal',
                        label: 'Calories',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade800,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "${item.price.toStringAsFixed(2)} SAR",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.label,
    required this.subText,
  });

  final String subText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            text: "$label: ",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: const Color(0xff159895), fontSize: 25),
            children: [
              TextSpan(
                text: subText,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
