import 'package:api_bloc/component/component_card_list.dart';
import 'package:api_bloc/page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  print('1. main');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('2. MyApp');
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: SafeArea(child: HomePage()),
          backgroundColor: Colors.amber,
        ));
  }
}
