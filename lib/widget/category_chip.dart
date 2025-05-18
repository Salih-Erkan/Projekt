import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final String label;
  final bool selected;
  final VoidCallback? onTap; // <-- NEU hinzugefügt

  const CategoryChip({
    super.key,
    this.icon,
    this.imagePath,
    required this.label,
    this.selected = false,
    this.onTap, // <-- NEU hinzugefügt
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // <-- Hinzugefügt, damit `onTap` funktioniert
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFFE6C7) : Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            if (icon != null) Icon(icon, color: Colors.deepOrange, size: 22),
            if (imagePath != null)
              Image.asset(imagePath!, width: 26, height: 26),
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
    );
  }
}
