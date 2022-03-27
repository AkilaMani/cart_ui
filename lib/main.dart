import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zupay/provider/cart_provider.dart';

import 'view/home.dart';

void main() {
  runApp(MyApp());
}

// stateless widget created
class MyApp extends StatelessWidget {
// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> CartProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Home(),
        // home: NewArrival(),
      ),
    );
  }
}
