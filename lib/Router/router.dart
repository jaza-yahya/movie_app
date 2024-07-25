import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/App/Details/View/detail_screen.dart';
import 'package:movieapp/App/Home/View/home_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation:HomeScreen.routeName,
  routes: [
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: DetailsScreen.routeName,
      builder: (context, state) => const DetailsScreen(),
    ),
  ],
);
