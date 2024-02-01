import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Color color;
  final void Function()? onTap;
  final double width;
  const AppButton({
    Key? Key,
    required this.label,
    required this.color,
    this.onTap, 
    this.width = 280,
    }) : super(key: Key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}