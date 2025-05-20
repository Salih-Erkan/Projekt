import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const CategoryChip({
    super.key,
    required this.imagePath,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        color: selected ? const Color(0xFFFFE6C7) : Colors.white,
        margin: const EdgeInsets.only(right: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Image.asset(imagePath, width: 30, height: 30),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.deepOrange : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
