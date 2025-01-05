import 'package:flutter/material.dart';
import 'package:my_dorm/constant/constant.dart';

class FormDropDown extends StatefulWidget {
  // List of items for the dropdown
  final List<String> kategoriItems;
  final String title;
  final ValueChanged<String?> onItemSelected; // Callback for selected item

  const FormDropDown({
    super.key,
    required this.kategoriItems,
    required this.title,
    required this.onItemSelected, // Initialize the callback
  });

  @override
  State<FormDropDown> createState() => _FormDropDownState();
}

class _FormDropDownState extends State<FormDropDown> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButtonFormField<String>(
        style: kMediumTextStyle.copyWith(fontSize: 16, color: Colors.black),
        decoration: basicInputDecoration(widget.title),
        value: selectedItem,
        icon: const Icon(Icons.arrow_drop_down),
        isExpanded: true,
        items: widget.kategoriItems.map((String category) {
          return DropdownMenuItem<String>(
            value: category,
            child: Text(category),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            selectedItem = newValue;
          });
          widget.onItemSelected(newValue); // Call the callback with the new value
        },
      ),
    );
  }
}
