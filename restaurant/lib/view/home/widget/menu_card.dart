import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/data/models/menu.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.menuItem});
  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/home/menu/dish-info', extra: menuItem),
      child: Card(
        color: const Color.fromARGB(97, 0, 0, 0),
        shadowColor: const Color(0xffF47C7C),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              opacity: .6,
              image: NetworkImage(menuItem.imageURL),
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            primary: false,
            reverse: true,
            children: [
              ColoredBox(
                color: const Color(0xff57C5B6).withOpacity(.7),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
                  title: Text(
                    menuItem.dish,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                  ),
                  subtitle: Text(
                    '${menuItem.price.toStringAsFixed(2)} SAR',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
