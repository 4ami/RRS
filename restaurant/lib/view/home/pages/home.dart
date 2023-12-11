import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/shared/constants.dart';
import 'package:restaurant/data/repositories/delete_reservation_repo.dart';
import 'package:restaurant/data/repositories/table_reservation_repository.dart';
import 'package:restaurant/view/home/widget/card.dart';
import 'package:restaurant/view/home/widget/manage_reservation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Body();
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 12,
          title: Text(
            "Welcome",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
          bottom: TabBar(
            tabs: [
              Text(
                'Home',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
              ),
              Text(
                'Manage Reservation',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
              ),
            ],
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
        body: TabBarView(
          children: [
            SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const Image(image: AssetImage(logo), height: 300),
                    Expanded(
                      flex: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => context.go('/home/menu'),
                            child: const CustomCard(
                              image: menuIllustration,
                              text: "Browse Menu",
                            ),
                          ),
                          const SizedBox(width: 30),
                          GestureDetector(
                            onTap: () => context.go('/home/table-reservation'),
                            child: const CustomCard(
                              image: tableIllustration,
                              text: "Reserve Table",
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            MultiRepositoryProvider(
              providers: [
                RepositoryProvider(create: (context) => GetReservationRepo()),
                RepositoryProvider(
                    create: (context) => DeleteReservationRepo()),
              ],
              child: const ManageReservationWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
