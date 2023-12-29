import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/23_12_29/mask/ui/main_page.dart';
import 'package:untitled/23_12_29/mask/view_model/store_model.dart';

void main() {
  runApp(ChangeNotifierProvider.value(
    value: StoreModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
