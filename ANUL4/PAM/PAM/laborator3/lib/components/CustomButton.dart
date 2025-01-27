import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  final bool isSelected;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width = 60,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.grey,
          backgroundColor: isSelected ? Colors.blue : Colors.white,
          side: BorderSide(color: isSelected ? Colors.blue : Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 4, 4, 4),
          ),
        ),
      ),
    );
  }
}
