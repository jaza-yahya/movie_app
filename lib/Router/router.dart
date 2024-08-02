import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/App/Details/View/detail_screen.dart';
import 'package:movieapp/App/Home/View/home_screen.dart';
import 'package:movieapp/App/Search/search_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: HomeScreen.routeName,
  routes: [
    GoRoute(
      path: HomeScreen.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
        path: DetailsScreen.routeName,
        pageBuilder: (context, state) {
          final movieId = state.extra as int;
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 300),
            reverseTransitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: DetailsScreen(
              movieId: movieId,
            ),
          );
        }),
    GoRoute(
        path: SearchPage.routeName,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 300),
            reverseTransitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: const SearchPage(),
          );
        }),
  ],
);
