import 'package:flutter/material.dart';
import 'package:to_do_list/pages/to_do_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const ToDoListPage(),
    );
  }
}