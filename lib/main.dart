import 'package:todo/MainPage/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_models/app_view_model.dart';
import 'package:todo/views/task_page.dart%20';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(), // Ana sayfa olarak kullanılacak widget
    );
  }
}

