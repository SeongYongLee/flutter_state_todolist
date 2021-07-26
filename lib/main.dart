import 'package:flutter/material.dart';

import 'package:flutter_state_todolist/page/home.dart';
import 'package:flutter_state_todolist/page/bloc/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome State TodoList',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/bloc': (context) => BlocPage(),
      },
    );
  }
}
