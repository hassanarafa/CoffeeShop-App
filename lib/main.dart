import 'package:coffee_shop/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/coffee_shop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Coffeeshop(),
        builder: (context, child) => const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            ));
  }
}
