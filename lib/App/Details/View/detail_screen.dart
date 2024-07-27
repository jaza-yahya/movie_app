import 'package:flutter/material.dart';
import 'package:movieapp/Router/router.dart';
import 'package:movieapp/Utility/helpers.dart';

import '../Widgets/bottom_buttons_widget.dart';
import '../Widgets/details_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerTheme: const DividerThemeData(
          color: Colors.transparent,
        ),
      ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {
                  router.pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black87,
                  size: 32,
                ),
              ),
              pinned: true,
              backgroundColor: Colors.white,
              expandedHeight: scrennWidth(context),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  "https://upload.wikimedia.org/wikipedia/en/1/1c/The_Dark_Knight_%282008_film%29.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        DetailsWidget(),
                        SizedBox(height: 32),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        persistentFooterButtons: const [
          BottomButtonsWidget(),
        ],
      ),
    );
  }
}

