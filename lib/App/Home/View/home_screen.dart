import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/movies_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: const Text(
            "Trending Movies",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.search,
                color: Colors.black,
                size: 32,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ],
        ),
        body: ListView.separated(
          itemCount: 10,
          padding: const EdgeInsets.all(16),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return const MoviesCardWidget();
          },
        ));
  }
}
