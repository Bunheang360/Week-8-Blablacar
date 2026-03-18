import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import './ui/screens/home/home_screen.dart';


///
/// Launch the application with the given list of providers
///
void mainCommon(List<SingleChildWidget> providers) {
  runApp(
    MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Material(child: HomeScreen())),
    ),
  );
}