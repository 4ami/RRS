import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/shared/constants.dart';
import 'package:restaurant/core/shared/loading.dart';
import 'package:restaurant/data/models/menu.dart';
import 'package:restaurant/data/repositories/menu_repository.dart';
import 'package:restaurant/view/home/bloc/menu/browse_menu_bloc.dart';
import 'package:restaurant/view/home/bloc/menu/browse_menu_state.dart';
import 'package:restaurant/view/home/bloc/menu/menu_event.dart';
import 'package:restaurant/view/home/bloc/menu/menu_state.dart';
import 'package:restaurant/view/home/widget/appetizers.dart';
import 'package:restaurant/view/home/widget/beverages.dart';
import 'package:restaurant/view/home/widget/desserts.dart';
import 'package:restaurant/view/home/widget/main_course.dart';
import 'package:restaurant/view/home/widget/salads.dart';
import 'package:restaurant/view/home/widget/tabs.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BrowseMenuBloc(menuRepo: context.read<GetMenuItems>()),
      child: const Body(),
    );
  }
}

Future<List<MenuItem>> test() async => [];

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final tabHeaders = tabs(context);
    final state = context.read<BrowseMenuBloc>();
    state.add(BrowsMenuEvent());
    return DefaultTabController(
      length: tabHeaders.length,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () => context.go('/home'),
          ),
          toolbarHeight: 150,
          elevation: 12,
          title: Text(
            "Restaurant Menu",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
          bottom: TabBar(
            tabs: tabHeaders,
            isScrollable: true,
            indicatorColor: const Color(0xff1A5F7A),
            indicatorWeight: 6,
            enableFeedback: false,
            overlayColor: MaterialStatePropertyAll(
                const Color(0xff1A5F7A).withOpacity(.4)),
            splashBorderRadius: BorderRadius.circular(20),
            splashFactory: InkRipple.splashFactory,
          ),
        ),
        body: BlocBuilder<BrowseMenuBloc, BrowseMenuState>(
          builder: (context, state) {
            if (state.menuState is FailedBrowseMenuState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(errorIllustration),
                      height: 150,
                    ),
                    Text(
                      "Oops! Something goes wrong 🤔.\nTry again later.",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: const Color(0xffF47C7C), fontSize: 25),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              );
            } else if (state.menuState is SuccessfulBrowseMenuState) {
              return TabBarView(
                children: [
                  Appetizers(appetizers: state.menuItems),
                  MainCourse(mainCourseItems: state.menuItems),
                  Desserts(desserts: state.menuItems),
                  Beverages(beveragesItems: state.menuItems),
                  Salads(saladItems: state.menuItems),
                ],
              );
            } else {
              return const Loading();
            }
          },
        ),
      ),
    );
  }
}
