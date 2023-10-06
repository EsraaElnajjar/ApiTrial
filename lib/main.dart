import 'package:apistoretrial/screens/homePage.dart';
import 'package:apistoretrial/screens/update_product_page.dart';
import 'package:apistoretrial/services/update_product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id : (context) => HomePage(),
        UpdateProductPage.id : (context) => UpdateProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }}