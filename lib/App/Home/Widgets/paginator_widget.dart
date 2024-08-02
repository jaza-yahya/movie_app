import 'package:flutter/material.dart';
import 'package:movieapp/Shared/Preferences/preferences.dart';
import 'package:movieapp/Shared/Providers/network_provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../Shared/Providers/movies_provider.dart';

class PaginatorWidget extends StatelessWidget {
  const PaginatorWidget({
    super.key,
    required DataPagerController dataPagerController,
    required this.moviesProvider,
    required this.totalPages,
  }) : _dataPagerController = dataPagerController;

  final DataPagerController _dataPagerController;
  final MoviesProvider moviesProvider;
  final int? totalPages;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SfDataPagerTheme(
        data: const SfDataPagerThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.amber,
          itemTextStyle: TextStyle(
            color: Colors.black87,
          ),
          selectedItemTextStyle: TextStyle(
            color: Colors.black87,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 50,
                  spreadRadius: 0,
                  offset: Offset(0, 0),
                ),
              ]),
          child: SfDataPager(
            controller: _dataPagerController,
            initialPageIndex: _dataPagerController.selectedPageIndex,
            pageCount: (totalPages ?? 0) > 0 ? totalPages!.toDouble() : 1,
            delegate: DataPagerDelegate(),
            lastPageItemVisible: false,
            firstPageItemVisible: false,
            onPageNavigationEnd: (value) async {
             
              if (NetworkProvider.to.isConnected) {
                await moviesProvider.fetchMovies(page: value + 1);
              } else {
                moviesProvider
                    .setMovies(await MoviesPreferences.to.getMovies(value + 1));
              }
            },
          ),
        ),
      ),
    );
  }
}
