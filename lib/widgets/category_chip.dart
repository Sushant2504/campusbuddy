import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String category;
  final String selectedCategory;
  final Function(String) onSelected;

  CategoryChip({required this.category, required this.selectedCategory, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(category, style: TextStyle(color: selectedCategory == category ? Colors.white : Colors.black)),
      selected: selectedCategory == category,
      selectedColor: Color(0xFF283891),
      backgroundColor: Colors.grey.shade200,
      onSelected: (bool selected) {
        if (selected) onSelected(category);
      },
    );
  }
}
