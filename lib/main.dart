import 'package:api_with_provider/provider/store_provider.dart';
import 'package:api_with_provider/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => StoreProvider(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: Home(),
      )
    );
  }
}
