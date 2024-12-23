import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.data,
    required this.onPressed,
  });

  final String data;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        fixedSize: Size(width * 0.9, 50),
      ),
      child: Text(
        data,
        style: const TextStyle(
          fontSize: 25,
          color: Color(0xffffffff),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
