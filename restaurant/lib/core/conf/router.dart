import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/data/models/menu.dart';
import 'package:restaurant/data/repositories/auth_repo.dart';
import 'package:restaurant/data/repositories/menu_repository.dart';
import 'package:restaurant/data/repositories/table_reservation_reository.dart';
import 'package:restaurant/view/authentication/page/sign.dart';
import 'package:restaurant/view/home/pages/dish_info.dart';
import 'package:restaurant/view/home/pages/home.dart';
import 'package:restaurant/view/home/pages/menu.dart';
import 'package:restaurant/view/home/pages/table_reservation.dart';
import 'package:restaurant/view/on_boarding/splash.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const Splash()),
    GoRoute(
      path: '/sign',
      builder: (context, state) => RepositoryProvider(
        create: (context) => AuthRepository(),
        child: const Sign(),
      ),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/home/table-reservation',
      builder: (context, state) => RepositoryProvider(
        create: (context) => GetTables(),
        child: const TableReservation(),
      ),
    ),
    GoRoute(
      path: '/home/menu',
      builder: (context, state) => RepositoryProvider(
        create: (context) => GetMenuItems(),
        child: const Menu(),
      ),
    ),
    GoRoute(
      path: '/home/menu/dish-info',
      pageBuilder: (context, state) => MaterialPage(
          child: DishInfo(
        item: state.extra! as MenuItem,
      )),
    )
  ],
);
