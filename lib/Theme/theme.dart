import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3:true,
  scaffoldBackgroundColor:Colors.white,
  primaryColor: Colors.black87,
  appBarTheme: const AppBarTheme(
    surfaceTintColor:Colors.transparent,
    backgroundColor:Colors.white,
  
  ),
  textTheme:  TextTheme(
    titleLarge: const TextStyle(color: Colors.black87),
    bodyMedium: TextStyle(color: Colors.grey.shade600,
    fontWeight: FontWeight.w500
    ),
  ),
);