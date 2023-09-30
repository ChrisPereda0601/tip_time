import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_time/home_page.dart';
import 'package:tip_time/tip_time_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        home: ChangeNotifierProvider(
          create: (context) => TipTimeProvider(),
          child: HomePage(),
        ));
  }
}
