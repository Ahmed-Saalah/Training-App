import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/item_card_widget.dart';
import '../ProductDetailsScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> productNames = [
    "Dell",
    "Lenovo",
    "HP",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productNames.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                          productName: productNames[index],
                        )),
              );
            },
            child: ItemCard(productName: productNames[index]));
      },
    );
  }
}