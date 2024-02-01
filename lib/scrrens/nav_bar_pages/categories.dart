import 'package:flutter/material.dart';

class CategorisScreen extends StatefulWidget {
  const CategorisScreen({super.key});

  @override
  State<CategorisScreen> createState() => _CategorisScreenState();
}

class _CategorisScreenState extends State<CategorisScreen> {
  @override
  Widget build(BuildContext context) {
     return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.blue,
            child: Icon(
              Icons.abc,
            ),
          ),
        );
      },
    );
  }
}